package bd2.controllers;

import bd2.entities.helpers.RegistrationUser;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/register")
public class RegistrationController {

	@RequestMapping("")
	public String register(Model model) {
		model.addAttribute("registrationUser", new RegistrationUser());
		return "register";
	}
}
