package cs3220.ai_workout_generator;

public class Exercise {
    private String name;
    private int sets;
    private int reps;

    public Exercise(String name, int sets, int reps) {
        this.name = name;
        this.sets = sets;
        this.reps = reps;
    }

    public String getName(){
        return name;
    }
    public int getSets(){
        return sets;
    }
    public int getReps(){
        return reps;
    }
    public void  setName(String name){
        this.name = name;
    }
    public void setSets(int sets){
        this.sets = sets;
    }
    public void setReps(int reps){
        this.reps = reps;
    }
}