package bd2.entities;

import bd2.entities.meta.MeanOfTransport;
import bd2.entities.meta.Region;

import javax.persistence.*;
import java.time.Month;
import java.util.Set;

@Entity
@Table(name="ControlSchedule")
public class ControlSchedule {

	@Id
	@GeneratedValue(strategy= GenerationType.IDENTITY)
	@Column(name="controlScheduleId")
	private int id;

	@Column(name="month")
	private Month month;

	@ManyToOne(
			fetch = FetchType.EAGER,
			cascade = CascadeType.ALL
	)
	@JoinColumn(name="regionId")
	private Region region;

	@ManyToOne(
			fetch = FetchType.EAGER,
			cascade = CascadeType.ALL
	)
	@JoinColumn(name="meanOfTransportId")
	private MeanOfTransport meanOfTransport;

	@OneToMany(
			mappedBy = "controlSchedule",
			cascade = CascadeType.ALL
	)
	private Set<TicketCollector> ticketCollectors;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Month getMonth() {
		return month;
	}

	public void setMonth(Month month) {
		this.month = month;
	}

	public Region getRegion() {
		return region;
	}

	public void setRegion(Region region) {
		this.region = region;
	}

	public MeanOfTransport getMeanOfTransport() {
		return meanOfTransport;
	}

	public void setMeanOfTransport(MeanOfTransport meanOfTransport) {
		this.meanOfTransport = meanOfTransport;
	}

	public Set<TicketCollector> getTicketCollectors() {
		return ticketCollectors;
	}

	public void setTicketCollectors(Set<TicketCollector> ticketCollectors) {
		this.ticketCollectors = ticketCollectors;
	}
}
