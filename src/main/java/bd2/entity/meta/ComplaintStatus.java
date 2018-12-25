package bd2.entity.meta;

import bd2.entity.Complaint;

import javax.persistence.*;
import java.util.Set;

@Entity
@Table(name="meta.ComplaintStatus")
public class ComplaintStatus {

	@Id
	@GeneratedValue(strategy= GenerationType.IDENTITY)
	@Column(name="complaintStatusId")
	private int id;

	@OneToMany(
			mappedBy = "complaintStatus",
			cascade = CascadeType.ALL
	)
	private Set<Complaint> complaints;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Set<Complaint> getComplaints() {
		return complaints;
	}

	public void setComplaints(Set<Complaint> complaints) {
		this.complaints = complaints;
	}
}
