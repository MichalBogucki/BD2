package bd2.controllers;

import bd2.entities.Complaint;
import bd2.entities.Fine;
import bd2.entities.Passenger;
import bd2.service.api.PassengerService;
import bd2.service.api.UserLoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/home")
public class PassengerController {

	@Autowired
	private PassengerService passengerService;
	@Autowired
	private UserLoginService userLoginService;

	@RequestMapping(value = "/fines", method = RequestMethod.GET)
	public String passengerFines(Model model, Authentication authentication) {
		String login = authentication.getName();
		int passengerId = userLoginService.getUserLoginByLogin(login).getPassenger().getId();
		Passenger passenger = passengerService.getPassenger(passengerId);
		if(passenger == null) {
			return "home";
		} else {
			List<Fine> fines = passenger.getFines().stream()
					.sorted(Comparator.comparing(Fine::getWritingDate))
					.collect(Collectors.toList());
			model.addAttribute("fines", fines);
		}
		return "fines";
	}

	@RequestMapping(value = "/complaints", method = RequestMethod.GET)
	public String passengerComplaints(Model model, Authentication authentication) {
		String login = authentication.getName();
		int passengerId = userLoginService.getUserLoginByLogin(login).getPassenger().getId();
		Passenger passenger = passengerService.getPassenger(passengerId);
		if(passenger == null) {
			return "home";
		} else {
			List<Complaint> complaints = passenger.getComplaints().stream()
					.sorted(Comparator.comparing(Complaint::getArrivalDate))
					.collect(Collectors.toList());
			model.addAttribute("complaints", complaints);
		}
		return "complaints";
	}
}
