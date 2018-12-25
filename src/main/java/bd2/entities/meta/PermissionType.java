package bd2.entities.meta;

import bd2.entities.UserLogin;

import javax.persistence.*;
import java.util.Set;

@Entity
@Table(name="meta.PermissionType")
public class PermissionType {

	@Id
	@GeneratedValue(strategy= GenerationType.IDENTITY)
	@Column(name="permissionTypeId")
	private int id;

	@Column(name="permissionType")
	private String permissionType;

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

	public String getPermissionType() {
		return permissionType;
	}

	public void setPermissionType(String permissionType) {
		this.permissionType = permissionType;
	}

	public Set<UserLogin> getUserLogins() {
		return userLogins;
	}

	public void setUserLogins(Set<UserLogin> userLogins) {
		this.userLogins = userLogins;
	}
}
