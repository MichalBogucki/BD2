package bd2.entities.meta;

import bd2.entities.ControlSchedule;

import javax.persistence.*;
import java.util.Set;

@Entity
@Table(name="meta.Region")
public class Region {

	@Id
	@GeneratedValue(strategy= GenerationType.IDENTITY)
	@Column(name="regionId")
	private int id;

	@OneToMany(
			mappedBy = "region",
			cascade = CascadeType.ALL
	)
	private Set<ControlSchedule> controlSchedules;

	@Column(name="regionName")
	private String regionName;

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

	public String getRegionName() {
		return regionName;
	}

	public void setRegionName(String regionName) {
		this.regionName = regionName;
	}
}
