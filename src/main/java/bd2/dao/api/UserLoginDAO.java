package bd2.dao.api;

import bd2.entities.UserLogin;

import java.util.List;

public interface UserLoginDAO {

	List<UserLogin> getUserLogins();

	void saveUserLogin(UserLogin userLogin);

	UserLogin getUserLogin(int id);

	UserLogin getUserLoginByLogin(String login);

	UserLogin getUserLoginByEmail(String email);

	void deleteUserLogin(int id);
}
