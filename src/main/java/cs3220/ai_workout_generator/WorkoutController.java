package cs3220.ai_workout_generator;

import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class WorkoutController {

    private final WorkoutService workouts;
    private final AiWorkoutService aiService;

    public WorkoutController(WorkoutService workouts, AiWorkoutService aiService) {
        this.workouts = workouts;
        this.aiService = aiService;
    }

    // -------------------------------
    // GET /generate  → show page
    // -------------------------------
    @GetMapping("/generate")
    public String showGenerate(Model model, HttpSession session) {
        User currentUser = (User) session.getAttribute("currentUser");

        model.addAttribute("bodyInfo", currentUser);  // used in generate.jte
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
                                 Model model,
                                 HttpSession session) {

        User currentUser = (User) session.getAttribute("currentUser");
        if (currentUser == null) {
            // if not logged in, send them to login
            return "redirect:/login";
        }

        // Call AI service to generate text
        String resultText = aiService.generateWorkoutText(prompt);

        // Save workout in in-memory repository
        Workout saved = workouts.createAIWorkout(
                "Workout: " + prompt,
                "Custom",
                resultText,
                currentUser.getName()
        );

        // Put everything back into the model for generate.jte
        model.addAttribute("bodyInfo", currentUser);
        model.addAttribute("prompt", prompt);
        model.addAttribute("result", resultText);
        model.addAttribute("workoutId", saved.getId());

        return "generate";
    }

    // -------------------------------
    // GET /workouts → list user's workouts
    // -------------------------------
    @GetMapping("/workouts")
    public String listWorkouts(Model model, HttpSession session) {
        User currentUser = (User) session.getAttribute("currentUser");
        if (currentUser == null) {
            return "redirect:/login";
        }

        List<Workout> myWorkouts = workouts.getWorkoutsByOwner(currentUser.getName());
        model.addAttribute("workouts", myWorkouts);

        return "workout-list";   // src/main/jte/workout-list.jte
    }

    // -------------------------------
    // GET /workouts/{id} → view one
    // -------------------------------
    @GetMapping("/workouts/{id}")
    public String viewWorkout(@PathVariable int id,
                              Model model,
                              HttpSession session) {

        User currentUser = (User) session.getAttribute("currentUser");
        if (currentUser == null) {
            return "redirect:/login";
        }

        Workout workout = workouts.getWorkoutById(id);
        if (workout == null) {
            // simple fallback – you can change to an error.jte if you have one
            return "redirect:/workouts";
        }

        model.addAttribute("workout", workout);

        return "workout-view";   // src/main/jte/workout-view.jte
    }
}
