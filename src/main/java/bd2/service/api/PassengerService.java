package bd2.service.api;

import bd2.entities.Passenger;
import bd2.entities.helpers.RegistrationUser;
import bd2.entities.meta.PermissionType;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import java.util.List;

public interface PassengerService {

	List<Passenger> getPassengers();

	void savePassenger(Passenger passenger);

	Passenger getPassenger(int id);

	void deletePassenger(int id);

	void savePassengerAndUserLogin(RegistrationUser registrationUser,
								   PermissionType permissionType,
								   BCryptPasswordEncoder encoder);
}
