package bd2.entities.meta;

import bd2.entities.ControlSchedule;

import javax.persistence.*;
import java.util.Set;

@Entity
@Table(name="meta.MeanOfTransport")
public class MeanOfTransport {

	@Id
	@GeneratedValue(strategy= GenerationType.IDENTITY)
	@Column(name="meanOfTransportId")
	private int id;

	@OneToMany(
			mappedBy = "meanOfTransport",
			cascade = CascadeType.ALL
	)
	private Set<ControlSchedule> controlSchedules;

	@Column(name="transportName")
	private String transportName;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Set<ControlSchedule> getControlSchedules() {
		return controlSchedules;
	}

	public void setControlSchedules(Set<ControlSchedule> controlSchedules) {
		this.controlSchedules = controlSchedules;
	}

	public String getTransportName() {
		return transportName;
	}

	public void setTransportName(String transportName) {
		this.transportName = transportName;
	}
}
