package cs3220.ai_workout_generator;

import java.util.List;

public class Workout {
    private int id;
    private String title;
    private List <Exercise> exercises;

    public Workout(int id, String title, List <Exercise> exercises){
        this.id = id;
        this.title = title;
        this.exercises = exercises;
    }

    public int getId() {
        return id;
    }
    public String getTitle() {
        return title;
    }
    public List <Exercise> getExercises() {
        return exercises;
    }
    public void setId(int id) {
        this.id = id;
    }
    public void setTitle(String title) {
        this.title = title;
    }
    public void setExercises(List <Exercise> exercises) {
        this.exercises = exercises;
    }
}
