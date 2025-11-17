package cs3220.ai_workout_generator;


import org.springframework.ui.Model;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
public class SpecificWorkoutViewerController {

    private final WorkoutService workoutService;

    public SpecificWorkoutViewerController(WorkoutService workoutService) {
        this.workoutService = workoutService;
    }

    @GetMapping("/workout/{id}")
    public String viewWorkout(@PathVariable int id, Model model) {
        Workout workout = workoutService.getWorkoutById(id);

        if (workout == null) {
            return "redirect:/error";
        }

        model.addAttribute("workout", workout);
        return "specific_workout_viewer";
    }
}
