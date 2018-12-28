package bd2.dao;

import bd2.dao.api.PermissionTypeDAO;
import bd2.entities.helpers.Permission;
import bd2.entities.meta.PermissionType;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PermissionTypeDAOImpl implements PermissionTypeDAO {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public PermissionType getPermissionType(Permission permission) {
		Session session = sessionFactory.openSession();
		Query<PermissionType> query = session
				.createQuery("FROM PermissionType WHERE permissionType=:permission", PermissionType.class)
				.setParameter("permission", permission.role());
		PermissionType permissionType = query.getSingleResult();
		session.close();
		return permissionType;
	}

	@Override
	public PermissionType getPermissionType(int id) {
		Session session = sessionFactory.openSession();
		PermissionType permissionType = session.get(PermissionType.class, id);
		session.close();
		return permissionType;
	}
}
