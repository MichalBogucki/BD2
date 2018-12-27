package bd2.entities.meta;

import bd2.entities.UserLogin;
import bd2.entities.helpers.Permission;

import javax.persistence.*;
import java.util.Set;

@Entity
@Table(name="meta.PermissionType")
public class PermissionType {

	@Id
	@GeneratedValue(strategy= GenerationType.IDENTITY)
	@Column(name="permissionTypeId")
	private int id;

	@Column(name="permission")
	@Enumerated(EnumType.STRING)
	private Permission permission;

	@OneToMany(
			mappedBy = "permissionType",
			cascade = CascadeType.ALL
	)
	private Set<UserLogin> userLogins;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Permission getPermission() {
		return permission;
	}

	public void setPermission(Permission permission) {
		this.permission = permission;
	}

	public Set<UserLogin> getUserLogins() {
		return userLogins;
	}

	public void setUserLogins(Set<UserLogin> userLogins) {
		this.userLogins = userLogins;
	}
}
