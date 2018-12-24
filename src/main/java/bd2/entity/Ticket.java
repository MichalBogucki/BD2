package bd2.entity;

import javax.persistence.*;
import java.util.Set;

@Entity
@Table(name="Ticket")
public class Ticket {

	@Id
	@GeneratedValue(strategy= GenerationType.IDENTITY)
	@Column(name="ticketId")
	private int id;

	@OneToMany(mappedBy = "ticket",
			cascade = {
					CascadeType.DETACH,
					CascadeType.MERGE,
					CascadeType.PERSIST,
					CascadeType.REFRESH
			})
	private Set<Passenger> passengers;
}
