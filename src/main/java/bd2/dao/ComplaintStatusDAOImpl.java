package bd2.dao;

import bd2.dao.api.ComplaintStatusDAO;
import bd2.entities.meta.ComplaintStatus;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ComplaintStatusDAOImpl implements ComplaintStatusDAO {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public ComplaintStatus getComplaintStatus(int id) {
		Session session = sessionFactory.openSession();
		ComplaintStatus complaintStatus = session.get(ComplaintStatus.class, id);
		session.close();
		return complaintStatus;
	}
}
