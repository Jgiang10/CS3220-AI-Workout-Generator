package cs3220.ai_workout_generator.Controller;

import cs3220.ai_workout_generator.AiWorkoutService;
import cs3220.ai_workout_generator.Workout;
import cs3220.ai_workout_generator.WorkoutService;
import cs3220.ai_workout_generator.SessionUser;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class WorkoutController {

    private final WorkoutService workouts;
    private final AiWorkoutService aiService;
    private final SessionUser sessionUser;

    public WorkoutController(WorkoutService workouts, AiWorkoutService aiService, SessionUser sessionUser) {
        this.workouts = workouts;
        this.aiService = aiService;
        this.sessionUser = sessionUser;
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

        if (!sessionUser.isAuthenticated()) {
            return "redirect:/login";
        }

        String username = sessionUser.getEmail();
        // Call AI service to generate text
        String resultText = aiService.generateWorkoutText(prompt);

        // Save workout in in-memory repository
        Workout saved = workouts.createAIWorkout(
                "Workout: " + prompt,
                resultText,
                username,
                username
        );

        // Put everything back into the model for generate.jte
        model.addAttribute("username", username);
        model.addAttribute("prompt", prompt);
        model.addAttribute("result", resultText);
        model.addAttribute("workoutId", Long.valueOf(saved.getId()));

        return "generate";
    }

    // -------------------------------
    // GET /workouts → list user's workouts
    // -------------------------------
    @GetMapping("/workouts")
    public String listWorkouts(Model model) {
        if (!sessionUser.isAuthenticated()) {
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
        if (!sessionUser.isAuthenticated()) {
            return "redirect:/login";
        }

        Workout workout = workouts.getWorkoutById(id);
        if (workout == null) {
            // simple fallback – you can change to an error.jte if you have one
            return "redirect:/error";
        }

        model.addAttribute("workout", workout);

        return "workoutview";
    }
}