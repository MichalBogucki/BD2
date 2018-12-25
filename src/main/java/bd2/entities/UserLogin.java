package bd2.entities;

import bd2.entities.meta.PermissionType;

import javax.persistence.*;

@Entity
@Table(name="UserLogin")
public class UserLogin {

	@Id
	@GeneratedValue(strategy= GenerationType.IDENTITY)
	@Column(name="userLoginId")
	private int id;

	@Column(name="login")
	private String login;

	@Column(name="password")
	private String password;

	@Column(name="phoneNumber")
	private String phoneNumber;

	@Column(name="email")
	private String email;

	@Column(name="pesel")
	private String pesel;

	@ManyToOne(
			fetch = FetchType.EAGER,
			cascade = CascadeType.ALL
	)
	@JoinColumn(name="permissionId")
	private PermissionType permissionType;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getLogin() {
		return login;
	}

	public void setLogin(String login) {
		this.login = login;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPesel() {
		return pesel;
	}

	public void setPesel(String pesel) {
		this.pesel = pesel;
	}

	public PermissionType getPermissionType() {
		return permissionType;
	}

	public void setPermissionType(PermissionType permissionType) {
		this.permissionType = permissionType;
	}
}
