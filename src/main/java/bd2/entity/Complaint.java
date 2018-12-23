package bd2.entity;

import javax.persistence.*;

@Entity
@Table(name="Complaint")
public class Complaint {

	@Id
	@GeneratedValue(strategy= GenerationType.IDENTITY)
	@Column(name="complaintId")
	private int id;

	@ManyToOne(cascade = {
			CascadeType.DETACH,
			CascadeType.MERGE,
			CascadeType.PERSIST,
			CascadeType.REFRESH
	})
	@JoinColumn(name="passengerId")
	private Passenger passenger;

	@ManyToOne(cascade = {
			CascadeType.DETACH,
			CascadeType.MERGE,
			CascadeType.PERSIST,
			CascadeType.REFRESH
	})
	@JoinColumn(name="ticketCollectorId")
	private TicketCollector ticketCollector;
}
