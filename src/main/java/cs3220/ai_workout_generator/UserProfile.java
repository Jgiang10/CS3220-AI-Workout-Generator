package cs3220.ai_workout_generator;

import jakarta.persistence.*;

@Entity
@Table(name = "user_profiles")
public class UserProfile {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private String name;
    private int age;
    private String gender;
    private double height; // e.g., in cm or inches
    private double weight; // e.g., in kg or lbs
    private int workoutsPerWeek;
    private String experienceLevel; // Beginner, Intermediate, Advanced
    private String goals;

    // Link back to the User table
    @OneToOne
    @JoinColumn(name = "user_id", referencedColumnName = "id")
    private User user;

    public UserProfile() {}

    public UserProfile(String name, int age, String gender, double height, double weight, int workoutsPerWeek, String experienceLevel, String goals) {
        this.name = name;
        this.age = age;
        this.gender = gender;
        this.height = height;
        this.weight = weight;
        this.workoutsPerWeek = workoutsPerWeek;
        this.experienceLevel = experienceLevel;
        this.goals = goals;
    }

    // Getters and Setters
    public Integer getId() { return id; }
    public void setId(Integer id) { this.id = id; }
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    public int getAge() { return age; }
    public void setAge(int age) { this.age = age; }
    public String getGender() { return gender; }
    public void setGender(String gender) { this.gender = gender; }
    public double getHeight() { return height; }
    public void setHeight(double height) { this.height = height; }
    public double getWeight() { return weight; }
    public void setWeight(double weight) { this.weight = weight; }
    public int getWorkoutsPerWeek() { return workoutsPerWeek; }
    public void setWorkoutsPerWeek(int workoutsPerWeek) { this.workoutsPerWeek = workoutsPerWeek; }
    public String getExperienceLevel() { return experienceLevel; }
    public void setExperienceLevel(String experienceLevel) { this.experienceLevel = experienceLevel; }
    public String getGoals() { return goals; }
    public void setGoals(String goals) { this.goals = goals; }
    public User getUser() { return user; }
    public void setUser(User user) { this.user = user; }
}