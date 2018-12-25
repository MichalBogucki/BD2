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

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Set<Complaint> getComplaints() {
		return complaints;
	}

	public void setComplaints(Set<Complaint> complaints) {
		this.complaints = complaints;
	}

	public Set<Payroll> getPayrolls() {
		return payrolls;
	}

	public void setPayrolls(Set<Payroll> payrolls) {
		this.payrolls = payrolls;
	}

	public Company getCompany() {
		return company;
	}

	public void setCompany(Company company) {
		this.company = company;
	}

	public ContractType getContractType() {
		return contractType;
	}

	public void setContractType(ContractType contractType) {
		this.contractType = contractType;
	}

	public ControlSchedule getControlSchedule() {
		return controlSchedule;
	}

	public void setControlSchedule(ControlSchedule controlSchedule) {
		this.controlSchedule = controlSchedule;
	}

	public JobStatus getJobStatus() {
		return jobStatus;
	}

	public void setJobStatus(JobStatus jobStatus) {
		this.jobStatus = jobStatus;
	}

	public Set<TicketCollector> getColleagues() {
		return colleagues;
	}

	public void setColleagues(Set<TicketCollector> colleagues) {
		this.colleagues = colleagues;
	}

	public TicketCollector getColleagueTicketCollector() {
		return colleagueTicketCollector;
	}

	public void setColleagueTicketCollector(TicketCollector colleagueTicketCollector) {
		this.colleagueTicketCollector = colleagueTicketCollector;
	}
}
