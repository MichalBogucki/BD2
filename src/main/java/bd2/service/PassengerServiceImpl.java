package bd2.service;

import bd2.dao.api.DocumentTypeDAO;
import bd2.dao.api.PassengerDAO;
import bd2.dao.api.PermissionTypeDAO;
import bd2.dao.api.UserLoginDAO;
import bd2.entities.Passenger;
import bd2.entities.UserLogin;
import bd2.entities.helpers.RegistrationUser;
import bd2.entities.meta.DocumentType;
import bd2.entities.meta.PermissionType;
import bd2.service.api.PassengerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class PassengerServiceImpl implements PassengerService {

	@Autowired
	private PassengerDAO passengerDAO;
	@Autowired
	private PermissionTypeDAO permissionTypeDAO;
	@Autowired
	private DocumentTypeDAO documentTypeDAO;
	@Autowired
	private UserLoginDAO userLoginDAO;
	
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

	@Override
	@Transactional
	public void savePassengerAndUserLogin(RegistrationUser registrationUser,
										  PermissionType permissionType,
										  BCryptPasswordEncoder encoder) {
		DocumentType documentType = documentTypeDAO.getDocumentType(1);
		Passenger newPassenger = new Passenger(registrationUser, documentType);
		passengerDAO.savePassenger(newPassenger);
		UserLogin userLogin = new UserLogin(registrationUser, newPassenger, permissionType, encoder);
		userLoginDAO.saveUserLogin(userLogin);
	}
}





