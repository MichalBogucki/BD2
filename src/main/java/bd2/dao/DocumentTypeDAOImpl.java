package bd2.dao;

import bd2.dao.api.DocumentTypeDAO;
import bd2.entities.meta.DocumentType;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class DocumentTypeDAOImpl implements DocumentTypeDAO {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public DocumentType getDocumentType(int id) {
		Session session = sessionFactory.openSession();
		DocumentType documentType = session.get(DocumentType.class, id);
		session.close();
		return documentType;
	}
}
