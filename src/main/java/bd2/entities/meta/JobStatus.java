package bd2.entities.meta;

import bd2.entities.TicketCollector;

import javax.persistence.*;
import java.util.Set;

@Entity
@Table(name="meta.JobStatus")
public class JobStatus {

	@Id
	@GeneratedValue(strategy= GenerationType.IDENTITY)
	@Column(name="jobStatusId")
	private int id;

	@Column(name="jobStatus")
	private String jobStatus;

	@OneToMany(
			mappedBy = "jobStatus",
			cascade = CascadeType.ALL
	)
	private Set<TicketCollector> ticketCollectors;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getJobStatus() {
		return jobStatus;
	}

	public void setJobStatus(String jobStatus) {
		this.jobStatus = jobStatus;
	}

	public Set<TicketCollector> getTicketCollectors() {
		return ticketCollectors;
	}

	public void setTicketCollectors(Set<TicketCollector> ticketCollectors) {
		this.ticketCollectors = ticketCollectors;
	}
}
