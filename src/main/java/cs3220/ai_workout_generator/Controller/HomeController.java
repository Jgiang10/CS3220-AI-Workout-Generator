package cs3220.ai_workout_generator.Controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import cs3220.ai_workout_generator.SessionUser;

@Controller
public class HomeController {

    private final SessionUser sessionUser;

    public HomeController(SessionUser sessionUser){
        this.sessionUser = sessionUser;
    }
    @GetMapping("/")
    public String blank(Model model) {
        return "redirect:/home";
    }

    @GetMapping("/home")
    public String home(Model model) {
        // Read current user from the session (set by your login code)
        String username = sessionUser.isAuthenticated() ? sessionUser.getEmail() : null;
        model.addAttribute("username", username);   // used by home.jte

        // Renders src/main/jte/home.jte
        return "home";
    }

    @GetMapping("/about")
    public String aboutus(Model model) {
        return "aboutus";
    }
}
