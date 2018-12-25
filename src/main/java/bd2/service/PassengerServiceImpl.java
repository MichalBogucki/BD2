package bd2.service;

import bd2.dao.api.PassengerDAO;
import bd2.entities.Passenger;
import bd2.service.api.PassengerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class PassengerServiceImpl implements PassengerService {

	@Autowired
	private PassengerDAO passengerDAO;
	
	@Override
	@Transactional
	public List<Passenger> getPassengers() {
		return passengerDAO.getPassengers();
	}

	@Override
	@Transactional
	public void savePassenger(Passenger passenger) {
		passengerDAO.savePassenger(passenger);
	}

	@Override
	@Transactional
	public Passenger getPassenger(int id) {
		return passengerDAO.getPassenger(id);
	}

	@Override
	@Transactional
	public void deletePassenger(int id) {
		passengerDAO.deletePassenger(id);
	}
}





