package bd2.dao;

import bd2.dao.api.PassengerDAO;
import bd2.entity.Passenger;
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
		Session currentSession = sessionFactory.getCurrentSession();
		Query<Passenger> theQuery = currentSession.createQuery("from Passenger", Passenger.class);
		List<Passenger> passengers = theQuery.getResultList();
		return passengers;
	}

	@Override
	public void savePassenger(Passenger passenger) {
		Session currentSession = sessionFactory.getCurrentSession();
		currentSession.saveOrUpdate(passenger);
	}

	@Override
	public Passenger getPassenger(int id) {
		Session currentSession = sessionFactory.getCurrentSession();
		Passenger passenger = currentSession.get(Passenger.class, id);
		return passenger;
	}

	@Override
	public void deletePassenger(int id) {
		Session currentSession = sessionFactory.getCurrentSession();
		Query theQuery =
				currentSession.createQuery("delete from Passenger where passengerId=:id");
		theQuery.setParameter("customerId", id);
		theQuery.executeUpdate();
	}
}
