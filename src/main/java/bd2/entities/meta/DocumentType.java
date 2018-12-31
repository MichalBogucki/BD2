package bd2.entities.meta;

import bd2.entities.Passenger;

import javax.persistence.*;
import java.util.Set;

@Entity
@Table(name="meta.DocumentType")
public class DocumentType {

	@Id
	@GeneratedValue(strategy= GenerationType.IDENTITY)
	@Column(name="documentTypeId")
	private Integer id;

	@OneToMany(
			mappedBy = "ticket",
			cascade = CascadeType.ALL
	)
	private Set<Passenger> passengers;

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
}
