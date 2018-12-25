package bd2.entities;

import javax.persistence.*;
import java.math.BigDecimal;
import java.time.Month;
import java.time.Year;

@Entity
@Table(name="Payroll")
public class Payroll {

	@Id
	@GeneratedValue(strategy= GenerationType.IDENTITY)
	@Column(name="payrollId")
	private int id;

	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name="ticketCollectorId")
	private TicketCollector ticketCollector;

	@Column(name="totalGrossSalary")
	private BigDecimal totalGrossSalary;

	@Column(name="bonus")
	private BigDecimal bonus;

	@Column(name="year")
	private Year year;

	@Column(name="month")
	private Month month;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public TicketCollector getTicketCollector() {
		return ticketCollector;
	}

	public void setTicketCollector(TicketCollector ticketCollector) {
		this.ticketCollector = ticketCollector;
	}

	public BigDecimal getTotalGrossSalary() {
		return totalGrossSalary;
	}

	public void setTotalGrossSalary(BigDecimal totalGrossSalary) {
		this.totalGrossSalary = totalGrossSalary;
	}

	public BigDecimal getBonus() {
		return bonus;
	}

	public void setBonus(BigDecimal bonus) {
		this.bonus = bonus;
	}

	public Year getYear() {
		return year;
	}

	public void setYear(Year year) {
		this.year = year;
	}

	public Month getMonth() {
		return month;
	}

	public void setMonth(Month month) {
		this.month = month;
	}
}
