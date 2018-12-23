package bd2.entity.meta;

import javax.persistence.*;

@Entity
@Table(name="meta.PermissionType")
public class PermissionType {

	@Id
	@GeneratedValue(strategy= GenerationType.IDENTITY)
	@Column(name="permissionTypeId")
	private int id;
}
