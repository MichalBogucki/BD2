package bd2.entities;

import javax.persistence.*;
import java.time.LocalDate;
import java.util.Set;

@Entity
@Table(name="Ticket")
public class Ticket {

	@Id
	@GeneratedValue(strategy= GenerationType.IDENTITY)
	@Column(name="ticketId")
	private Integer id;

	@OneToMany(
			mappedBy = "ticket",
			cascade = CascadeType.ALL
	)
	private Set<Passenger> passengers;

	@Column(name="validity")
	private LocalDate validity;

	@Column(name="discount")
	private Integer discount;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Set<Passenger> getPassengers() {
		return passengers;
	}

	public void setPassengers(Set<Passenger> passengers) {
		this.passengers = passengers;
	}

	public LocalDate getValidity() {
		return validity;
	}

	public void setValidity(LocalDate validity) {
		this.validity = validity;
	}

	public Integer getDiscount() {
		return discount;
	}

	public void setDiscount(Integer discount) {
		this.discount = discount;
	}
}
