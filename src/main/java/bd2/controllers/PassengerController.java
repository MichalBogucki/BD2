package bd2.controllers;

import bd2.entity.Passenger;
import bd2.service.PassengerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

@Controller
@RequestMapping("/passengers")
public class PassengerController {

	@Autowired
	private PassengerService passengerService;

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String listPassengers(Model model) {
		List<Passenger> passengers = passengerService.getCustomers();
		model.addAttribute("passengers", passengers);
		return "list-passengers";
	}
}
