package cs3220.ai_workout_generator;

import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class WorkoutService {

    private final Map<Integer, Workout> workouts = new HashMap<>();

    public WorkoutService() {
        workouts.put(1, new Workout(
                1,
                "Full Body Beginner Workout",
                List.of(
                        new Exercise("Push-Ups", 3, 12),
                        new Exercise("Bodyweight Squats", 3, 15),
                        new Exercise("Plank (seconds)", 3, 60)
                )
        ));
        workouts.put(2, new Workout(
                2,
                "Leg Day Strength",
                List.of(
                        new Exercise("Barbell Squat", 4, 8),
                        new Exercise("Leg Press", 4, 10),
                        new Exercise("Calf Raises", 3, 20)
                )
        ));
    }

    public Workout getWorkoutById(int id) {
        return workouts.get(id);
    }
}
