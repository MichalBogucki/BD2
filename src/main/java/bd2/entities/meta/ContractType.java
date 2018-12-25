package bd2.entities.meta;

import bd2.entities.TicketCollector;

import javax.persistence.*;
import java.util.Set;

@Entity
@Table(name="meta.ContractType")
public class ContractType {

	@Id
	@GeneratedValue(strategy= GenerationType.IDENTITY)
	@Column(name="contractTypeId")
	private int id;

	@OneToMany(
			mappedBy = "contractType",
			cascade = CascadeType.ALL
	)
	private Set<TicketCollector> ticketCollectors;

	@Column(name="contractType")
	private String contractType;

	@Column(name="commission")
	private Integer commission;

	@Column(name="fineQuota")
	private Integer fineQuota;

	@Column(name="baseGrossSalary")
	private Integer baseGrossSalary;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Set<TicketCollector> getTicketCollectors() {
		return ticketCollectors;
	}

	public void setTicketCollectors(Set<TicketCollector> ticketCollectors) {
		this.ticketCollectors = ticketCollectors;
	}

	public String getContractType() {
		return contractType;
	}

	public void setContractType(String contractType) {
		this.contractType = contractType;
	}

	public Integer getCommission() {
		return commission;
	}

	public void setCommission(Integer commission) {
		this.commission = commission;
	}

	public Integer getFineQuota() {
		return fineQuota;
	}

	public void setFineQuota(Integer fineQuota) {
		this.fineQuota = fineQuota;
	}

	public Integer getBaseGrossSalary() {
		return baseGrossSalary;
	}

	public void setBaseGrossSalary(Integer baseGrossSalary) {
		this.baseGrossSalary = baseGrossSalary;
	}
}
