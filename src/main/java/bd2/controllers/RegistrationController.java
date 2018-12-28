package bd2.controllers;

import bd2.entities.helpers.Permission;
import bd2.entities.helpers.RegistrationUser;
import bd2.entities.meta.PermissionType;
import bd2.service.api.PassengerService;
import bd2.service.api.PermissionTypeService;
import bd2.service.api.RegisteringValidationSerivce;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/register")
public class RegistrationController {

	@Autowired
	private RegisteringValidationSerivce validationSerivce;
	@Autowired
	private PassengerService passengerService;
	@Autowired
	private BCryptPasswordEncoder encoder;
	@Autowired
	private PermissionTypeService permissionTypeService;

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

		validationSerivce.validateRegistrationUser(result);
		if(result.hasErrors()) {
			return "register";
		} else {
			PermissionType permissionType = permissionTypeService.getPermissionType(Permission.ROLE_PASSENGER);
			passengerService.savePassengerAndUserLogin(registrationUser, permissionType, encoder);
			return "home";
		}
	}
}
