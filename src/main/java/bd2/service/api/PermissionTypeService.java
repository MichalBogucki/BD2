package bd2.service.api;

import bd2.entities.helpers.Permission;
import bd2.entities.meta.PermissionType;

public interface PermissionTypeService {

	PermissionType getPermissionType(Permission permission);

	PermissionType getPermissionType(int id);
}
