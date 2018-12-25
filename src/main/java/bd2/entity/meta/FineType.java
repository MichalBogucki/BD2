package bd2.entity.meta;

import bd2.entity.Fine;

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
}
