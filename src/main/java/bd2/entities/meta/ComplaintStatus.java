package bd2.entities.meta;

import bd2.entities.Complaint;

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

	@Column(name="complaintStatus")
	private String complaintStatus;

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

	public String getComplaintStatus() {
		return complaintStatus;
	}

	public void setComplaintStatus(String complaintStatus) {
		this.complaintStatus = complaintStatus;
	}
}
