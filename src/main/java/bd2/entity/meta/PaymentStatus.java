package bd2.entity.meta;

import bd2.entity.Fine;

import javax.persistence.*;

@Entity
@Table(name="meta.PaymentStatus")
public class PaymentStatus {

	@Id
	@GeneratedValue(strategy= GenerationType.IDENTITY)
	@Column(name="paymentStatusId")
	private int id;

	@OneToOne(mappedBy = "paymentStatus",
			cascade = {
					CascadeType.DETACH,
					CascadeType.MERGE,
					CascadeType.PERSIST,
					CascadeType.REFRESH
			})
	private Fine fine;
}
