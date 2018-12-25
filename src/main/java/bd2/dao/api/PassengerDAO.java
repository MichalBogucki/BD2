package bd2.dao.api;

import bd2.entities.Passenger;

import java.util.List;

public interface PassengerDAO {

	List<Passenger> getPassengers();

	void savePassenger(Passenger passenger);

	Passenger getPassenger(int id);

	void deletePassenger(int id);
}
