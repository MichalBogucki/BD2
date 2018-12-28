package bd2.controllers;

import bd2.business.validation.RegistrationValidationUtil;
import bd2.entities.helpers.RegistrationUser;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/register")
public class RegistrationController {

//	@InitBinder
//	public void initBinder(WebDataBinder dataBinder) {
//		StringTrimmerEditor stringTrimmerEditor = new StringTrimmerEditor(true);
//		dataBinder.registerCustomEditor(String.class, stringTrimmerEditor);
//	}

	@RequestMapping("")
	public String register(Model model, Authentication authentication) {
		RegistrationUser registrationUser = new RegistrationUser();
		model.addAttribute("registrationUser", registrationUser);
		return "register";
	}

	@PostMapping("/processRegistration")
	public String processRegistration(
			@ModelAttribute("registrationUser") RegistrationUser registrationUser,
			BindingResult result,
			Model model) {
		RegistrationValidationUtil.validateRegistrationUser(result);
		if(result.hasErrors()) {
			return "register";
		}
		return "register-confirmation";
	}
}
