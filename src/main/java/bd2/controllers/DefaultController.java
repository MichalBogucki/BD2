package bd2.controllers;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DefaultController {

	@RequestMapping("/")
	public String showLogin() {
		return "login";
	}

	@RequestMapping("/home")
	public String showHome(Model model, Authentication authentication) {
		if(authentication == null || !authentication.isAuthenticated()) {
			return "login";
		} else {
			return "home";
		}
	}

	@RequestMapping("*")
	public String showDefault() {
		return "home";
	}
}
