package bd2.dao;

import bd2.dao.api.PassengerDAO;
import bd2.entity.Passenger;
import org.hibernate.Hibernate;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class PassengerDAOImpl implements PassengerDAO {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<Passenger> getPassengers() {
		Session session = sessionFactory.openSession();
		Query<Passenger> query = session.createQuery("from Passenger",
				Passenger.class);
		List<Passenger> passengers = query.getResultList();
		session.close();
		return passengers;
	}

	@Override
	public void savePassenger(Passenger passenger) {
		Session session = sessionFactory.openSession();
		session.saveOrUpdate(passenger);
		session.close();
	}

	@Override
	public Passenger getPassenger(int id) {
		Session session = sessionFactory.openSession();
		Passenger passenger = session.get(Passenger.class, id);
		Hibernate.initialize(passenger.getFines());
		Hibernate.initialize(passenger.getComplaints());
		Hibernate.initialize(passenger.getTicket());
		Hibernate.initialize(passenger.getDocumentType());
		session.close();
		return passenger;
	}

	@Override
	public void deletePassenger(int id) {
		Session session = sessionFactory.openSession();
		Query query =
				session.createQuery("delete from Passenger where passengerId=:id");
		query.setParameter("customerId", id);
		query.executeUpdate();
		session.close();
	}
}
