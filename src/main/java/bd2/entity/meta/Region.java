package bd2.entity.meta;

import javax.persistence.*;

@Entity
@Table(name="meta.Region")
public class Region {

	@Id
	@GeneratedValue(strategy= GenerationType.IDENTITY)
	@Column(name="regionId")
	private int id;
}
