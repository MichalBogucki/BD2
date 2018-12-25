package bd2.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DefaultController {

	@RequestMapping("/")
	public String showLogin() {
		return "login";
	}

	@RequestMapping("/home")
	public String showHome() {
		return "home";
	}

	@RequestMapping("*")
	public String showDefault() {
		return "login";
	}
}
