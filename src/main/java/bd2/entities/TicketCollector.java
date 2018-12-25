package bd2.entities;

import bd2.entities.meta.ContractType;
import bd2.entities.meta.JobStatus;

import javax.persistence.*;
import java.util.Set;

@Entity
@Table(name="TicketCollector")
public class TicketCollector {

	@Id
	@GeneratedValue(strategy= GenerationType.IDENTITY)
	@Column(name="ticketCollectorId")
	private int id;

	@OneToMany(
			mappedBy = "ticketCollector",
			cascade = CascadeType.ALL
	)
	private Set<Complaint> complaints;

	@OneToMany(
			mappedBy = "ticketCollector",
			cascade = CascadeType.ALL
	)
	private Set<Payroll> payrolls;

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

	@ManyToOne(
			fetch = FetchType.EAGER,
			cascade = CascadeType.ALL
	)
	@JoinColumn(name="controlScheduleId")
	private ControlSchedule controlSchedule;

	@ManyToOne(
			fetch = FetchType.EAGER,
			cascade = CascadeType.ALL
	)
	@JoinColumn(name="jobStatusId")
	private JobStatus jobStatus;

	@OneToMany(
			mappedBy = "colleagueTicketCollector",
			cascade = CascadeType.ALL
	)
	private Set<TicketCollector> colleagues;

	@ManyToOne(
			fetch = FetchType.EAGER,
			cascade = CascadeType.ALL
	)
	@JoinColumn(name="colleagueTicketCollectorId")
	private TicketCollector colleagueTicketCollector;
}
