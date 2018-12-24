package bd2.entity.meta;

import bd2.entity.Passenger;

import javax.persistence.*;
import java.util.Set;

@Entity
@Table(name="meta.DocumentType")
public class DocumentType {

	@Id
	@GeneratedValue(strategy= GenerationType.IDENTITY)
	@Column(name="documentTypeId")
	private int id;

	@OneToMany(mappedBy = "ticket",
			cascade = {
					CascadeType.DETACH,
					CascadeType.MERGE,
					CascadeType.PERSIST,
					CascadeType.REFRESH
			})
	private Set<Passenger> passengers;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Set<Passenger> getPassengers() {
		return passengers;
	}

	public void setPassengers(Set<Passenger> passengers) {
		this.passengers = passengers;
	}
}
