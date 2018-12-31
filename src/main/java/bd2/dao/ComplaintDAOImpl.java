package bd2.dao;

import bd2.dao.api.ComplaintDAO;
import bd2.entities.Complaint;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ComplaintDAOImpl implements ComplaintDAO {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<Complaint> getComplaints() {
		Session session = sessionFactory.openSession();
		Query<Complaint> query = session.createQuery("from Complaint",
				Complaint.class);
		List<Complaint> complaints = query.getResultList();
		session.close();
		return complaints;
	}

	@Override
	public void saveComplaint(Complaint complaint) {
		Session session = sessionFactory.openSession();
		session.saveOrUpdate(complaint);
		session.close();
	}

	@Override
	public Complaint getComplaint(int id) {
		Session session = sessionFactory.openSession();
		Complaint complaint = session.get(Complaint.class, id);
		session.close();
		return complaint;
	}

	@Override
	public void deleteComplaint(int id) {
		Session session = sessionFactory.openSession();
		Query query =
				session.createQuery("delete from Complaint where complaintId=:id");
		query.setParameter("complaintId", id);
		query.executeUpdate();
		session.close();
	}
}
