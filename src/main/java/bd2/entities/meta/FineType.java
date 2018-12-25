package bd2.entities.meta;

import bd2.entities.Fine;

import javax.persistence.*;
import java.util.Set;

@Entity
@Table(name="meta.FineType")
public class FineType {

	@Id
	@GeneratedValue(strategy= GenerationType.IDENTITY)
	@Column(name="fineTypeId")
	private int id;

	@OneToMany(
			mappedBy = "fineType",
			cascade = CascadeType.ALL
	)
	private Set<Fine> fines;

	@Column(name="fineType")
	private String fineType;

	@Column(name="fineAmount")
	private Integer fineAmount;

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

	public String getFineType() {
		return fineType;
	}

	public void setFineType(String fineType) {
		this.fineType = fineType;
	}

	public Integer getFineAmount() {
		return fineAmount;
	}

	public void setFineAmount(Integer fineAmount) {
		this.fineAmount = fineAmount;
	}
}
