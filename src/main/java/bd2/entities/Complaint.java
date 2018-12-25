package bd2.entities;

import bd2.entities.meta.ComplaintStatus;

import javax.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name="Complaint")
public class Complaint {

	@Id
	@GeneratedValue(strategy= GenerationType.IDENTITY)
	@Column(name="complaintId")
	private int id;

	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name="passengerId")
	private Passenger passenger;

	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name="ticketCollectorId")
	private TicketCollector ticketCollector;

	@Column(name="justification")
	private String justification;

	@Column(name="arrivalDate")
	private LocalDateTime arrivalDate;

	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name="complaintStatusId")
	private ComplaintStatus complaintStatus;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Passenger getPassenger() {
		return passenger;
	}

	public void setPassenger(Passenger passenger) {
		this.passenger = passenger;
	}

	public TicketCollector getTicketCollector() {
		return ticketCollector;
	}

	public void setTicketCollector(TicketCollector ticketCollector) {
		this.ticketCollector = ticketCollector;
	}

	public String getJustification() {
		return justification;
	}

	public void setJustification(String justification) {
		this.justification = justification;
	}

	public LocalDateTime getArrivalDate() {
		return arrivalDate;
	}

	public void setArrivalDate(LocalDateTime arrivalDate) {
		this.arrivalDate = arrivalDate;
	}

	public ComplaintStatus getComplaintStatus() {
		return complaintStatus;
	}

	public void setComplaintStatus(ComplaintStatus complaintStatus) {
		this.complaintStatus = complaintStatus;
	}
}
