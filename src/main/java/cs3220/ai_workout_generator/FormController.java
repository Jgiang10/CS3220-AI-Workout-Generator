package cs3220.ai_workout_generator;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class FormController {


    @GetMapping("/form")
    public String showForm() {

        return "form";
    }


    @PostMapping("/form")
    public String handleForm(
            @RequestParam String height,
            @RequestParam String age,
            @RequestParam String gender,
            @RequestParam String weight,
            @RequestParam String goals,
            RedirectAttributes redirectAttributes) {


        System.out.println("--- FORM DATA RECEIVED ---");
        System.out.println("Height: " + height);
        System.out.println("Age: " + age);
        System.out.println("Gender: " + gender);
        System.out.println("Weight: " + weight);
        System.out.println("Goals: " + goals);
        System.out.println("--------------------------");


        redirectAttributes.addFlashAttribute("height", height);
        redirectAttributes.addFlashAttribute("age", age);
        redirectAttributes.addFlashAttribute("gender", gender);
        redirectAttributes.addFlashAttribute("weight", weight);
        redirectAttributes.addFlashAttribute("goals", goals);

        return "redirect:/home";
    }
}