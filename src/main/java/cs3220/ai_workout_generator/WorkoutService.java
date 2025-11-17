package cs3220.ai_workout_generator;

import org.springframework.stereotype.Service;

import java.util.*;
import java.util.concurrent.atomic.AtomicInteger;
@Service
public class WorkoutService {

    private final Map<Integer, Workout> workouts = new HashMap<>();
    private final AtomicInteger idSeq = new AtomicInteger(1);

    public WorkoutService() {
        //delete these presets and adjust once repository is ready
        workouts.put(idSeq.get(), new Workout(
                idSeq.getAndIncrement(),
                "Full Body Beginner Workout",
                List.of(
                        new Exercise("Push-Ups", 3, 12),
                        new Exercise("Bodyweight Squats", 3, 15),
                        new Exercise("Plank (seconds)", 3, 60)
                )
        ));
        workouts.put(idSeq.get(), new Workout(
                idSeq.getAndIncrement(),
                "Leg Day Strength",
                List.of(
                        new Exercise("Barbell Squat", 4, 8),
                        new Exercise("Leg Press", 4, 10),
                        new Exercise("Calf Raises", 3, 20)
                )
        ));
    }
    public Workout createAIWorkout(String title, String content, String ownerUsername, String name) {
        int id = idSeq.getAndIncrement();
        Workout w = new Workout(id, title, content, ownerUsername);
        workouts.put(id, w);
        return w;
    }

    public Workout getWorkoutById(int id) {
        return workouts.get(id);
    }
    public List<Workout> getWorkoutsByOwner(String ownerUsername) {
        List<Workout> result = new ArrayList<>();
        for (Workout w : workouts.values()) {
            if (ownerUsername.equals(w.getOwnerUsername())) {
                result.add(w);
            }
        }
        return result;
    }
    public List<Workout> getAllPredefinedWorkouts() {
        List<Workout> result = new ArrayList<>();
        for (Workout w : workouts.values()) {
            if (w.getExercises() != null) {
                result.add(w);
            }
        }
        return result;
    }
}
