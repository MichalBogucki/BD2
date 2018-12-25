package bd2.entity;

import javax.persistence.*;
import java.util.Set;

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
	private Set<Complaint> complaints;

	@ManyToOne(cascade = {
			CascadeType.DETACH,
			CascadeType.MERGE,
			CascadeType.PERSIST,
			CascadeType.REFRESH
	})
	@JoinColumn(name="companyId")
	private Company company;
}
