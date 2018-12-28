package bd2.dao.api;

import bd2.entities.helpers.Permission;
import bd2.entities.meta.PermissionType;

public interface PermissionTypeDAO {

	PermissionType getPermissionType(Permission permission);

	PermissionType getPermissionType(int id);
}
