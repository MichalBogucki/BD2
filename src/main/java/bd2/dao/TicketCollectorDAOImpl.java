package bd2.dao;

import bd2.dao.api.TicketCollectorDAO;
import bd2.entities.TicketCollector;
import org.hibernate.Hibernate;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class TicketCollectorDAOImpl implements TicketCollectorDAO {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<TicketCollector> getTicketCollectors() {
		Session session = sessionFactory.openSession();
		Query<TicketCollector> query = session.createQuery("from TicketCollector",
				TicketCollector.class);
		List<TicketCollector> passengers = query.getResultList();
		session.close();
		return passengers;
	}

	@Override
	public void saveTicketCollector(TicketCollector ticketCollector) {
		Session session = sessionFactory.openSession();
		session.saveOrUpdate(ticketCollector);
		session.close();
	}

	@Override
	public TicketCollector getTicketCollector(int id) {
		Session session = sessionFactory.openSession();
		TicketCollector ticketCollector = session.get(TicketCollector.class, id);
		Hibernate.initialize(ticketCollector.getComplaints());
		Hibernate.initialize(ticketCollector.getPayrolls());
		Hibernate.initialize(ticketCollector.getColleagues());
		session.close();
		return ticketCollector;
	}

	@Override
	public void deleteTicketCollector(int id) {
		Session session = sessionFactory.openSession();
		Query query =
				session.createQuery("delete from TicketCollector where ticketCollector=:id");
		query.setParameter("ticketCollector", id);
		query.executeUpdate();
		session.close();
	}
}
