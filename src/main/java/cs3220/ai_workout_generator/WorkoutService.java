package cs3220.ai_workout_generator;

import org.springframework.stereotype.Service;

import java.util.*;
import java.util.concurrent.atomic.AtomicInteger;
@Service
public class WorkoutService {

    private final Map<Integer, Workout> workouts = new HashMap<>();
    private final AtomicInteger idSeq = new AtomicInteger(1);

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
