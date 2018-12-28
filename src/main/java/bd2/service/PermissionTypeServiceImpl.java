package bd2.service;

import bd2.dao.api.PermissionTypeDAO;
import bd2.entities.helpers.Permission;
import bd2.entities.meta.PermissionType;
import bd2.service.api.PermissionTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PermissionTypeServiceImpl implements PermissionTypeService {

	@Autowired
	private PermissionTypeDAO permissionTypeDAO;

	@Override
	public PermissionType getPermissionType(Permission permission) {
		return permissionTypeDAO.getPermissionType(permission);
	}

	@Override
	public PermissionType getPermissionType(int id) {
		return permissionTypeDAO.getPermissionType(id);
	}
}
