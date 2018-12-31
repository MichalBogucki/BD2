package bd2.entities;

import bd2.entities.meta.FineType;
import bd2.entities.meta.PaymentStatus;

import javax.persistence.*;
import java.math.BigDecimal;
import java.time.LocalDateTime;

@Entity
@Table(name="Fine")
public class Fine {

	@Id
	@GeneratedValue(strategy= GenerationType.IDENTITY)
	@Column(name="fineId")
	private Integer id;

	@ManyToOne(
			fetch = FetchType.EAGER,
			cascade = CascadeType.ALL
	)
	@JoinColumn(name="ticketCollectorId")
	private TicketCollector ticketCollector;

	@ManyToOne(
			fetch = FetchType.EAGER,
			cascade = CascadeType.ALL
	)
	@JoinColumn(name="passengerId")
	private Passenger passenger;

	@Column(name="writingDate")
	private LocalDateTime writingDate;

	@ManyToOne(
			fetch = FetchType.EAGER,
			cascade = CascadeType.ALL
	)
	@JoinColumn(name="fineTypeId")
	private FineType fineType;

	@Column(name="fineAmountWithInterests")
	private BigDecimal fineAmountWithInterests;

	@ManyToOne(
			fetch = FetchType.EAGER,
			cascade = CascadeType.ALL
	)
	@JoinColumn(name="paymentStatusId")
	private PaymentStatus paymentStatus;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
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

	public PaymentStatus getPaymentStatus() {
		return paymentStatus;
	}

	public void setPaymentStatus(PaymentStatus paymentStatus) {
		this.paymentStatus = paymentStatus;
	}

	public BigDecimal getFineAmountWithInterests() {
		return fineAmountWithInterests;
	}

	public void setFineAmountWithInterests(BigDecimal fineAmountWithInterests) {
		this.fineAmountWithInterests = fineAmountWithInterests;
	}
}
