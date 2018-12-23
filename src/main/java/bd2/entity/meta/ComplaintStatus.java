package bd2.entity.meta;

import javax.persistence.*;

@Entity
@Table(name="meta.ComplaintStatus")
public class ComplaintStatus {

	@Id
	@GeneratedValue(strategy= GenerationType.IDENTITY)
	@Column(name="complaintStatusId")
	private int id;
}
