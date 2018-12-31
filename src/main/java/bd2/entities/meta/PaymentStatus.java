package bd2.entities.meta;

import bd2.entities.Fine;

import javax.persistence.*;
import java.util.Set;

@Entity
@Table(name="meta.PaymentStatus")
public class PaymentStatus {

	@Id
	@GeneratedValue(strategy= GenerationType.IDENTITY)
	@Column(name="paymentStatusId")
	private Integer id;

	@OneToMany(
			mappedBy = "paymentStatus",
			cascade = CascadeType.ALL
	)
	private Set<Fine> fines;

	@Column(name="paymentStatus")
	private String paymentStatus;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Set<Fine> getFines() {
		return fines;
	}

	public void setFines(Set<Fine> fines) {
		this.fines = fines;
	}

	public String getPaymentStatus() {
		return paymentStatus;
	}

	public void setPaymentStatus(String paymentStatus) {
		this.paymentStatus = paymentStatus;
	}
}
