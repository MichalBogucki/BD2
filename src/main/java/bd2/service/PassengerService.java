package bd2.service;

import bd2.entity.Passenger;

import java.util.List;

public interface PassengerService {

	public List<Passenger> getPassengers();

	public void savePassenger(Passenger passenger);

	public Passenger getPassenger(int id);

	public void deletePassenger(int id);
	
}
