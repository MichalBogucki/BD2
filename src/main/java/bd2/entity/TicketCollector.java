package bd2.entity;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name="TicketCollector")
public class TicketCollector {

	@Id
	@GeneratedValue(strategy= GenerationType.IDENTITY)
	@Column(name="ticketCollectorId")
	private int id;

	@OneToMany(mappedBy = "ticketCollector",
			cascade = {
					CascadeType.DETACH,
					CascadeType.MERGE,
					CascadeType.PERSIST,
					CascadeType.REFRESH
			})
	private List<Complaint> complaints;
}
