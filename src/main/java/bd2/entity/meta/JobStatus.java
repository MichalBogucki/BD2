package bd2.entity.meta;

import javax.persistence.*;

@Entity
@Table(name="meta.JobStatus")
public class JobStatus {

	@Id
	@GeneratedValue(strategy= GenerationType.IDENTITY)
	@Column(name="jobStatusId")
	private int id;
}
