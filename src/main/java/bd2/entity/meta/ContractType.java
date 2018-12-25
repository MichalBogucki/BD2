package bd2.entity.meta;

import bd2.entity.TicketCollector;

import javax.persistence.*;
import java.util.Set;

@Entity
@Table(name="meta.ContractType")
public class ContractType {

	@Id
	@GeneratedValue(strategy= GenerationType.IDENTITY)
	@Column(name="contractTypeId")
	private int id;

	@OneToMany(mappedBy = "contractType",
			cascade = CascadeType.ALL
	)
	private Set<TicketCollector> ticketCollectors;

	@Column(name="contractType")
	private String contractType;

	@Column(name="commission")
	private int commission;

	@Column(name="fineQuota")
	private int fineQuota;

	@Column(name="baseGrossSalary")
	private int baseGrossSalary;

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

	public int getCommission() {
		return commission;
	}

	public void setCommission(int commission) {
		this.commission = commission;
	}

	public int getFineQuota() {
		return fineQuota;
	}

	public void setFineQuota(int fineQuota) {
		this.fineQuota = fineQuota;
	}

	public int getBaseGrossSalary() {
		return baseGrossSalary;
	}

	public void setBaseGrossSalary(int baseGrossSalary) {
		this.baseGrossSalary = baseGrossSalary;
	}
}
