package cs3220.ai_workout_generator;

import java.util.List;

public class Workout {
    private int id;
    private String title;
    private List <Exercise> exercises;
    private String content;
    private String ownerUsername;

    public Workout(int id, String title, List <Exercise> exercises){
        this.id = id;
        this.title = title;
        this.exercises = exercises;
    }

    public Workout(int id, String title, String content, String ownerUsername) {
        this.id = id;
        this.title = title;
        this.content = content;
        this.ownerUsername = ownerUsername;
    }

    public int getId() { return id; }
    public String getTitle() { return title; }
    public List<Exercise> getExercises() { return exercises; }
    public String getContent() { return content; }
    public String getOwnerUsername() { return ownerUsername; }

    public void setId(int id) { this.id = id; }
    public void setTitle(String title) { this.title = title; }
    public void setExercises(List<Exercise> exercises) { this.exercises = exercises; }
    public void setContent(String content) { this.content = content; }
    public void setOwnerUsername(String ownerUsername) { this.ownerUsername = ownerUsername; }
}
