package bd2.entity.meta;

import javax.persistence.*;

@Entity
@Table(name="meta.CompanyName")
public class CompanyName {

	@Id
	@GeneratedValue(strategy= GenerationType.IDENTITY)
	@Column(name="companyNameId")
	private int id;
}
