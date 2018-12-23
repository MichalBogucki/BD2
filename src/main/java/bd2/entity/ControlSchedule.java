package bd2.entity;

import javax.persistence.*;

@Entity
@Table(name="ControlSchedule")
public class ControlSchedule {

	@Id
	@GeneratedValue(strategy= GenerationType.IDENTITY)
	@Column(name="controlScheduleId")
	private int id;
}
