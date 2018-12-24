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

	@OneToMany(mappedBy = "complaintStatus",
			cascade = {
					CascadeType.DETACH,
					CascadeType.MERGE,
					CascadeType.PERSIST,
					CascadeType.REFRESH
			})
	private Set<Complaint> complaints;
}
