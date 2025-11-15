package cs3220.ai_workout_generator;

import org.springframework.stereotype.Component;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.atomic.AtomicLong;

@Component
public class WorkoutRepository {

    private final List<Workout> workouts = new ArrayList<>();
    private final AtomicLong idSeq = new AtomicLong(1);

    public Workout create(String title,
                          String category,
                          String content,
                          String ownerUsername) {

        Workout workout = new Workout(
                idSeq.getAndIncrement(),
                title,
                category,
                LocalDateTime.now(),
                content,
                ownerUsername
        );

        workouts.add(workout);
        return workout;
    }

    public List<Workout> findByOwner(String username) {
        List<Workout> result = new ArrayList<>();
        for (Workout w : workouts) {
            if (w.getOwnerUsername().equals(username)) {
                result.add(w);
            }
        }
        return result;
    }

    public Workout findByIdAndOwner(Long id, String username) {
        for (Workout w : workouts) {
            if (w.getId().equals(id) && w.getOwnerUsername().equals(username)) {
                return w;
            }
        }
        return null;
    }
}
