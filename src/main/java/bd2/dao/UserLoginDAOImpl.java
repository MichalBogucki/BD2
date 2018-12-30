package bd2.dao;

import bd2.dao.api.UserLoginDAO;
import bd2.entities.UserLogin;
import org.hibernate.Hibernate;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.persistence.NoResultException;
import java.util.List;

@Repository
public class UserLoginDAOImpl implements UserLoginDAO {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<UserLogin> getUserLogins() {
		Session session = sessionFactory.openSession();
		Query<UserLogin> query = session.createQuery("from UserLogin",
				UserLogin.class);
		List<UserLogin> userLogins = query.getResultList();
		session.close();
		return userLogins;
	}

	@Override
	public UserLogin getUserLoginByLogin(String login) {
		Session session = sessionFactory.openSession();
		Query<UserLogin> query = session
				.createQuery("FROM UserLogin WHERE login=:login", UserLogin.class)
				.setParameter("login", login);
		UserLogin userLogin;
		try {
			userLogin = query.getSingleResult();
		} catch (NoResultException e) {
			userLogin = null;
		}
		session.close();
		return userLogin;
	}

	@Override
	public UserLogin getUserLoginByEmail(String email) {
		Session session = sessionFactory.openSession();
		Query<UserLogin> query = session
				.createQuery("FROM UserLogin WHERE email=:email", UserLogin.class)
				.setParameter("email", email);
		UserLogin userLogin;
		try {
			userLogin = query.getSingleResult();
		} catch (NoResultException e) {
			userLogin = null;
		}
		session.close();
		return userLogin;
	}

	@Override
	public void saveUserLogin(UserLogin userLogin) {
		Session session = sessionFactory.openSession();
		session.saveOrUpdate(userLogin);
		session.close();
	}

	@Override
	public UserLogin getUserLogin(int id) {
		Session session = sessionFactory.openSession();
		UserLogin userLogin = session.get(UserLogin.class, id);
		Hibernate.initialize(userLogin.getPassenger());
		Hibernate.initialize(userLogin.getPermissionType());
		session.close();
		return userLogin;
	}

	@Override
	public void deleteUserLogin(int id) {
		Session session = sessionFactory.openSession();
		Query query =
				session.createQuery("delete from UserLogin where loginId=:id");
		query.setParameter("id", id);
		query.executeUpdate();
		session.close();
	}
}
