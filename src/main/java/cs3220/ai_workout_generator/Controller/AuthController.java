package cs3220.ai_workout_generator.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import cs3220.ai_workout_generator.SessionUser;
import cs3220.ai_workout_generator.UserData;
import org.springframework.ui.Model;

@Controller
public class AuthController {

    private final SessionUser sessionUser;
    private final UserData userData;

    public AuthController(SessionUser sessionUser, UserData userData) {
        this.sessionUser = sessionUser;
        this.userData = userData;
    }
    @GetMapping("/")
    public String showhome(){
        return "redirect:/home";
    }
    @GetMapping("/login")
    public String showLogin() {
        return "login";
    }
    @PostMapping("/login")
    public String doLogin(@RequestParam("email") String email,
                          @RequestParam("password") String password) {
        // Simple demo auth: accept any non-empty email. Replace with real auth as needed.
        if (userData.validate(email, password)) {
            sessionUser.setEmail(email);
            sessionUser.setAuthenticated(true);
            return "redirect:/home";
        }
        return "redirect:/login";
    }
    @GetMapping("/registration")
    public String showRegister(Model model) {
        if (sessionUser.isAuthenticated()) {
            return "redirect:/home";
        }
        model.addAttribute("error", null);
        return "registration";
    }

    @PostMapping("/registration")
    public String handleRegister(@RequestParam String email,
                                 @RequestParam String password,
                                 Model model) {
        if (sessionUser.isAuthenticated()) {
            return "redirect:/home";
        }

        if (userData.exists(email)) {
            model.addAttribute("error", "User already exists");
            return "registration";
        }

        userData.create(email, password);
        return "redirect:/login";
    }
    @GetMapping("/logout")
    public String logoutGet(){
        sessionUser.clear();
        return "redirect:/login";
    }
    @PostMapping("/logout")
    public String doLogout() {
        sessionUser.clear();
        return "redirect:/login";
    }
}