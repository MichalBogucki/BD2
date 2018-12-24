package bd2.entity.meta;

import bd2.entity.Fine;

import javax.persistence.*;
import java.util.Set;

@Entity
@Table(name="meta.PaymentStatus")
public class PaymentStatus {

	@Id
	@GeneratedValue(strategy= GenerationType.IDENTITY)
	@Column(name="paymentStatusId")
	private int id;

	@OneToMany(mappedBy = "paymentStatus",
			cascade = {
					CascadeType.DETACH,
					CascadeType.MERGE,
					CascadeType.PERSIST,
					CascadeType.REFRESH
			})
	private Set<Fine> fines;

	@Column(name="paymentStatus")
	private String paymentStatus;

	public int getId() {
		return id;
	}

	public void setId(int id) {
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
