package bd2.entity.meta;

import bd2.entity.Passenger;

import javax.persistence.*;

@Entity
@Table(name="meta.DocumentType")
public class DocumentType {

	@Id
	@GeneratedValue(strategy= GenerationType.IDENTITY)
	@Column(name="documentTypeId")
	private int id;

	@OneToOne(mappedBy = "documentType",
			cascade = {
					CascadeType.DETACH,
					CascadeType.MERGE,
					CascadeType.PERSIST,
					CascadeType.REFRESH
			})
	private Passenger passenger;

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
}
