package bd2.rest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class NormalController {

	@RequestMapping("/home")
	public String sayHello() {
		return "home";
	}
}
