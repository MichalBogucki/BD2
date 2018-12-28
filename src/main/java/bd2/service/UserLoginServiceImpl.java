package bd2.service;

import bd2.dao.api.UserLoginDAO;
import bd2.entities.UserLogin;
import bd2.service.api.UserLoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserLoginServiceImpl implements UserLoginService {

	@Autowired
	private UserLoginDAO userLoginDAO;

	@Override
	public List<UserLogin> getUserLogins() {
		return userLoginDAO.getUserLogins();
	}

	@Override
	public void saveUserLogin(UserLogin userLogin) {
		userLoginDAO.saveUserLogin(userLogin);
	}

	@Override
	public UserLogin getUserLogin(int id) {
		return userLoginDAO.getUserLogin(id);
	}

	@Override
	public UserLogin getUserLoginByLogin(String login) {
		return userLoginDAO.getUserLoginByLogin(login);
	}

	@Override
	public UserLogin getUserLoginByEmail(String email) {
		return userLoginDAO.getUserLoginByEmail(email);
	}

	@Override
	public void deleteUserLogin(int id) {
		userLoginDAO.deleteUserLogin(id);
	}
}
