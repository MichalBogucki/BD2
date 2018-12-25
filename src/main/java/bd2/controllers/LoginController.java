package bd2.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoginController {

	@RequestMapping("/loginPage")
	public String loginPage() {
		return "login";
	}

	@RequestMapping("/loginError")
	public String loginError(Model model) {
		model.addAttribute("loginError", true);
		return "login";
	}

	@RequestMapping("/logout")
	public String logout(Model model) {
		model.addAttribute("logout", true);
		return "login";
	}

	@RequestMapping("/admin")
	public String adminPage(Model model) {
		return "admin";
	}

	@RequestMapping("/passenger")
	public String passengerPage(Model model) {
		return "passenger";
	}

	@RequestMapping("/access-denied")
	public String accessDenied(Model model) {
		return "access-denied";
	}
}
