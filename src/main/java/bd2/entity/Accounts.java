package bd2.entity;

import javax.persistence.*;

@Entity
@Table(name="Accounts")
public class Accounts {

	@Id
	@GeneratedValue(strategy= GenerationType.IDENTITY)
	@Column(name="accountsId")
	private int id;
}
