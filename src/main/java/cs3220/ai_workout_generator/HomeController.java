package cs3220.ai_workout_generator;

import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

    @GetMapping("/home")
    public String home(Model model, HttpSession session) {
        // Read current user from the session (set by your login code)
        User currentUser = (User) session.getAttribute("currentUser");

        String username = (currentUser == null) ? null : currentUser.getName();
        model.addAttribute("username", username);   // used by home.jte

        // Renders src/main/jte/home.jte
        return "home";
    }
}
