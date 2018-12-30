package bd2.entities;

import bd2.entities.meta.ContractType;
import bd2.entities.meta.JobStatus;

import javax.persistence.*;
import java.time.LocalDate;
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

	@Column(name="name")
	private String name;

	@Column(name="surname")
	private String surname;

	@Column(name="medicalExamValidity")
	private LocalDate medicalExamValidity;

	@Column(name="trainingValidity")
	private LocalDate trainingValidity;

	@Column(name="birthDate")
	private LocalDate birthDate;

	@Column(name="licenseNumber")
	private int licenseNumber;

	@Column(name="bankAccountNumber")
	private String bankAccountNumber;

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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSurname() {
		return surname;
	}

	public void setSurname(String surname) {
		this.surname = surname;
	}

	public LocalDate getMedicalExamValidity() {
		return medicalExamValidity;
	}

	public void setMedicalExamValidity(LocalDate medicalExamValidity) {
		this.medicalExamValidity = medicalExamValidity;
	}

	public LocalDate getTrainingValidity() {
		return trainingValidity;
	}

	public void setTrainingValidity(LocalDate trainingValidity) {
		this.trainingValidity = trainingValidity;
	}

	public LocalDate getBirthDate() {
		return birthDate;
	}

	public void setBirthDate(LocalDate birthDate) {
		this.birthDate = birthDate;
	}

	public int getLicenseNumber() {
		return licenseNumber;
	}

	public void setLicenseNumber(int licenseNumber) {
		this.licenseNumber = licenseNumber;
	}

	public String getBankAccountNumber() {
		return bankAccountNumber;
	}

	public void setBankAccountNumber(String bankAccountNumber) {
		this.bankAccountNumber = bankAccountNumber;
	}
}
