package cs3220.ai_workout_generator;

import org.springframework.stereotype.Service;

@Service
public class AiWorkoutService {

    public String generateWorkoutText(String prompt) {
        return """
                Warm-up:
                - Light cardio (5 min)
                - Dynamic stretching

                Workout:
                - 3x12 Push-ups
                - 3x10 Dumbbell bench press
                - 3x15 Shoulder raises

                Cooldown:
                - Stretch 5 min

                Prompt: %s
                """.formatted(prompt);
    }
}
