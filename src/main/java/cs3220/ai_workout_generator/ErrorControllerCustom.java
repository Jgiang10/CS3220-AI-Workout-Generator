package cs3220.ai_workout_generator;

import org.springframework.boot.web.error.ErrorAttributeOptions;
import org.springframework.boot.web.servlet.error.ErrorAttributes;
import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.*;

import java.util.Map;

@Controller
public class ErrorControllerCustom implements ErrorController {

    private final ErrorAttributes errorAttributes;

    public ErrorControllerCustom(ErrorAttributes errorAttributes) {
        this.errorAttributes = errorAttributes;
    }

    @RequestMapping("/error")
    public String handleError(Model model) {

        ServletRequestAttributes attr = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();

        if (attr == null) {
            model.addAttribute("status", 500);
            model.addAttribute("error", "Unknown Error");
            model.addAttribute("message", "No request information available.");
            model.addAttribute("path", "N/A");
            return "error";
        }

        ServletWebRequest webRequest = new ServletWebRequest(attr.getRequest());

        Map<String, Object> errors = errorAttributes.getErrorAttributes(
                webRequest,
                ErrorAttributeOptions.defaults()
        );

        model.addAttribute("status", errors.get("status"));
        model.addAttribute("error", errors.get("error"));
        model.addAttribute("message", errors.get("message"));
        model.addAttribute("path", errors.get("path"));

        return "error";
    }
}