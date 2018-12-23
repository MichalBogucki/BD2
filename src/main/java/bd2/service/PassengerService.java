package bd2.service;

import bd2.entity.Passenger;

import java.util.List;

public interface PassengerService {

	public List<Passenger> getCustomers();

	public void saveCustomer(Passenger passenger);

	public Passenger getCustomer(int id);

	public void deleteCustomer(int id);
	
}
