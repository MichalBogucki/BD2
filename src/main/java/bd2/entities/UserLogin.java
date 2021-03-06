package bd2.entities;

import bd2.entities.helpers.RegistrationUser;
import bd2.entities.meta.PermissionType;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import javax.persistence.*;

@Entity
@Table(name="UserLogin")
public class UserLogin {

	@Id
	@GeneratedValue(strategy= GenerationType.IDENTITY)
	@Column(name="loginId")
	private Integer id;

	@Column(name="login")
	private String login;

	@Column(name="password")
	private String password;

	@Column(name="phoneNumber")
	private String phoneNumber;

	@Column(name="email")
	private String email;

	@ManyToOne(
			fetch = FetchType.EAGER,
			cascade = CascadeType.ALL
	)
	@JoinColumn(name="permissionId")
	private PermissionType permissionType;

	@OneToOne(
			fetch = FetchType.EAGER,
			cascade = CascadeType.ALL
	)
	@JoinColumn(name = "passengerId")
	private Passenger passenger;

	public UserLogin(RegistrationUser registrationUser,
					 Passenger passenger,
					 PermissionType permissionType,
					 BCryptPasswordEncoder encoder) {
		this.password = encoder.encode(registrationUser.getPassword());
		this.login = registrationUser.getLogin();
		this.phoneNumber = registrationUser.getPhoneNumber();
		this.email = registrationUser.getEmail();
		this.permissionType = permissionType;
		this.passenger = passenger;
	}

	public UserLogin() {

	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
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

	public PermissionType getPermissionType() {
		return permissionType;
	}

	public void setPermissionType(PermissionType permissionType) {
		this.permissionType = permissionType;
	}

	public Passenger getPassenger() {
		return passenger;
	}

	public void setPassenger(Passenger passenger) {
		this.passenger = passenger;
	}
}
