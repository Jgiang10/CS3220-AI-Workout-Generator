package cs3220.ai_workout_generator.Controller;

import cs3220.ai_workout_generator.AiWorkoutService;
import cs3220.ai_workout_generator.Workout;
import cs3220.ai_workout_generator.WorkoutService;
import cs3220.ai_workout_generator.SessionUser;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.ai.chat.client.ChatClient;
import org.springframework.ai.chat.messages.AssistantMessage;
import org.springframework.ai.chat.messages.Message;
import org.springframework.ai.chat.messages.UserMessage;
import org.springframework.ai.chat.messages.SystemMessage;
import org.springframework.ai.chat.prompt.Prompt;
import cs3220.ai_workout_generator.AiExchange;

import java.util.List;
import java.util.ArrayList;
import java.util.stream.Collectors;

@Controller
public class WorkoutController {

    private final WorkoutService workouts;
    private final AiWorkoutService aiService;
    private final SessionUser sessionUser;
    private final ChatClient chatClient;
    private final List<AiExchange> history = new ArrayList<>();

    public WorkoutController(WorkoutService workouts,
                             AiWorkoutService aiService,
                             SessionUser sessionUser,
                             ChatClient.Builder chatClientBuilder) {
        this.workouts = workouts;
        this.aiService = aiService;
        this.sessionUser = sessionUser;
        this.chatClient = chatClientBuilder.build();
    }

    // -------------------------------
    // GET /generate  → show page
    // -------------------------------
    @GetMapping("/generate")
    public String showGenerate(Model model) {
        String username = sessionUser.isAuthenticated() ? sessionUser.getEmail() : null;
        model.addAttribute("username", username);   // used by home.jte
        model.addAttribute("prompt", "");
        model.addAttribute("result", null);
        model.addAttribute("workoutId", null);

        return "generate";   // src/main/jte/generate.jte
    }

    // -------------------------------
    // POST /generate → create workout
    // -------------------------------
    @PostMapping("/generate")
    public String handleGenerate(@RequestParam String prompt,
                                 Model model) {


        String username = sessionUser.isAuthenticated() ? sessionUser.getEmail() : null;
        // Call AI service to generate text
        String resultText;
        try {
            resultText = realChat(prompt);
        } catch (Exception e) {
            resultText = aiService.generateWorkoutText(prompt);
        }

        // Recording exchange for future uses so there aren't repeats
        history.add(new AiExchange(prompt, resultText));

        //testing without this
        // Save workout in in-memory repository
        //Workout saved = workouts.createAIWorkout(
        //        "Workout: " + prompt,
        //        resultText,
        //        username,
        //        username
        //);

        // Put everything back into the model for generate.jte
        model.addAttribute("username", username);
        model.addAttribute("prompt", prompt);
        model.addAttribute("result", resultText);
        // changed Long.valueOf(saved.getId()) to null for testing
        model.addAttribute("workoutId", null);

        return "generate";
    }

    // -------------------------------
    // GET /workouts → list user's workouts
    // -------------------------------
    @GetMapping("/workouts")
    public String listWorkouts(Model model) {
        if (!sessionUser.isAuthenticated()){
            return "redirect:/login";
        }
        String username = sessionUser.getEmail();
        List<Workout> myWorkouts = workouts.getWorkoutsByOwner(username);
        model.addAttribute("workouts", myWorkouts);

        return "workoutlist";   // src/main/jte/workoutlist.jte
    }

    // -------------------------------
    // GET /workouts/{id} → view one
    // -------------------------------
    @GetMapping("/workouts/{id}")
    public String viewWorkout(@PathVariable int id,
                              Model model) {
        if (!sessionUser.isAuthenticated()){
            return "redirect:/login";
        }

        Workout workout = workouts.getWorkoutById(id);
        if (workout == null) {
            // simple fallback – you can change to an error.jte if you have one
            return "redirect:/workouts";
        }

        model.addAttribute("workout", workout);

        return "workoutview";   // src/main/jte/workoutview.jte
    }

    @PostMapping("/save")
    public String saveWorkout(@RequestParam String prompt,
                              @RequestParam(required = false) String result) {
        if (!sessionUser.isAuthenticated()) {
            return "redirect:/login";
        }
        String username = sessionUser.getEmail();
        String content = (result == null || result.isBlank()) ? prompt : result;

        // New code
        List<Workout> existing = workouts.getWorkoutsByOwner(username).stream()
                .filter(w -> content.equals(w.getContent()))
                .collect(Collectors.toList());
        if (existing.isEmpty()) {
            workouts.createAIWorkout("Workout: " + prompt, content, username, username);
        }
        //End of new code
        // changed workouts to saved-workouts
        return "redirect:/saved-workouts";
    }

    @GetMapping("/saved-workouts")
    public String listSavedWorkouts(Model model) {
        if (!sessionUser.isAuthenticated()){
            return "redirect:/login";
        }
        String username = sessionUser.getEmail();
        List<Workout> myWorkouts = workouts.getWorkoutsByOwner(username);

        List<Workout> savedAi = myWorkouts.stream()
                .filter(w -> w.getExercises() == null && w.getContent() != null)
                .collect(Collectors.toList());
        model.addAttribute("username", username);
        model.addAttribute("workouts", savedAi);
        return "savedworkoutlist";   // src/main/jte/savedworkoutlist.jte
    }

    private String realChat(String message) {
        List<Message> messages = new ArrayList<>();
        for (var exchange : history) {
            messages.add(new UserMessage(exchange.getUserMessage()));
            messages.add(new AssistantMessage(exchange.getAiMessage()));
        }
        String systemMsg = """
        Output a mobile-friendly workout card for <original prompt>. The layout must be like this:

                Warm-up:
                - <warm up activity> <duration>
                - ... (more warm up activities)

                Workout:
                - <exercise 1> <sets>x<reps> <duration>
                - ... (more exercises depending on time)

                Cooldown:
                - <cooldown activity> <duration>
                
                After the workout include a final line: "Prompt: <original prompt>
        Keep total text <= 200 characters.
               
               """.formatted(message);
        messages.add(new SystemMessage(systemMsg));
        messages.add(new UserMessage(message));
        return chatClient.prompt(new Prompt(messages)).call().content();
    }
}
