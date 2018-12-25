package bd2.service.api;

import bd2.entities.Passenger;

import java.util.List;

public interface PassengerService {

	List<Passenger> getPassengers();

	void savePassenger(Passenger passenger);

	Passenger getPassenger(int id);

	void deletePassenger(int id);
	
}
