package cs3220.ai_workout_generator;

import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Optional;

@Component
public class UserData {
    private final List<User> users = new ArrayList<>();

    public UserData() {
        // Users to test the application
        // This can be deleted when the database is connected
        users.add(new User("Josh", "josh@example.com", "abcd"));
        users.add(new User("Eva", "Eva123@gmail.com", "blah blah"));
        users.add(new User("John", "John123@gmail.com", "huh"));
    }

    public void addUser(User user) {
        users.add(user);
    }

    public Optional<User> findByEmail(String email) {
        return users.stream().filter(u -> u.getEmail().equals(email)).findFirst();
    }

    public boolean validate(String email, String password) {
        return findByEmail(email).map(u -> u.getPassword().equals(password)).orElse(false);
    }

    public List<User> getAll() {
        return Collections.unmodifiableList(users);
    }
}