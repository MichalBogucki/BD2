package bd2.controllers;

import bd2.business.ErrorCodes;
import bd2.entities.Complaint;
import bd2.entities.Fine;
import bd2.entities.Passenger;
import bd2.entities.TicketCollector;
import bd2.service.api.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/home")
public class PassengerController {

	@Autowired
	private PassengerService passengerService;
	@Autowired
	private UserLoginService userLoginService;
	@Autowired
	private ComplaintStatusService complaintStatusService;
	@Autowired
	private ComplaintService complaintService;
	@Autowired
	private TicketCollectorService ticketCollectorService;

	private Map<Integer, String> idsNamesOfCollectorsMap = new HashMap<>();

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

	@RequestMapping(value = "/complaints/new", method = RequestMethod.GET)
	public String passengerNewComplaint(Model model, Authentication authentication) {

		Complaint newComplaint = new Complaint();
		TicketCollector ticketCollector = new TicketCollector();
		ticketCollector.setId(0);
		newComplaint.setTicketCollector(ticketCollector);

		model.addAttribute("newComplaint", newComplaint);
		setMap();
		model.addAttribute("ticketCollectors", idsNamesOfCollectorsMap);
		return "new-complaint";
	}

	@RequestMapping(value = "/complaints/new/add")
	public String passengerAddNewComplaint(
			Authentication authentication,
			@ModelAttribute("newComplaint") Complaint newComplaint,
			BindingResult result,
			Model model
	) {
		if(newComplaint.getJustification().length() > Complaint.MAXIMUM_JUSTIFICATION_LENGTH) {
			result.rejectValue("justification", ErrorCodes.JUSTIFICATION_TOO_LONG_ERRORCODE);
		}

		if(newComplaint.getTicketCollector().getId() == 0) {
			result.rejectValue("ticketCollector.id", ErrorCodes.COLLECTOR_NOT_CHOSEN);
		}

		if(result.hasErrors()) {
			return "new-complaint";
		}

		String login = authentication.getName();
		int passengerId = userLoginService.getUserLoginByLogin(login).getPassenger().getId();
		Passenger passenger = passengerService.getPassenger(passengerId);
		if(passenger == null) {
			return "redirect:/home";
		} else {
			return "redirect:/home/complaints";
		}
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

	private void setMap() {
		for (TicketCollector collector : ticketCollectorService.getTicketCollectors()) {
			idsNamesOfCollectorsMap.put(collector.getId(), collector.getName() + " " + collector.getSurname());
		}
	}
}
