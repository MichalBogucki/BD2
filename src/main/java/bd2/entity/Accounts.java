package bd2.entity;

import javax.persistence.*;
import java.math.BigDecimal;
import java.time.Month;
import java.time.Year;

@Entity
@Table(name="Accounts")
public class Accounts {

	@Id
	@GeneratedValue(strategy= GenerationType.IDENTITY)
	@Column(name="accountsId")
	private int id;

	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name="companyId")
	private Company company;

	@Column(name="revenue")
	private BigDecimal revenue;

	@Column(name="operationalCost")
	private BigDecimal operationalCost;

	@Column(name="month")
	private Month month;

	@Column(name="year")
	private Year year;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Company getCompany() {
		return company;
	}

	public void setCompany(Company company) {
		this.company = company;
	}

	public BigDecimal getRevenue() {
		return revenue;
	}

	public void setRevenue(BigDecimal revenue) {
		this.revenue = revenue;
	}

	public BigDecimal getOperationalCost() {
		return operationalCost;
	}

	public void setOperationalCost(BigDecimal operationalCost) {
		this.operationalCost = operationalCost;
	}

	public Month getMonth() {
		return month;
	}

	public void setMonth(Month month) {
		this.month = month;
	}

	public Year getYear() {
		return year;
	}

	public void setYear(Year year) {
		this.year = year;
	}
}
