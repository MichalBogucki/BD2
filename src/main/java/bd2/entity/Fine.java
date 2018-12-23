package bd2.entity;

import bd2.entity.meta.FineType;
import bd2.entity.meta.PaymentStatus;

import javax.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name="Fine")
public class Fine {

	@Id
	@GeneratedValue(strategy= GenerationType.IDENTITY)
	@Column(name="fineId")
	private int id;

	@ManyToOne(cascade = {
			CascadeType.DETACH,
			CascadeType.MERGE,
			CascadeType.PERSIST,
			CascadeType.REFRESH
	})
	@JoinColumn(name="ticketCollectorId")
	private TicketCollector ticketCollector;

	@ManyToOne(cascade = {
			CascadeType.DETACH,
			CascadeType.MERGE,
			CascadeType.PERSIST,
			CascadeType.REFRESH
	})
	@JoinColumn(name="passengerId")
	private Passenger passenger;

	private LocalDateTime writingDate;

	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name="fineTypeId")
	private FineType fineType;

	private Double fineAmountWithInterests;

	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name="paymentStatusId")
	private PaymentStatus paymentStatus;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public TicketCollector getTicketCollector() {
		return ticketCollector;
	}

	public void setTicketCollector(TicketCollector ticketCollector) {
		this.ticketCollector = ticketCollector;
	}

	public Passenger getPassenger() {
		return passenger;
	}

	public void setPassenger(Passenger passenger) {
		this.passenger = passenger;
	}

	public LocalDateTime getWritingDate() {
		return writingDate;
	}

	public void setWritingDate(LocalDateTime writingDate) {
		this.writingDate = writingDate;
	}

	public FineType getFineType() {
		return fineType;
	}

	public void setFineType(FineType fineType) {
		this.fineType = fineType;
	}

	public Double getFineAmountWithInterests() {
		return fineAmountWithInterests;
	}

	public void setFineAmountWithInterests(Double fineAmountWithInterests) {
		this.fineAmountWithInterests = fineAmountWithInterests;
	}

	public PaymentStatus getPaymentStatus() {
		return paymentStatus;
	}

	public void setPaymentStatus(PaymentStatus paymentStatus) {
		this.paymentStatus = paymentStatus;
	}
}
