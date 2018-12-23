package bd2.entity.meta;

import javax.persistence.*;

@Entity
@Table(name="meta.ContractType")
public class ContractType {

	@Id
	@GeneratedValue(strategy= GenerationType.IDENTITY)
	@Column(name="contractTypeId")
	private int id;
}
