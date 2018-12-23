package bd2.entity;

import javax.persistence.*;

@Entity
@Table(name="Company")
public class Company {

	@Id
	@GeneratedValue(strategy= GenerationType.IDENTITY)
	@Column(name="companyId")
	private int id;
}
