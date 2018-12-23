package bd2.entity;

import javax.persistence.*;

@Entity
@Table(name="UserLogin")
public class UserLogin {

	@Id
	@GeneratedValue(strategy= GenerationType.IDENTITY)
	@Column(name="userLoginId")
	private int id;
}
