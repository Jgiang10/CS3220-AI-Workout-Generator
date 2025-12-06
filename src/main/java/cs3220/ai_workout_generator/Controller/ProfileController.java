package cs3220.ai_workout_generator.Controller;
// Imports
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import cs3220.ai_workout_generator.User;
import cs3220.ai_workout_generator.UserProfile;
import cs3220.ai_workout_generator.SessionUser;
import cs3220.ai_workout_generator.Repository.UserRepository;
import cs3220.ai_workout_generator.Repository.UserProfileRepository;


@Controller
public class ProfileController {


    private final UserRepository userRepository;
    private final UserProfileRepository userProfileRepository;
    private final SessionUser sessionUser;

    public ProfileController(UserRepository userRepository, UserProfileRepository userProfileRepository, SessionUser sessionUser) {
        this.userRepository = userRepository;
        this.userProfileRepository = userProfileRepository;
        this.sessionUser = sessionUser;
    }

    // View Profile page
    @GetMapping("/profile")
    public String profile(Model model, @RequestParam(required = false) boolean edit) {

       // Checks if the User is logged in, redirects to home page if not
        if (!sessionUser.isAuthenticated()) {
            return "redirect:/login";
        }

        // Retrieves logged in user from the database
        User user = userRepository.findByUsername(sessionUser.getEmail());
        if (user == null) {
            sessionUser.clear();
            return "redirect:/login";
        }

        // Add data to the model so the html can view it
        model.addAttribute("user", user);
        model.addAttribute("profile", user.getUserProfile());
        model.addAttribute("editMode", edit); // Determines if we show Inputs or Text

        return "profile";
    }

    // Update profile
    @PostMapping("/updateProfile")
    public String updateProfile(
            @RequestParam String name,
            @RequestParam int age,
            @RequestParam String gender,
            @RequestParam double height,
            @RequestParam double weight,
            @RequestParam int workoutsPerWeek,
            @RequestParam String experienceLevel,
            @RequestParam String goals
    ) {
        if (!sessionUser.isAuthenticated()) {
            return "redirect:/login";
        }

        // Fetches the logged in user & Accesses the linked profile
        User user = userRepository.findByUsername(sessionUser.getEmail());
        UserProfile profile = user.getUserProfile();

        // Updates the fields with the submitted form data
        profile.setName(name);
        profile.setAge(age);
        profile.setGender(gender);
        profile.setHeight(height);
        profile.setWeight(weight);
        profile.setWorkoutsPerWeek(workoutsPerWeek);
        profile.setExperienceLevel(experienceLevel);
        profile.setGoals(goals);

        // Save updated data to SQL table
        userProfileRepository.save(profile);

        // Redirect back to the home page
        return "redirect:/profile";
    }
}