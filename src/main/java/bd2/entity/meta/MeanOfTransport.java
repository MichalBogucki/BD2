package bd2.entity.meta;

import javax.persistence.*;

@Entity
@Table(name="meta.MeanOfTransport")
public class MeanOfTransport {

	@Id
	@GeneratedValue(strategy= GenerationType.IDENTITY)
	@Column(name="meanOfTransportId")
	private int id;
}
