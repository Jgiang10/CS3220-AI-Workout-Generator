package cs3220.ai_workout_generator;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class AuthController {

    private final UserRepository userRepository;
    private final UserProfileRepository userProfileRepository;
    private final SessionUser sessionUser;

    public AuthController(UserRepository userRepository, UserProfileRepository userProfileRepository, SessionUser sessionUser) {
        this.userRepository = userRepository;
        this.userProfileRepository = userProfileRepository;
        this.sessionUser = sessionUser;
    }

    @GetMapping("/login")
    public String login() {
        return "login";
    }

    @PostMapping("/login")
    public String login(@RequestParam String username, @RequestParam String password, Model model) {
        User user = userRepository.findByUsername(username);
        if (user != null && user.getPassword().equals(password)) {
            sessionUser.setEmail(user.getUsername()); // Note: Refactor SessionUser to use "Username" instead of Email later
            sessionUser.setAuthenticated(true);
            return "redirect:/home";
        }
        model.addAttribute("error", "Invalid username or password");
        return "login";
    }

    @GetMapping("/register")
    public String register() {
        return "register";
    }

    @PostMapping("/register")
    public String register(
            @RequestParam String username, @RequestParam String password,
            @RequestParam String name, @RequestParam int age,
            @RequestParam String gender, @RequestParam double height,
            @RequestParam double weight, @RequestParam int workoutsPerWeek,
            @RequestParam String experienceLevel, @RequestParam String goals) {

        // Check if user exists
        if (userRepository.findByUsername(username) != null) {
            return "redirect:/register?error=Username already taken";
        }


        // 1. Create and Save User (Table 1)
        User newUser = new User(username, password);
        userRepository.save(newUser);


        // 2. Create and Save Profile (Table 2)
        UserProfile newProfile = new UserProfile(name, age, gender, height, weight, workoutsPerWeek, experienceLevel, goals);
        newProfile.setUser(newUser); // Link them
        userProfileRepository.save(newProfile);

        return "redirect:/login";
    }

    @GetMapping("/logout")
    public String logout() {
        sessionUser.clear();
        return "redirect:/login";
    }
}