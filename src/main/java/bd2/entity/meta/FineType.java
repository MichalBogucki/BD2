package bd2.entity.meta;

import javax.persistence.*;

@Entity
@Table(name="meta.FineType")
public class FineType {

	@Id
	@GeneratedValue(strategy= GenerationType.IDENTITY)
	@Column(name="fineTypeId")
	private int id;
}
