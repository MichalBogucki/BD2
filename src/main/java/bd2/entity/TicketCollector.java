package bd2.entity;

import bd2.entity.meta.ContractType;

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
			cascade = CascadeType.ALL
	)
	private Set<Complaint> complaints;

	@ManyToOne(
			fetch = FetchType.EAGER,
			cascade = CascadeType.ALL
	)
	@JoinColumn(name="companyId")
	private Company company;

	@ManyToOne(
			fetch = FetchType.EAGER,
			cascade = CascadeType.ALL
	)
	@JoinColumn(name="contractTypeId")
	private ContractType contractType;
}
