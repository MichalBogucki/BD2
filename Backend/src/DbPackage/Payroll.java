package DbPackage;

import javax.persistence.*;
import java.util.Objects;

@Entity
public class Payroll {
    private int payrollId;
    private int ticketCollectorId;
    private int contractTypeId;
    private double totalGrossSalary;
    private double bonus;
    private int year;
    private int month;
    private metaContractType contractTypeByPayrollId;
    private TicketCollector ticketCollectorByPayrollId;

    @Id
    @Column(name = "PayrollId", nullable = false)
    public int getPayrollId() {
        return payrollId;
    }

    public void setPayrollId(int payrollId) {
        this.payrollId = payrollId;
    }

    @Basic
    @Column(name = "TicketCollectorId", nullable = false)
    public int getTicketCollectorId() {
        return ticketCollectorId;
    }

    public void setTicketCollectorId(int ticketCollectorId) {
        this.ticketCollectorId = ticketCollectorId;
    }

    @Basic
    @Column(name = "ContractTypeId", nullable = false)
    public int getContractTypeId() {
        return contractTypeId;
    }

    public void setContractTypeId(int contractTypeId) {
        this.contractTypeId = contractTypeId;
    }

    @Basic
    @Column(name = "TotalGrossSalary", nullable = false, precision = 0)
    public double getTotalGrossSalary() {
        return totalGrossSalary;
    }

    public void setTotalGrossSalary(double totalGrossSalary) {
        this.totalGrossSalary = totalGrossSalary;
    }

    @Basic
    @Column(name = "Bonus", nullable = false, precision = 0)
    public double getBonus() {
        return bonus;
    }

    public void setBonus(double bonus) {
        this.bonus = bonus;
    }

    @Basic
    @Column(name = "Year", nullable = false)
    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    @Basic
    @Column(name = "Month", nullable = false)
    public int getMonth() {
        return month;
    }

    public void setMonth(int month) {
        this.month = month;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Payroll payroll = (Payroll) o;
        return payrollId == payroll.payrollId &&
                ticketCollectorId == payroll.ticketCollectorId &&
                contractTypeId == payroll.contractTypeId &&
                Double.compare(payroll.totalGrossSalary, totalGrossSalary) == 0 &&
                Double.compare(payroll.bonus, bonus) == 0 &&
                year == payroll.year &&
                month == payroll.month;
    }

    @Override
    public int hashCode() {
        return Objects.hash(payrollId, ticketCollectorId, contractTypeId, totalGrossSalary, bonus, year, month);
    }

    @OneToOne
    @JoinColumn(name = "PayrollId", referencedColumnName = "ContractTypeId", nullable = false)
    public metaContractType getContractTypeByPayrollId() {
        return contractTypeByPayrollId;
    }

    public void setContractTypeByPayrollId(metaContractType contractTypeByPayrollId) {
        this.contractTypeByPayrollId = contractTypeByPayrollId;
    }

    @OneToOne
    @JoinColumn(name = "PayrollId", referencedColumnName = "TicketCollectorId", nullable = false)
    public TicketCollector getTicketCollectorByPayrollId() {
        return ticketCollectorByPayrollId;
    }

    public void setTicketCollectorByPayrollId(TicketCollector ticketCollectorByPayrollId) {
        this.ticketCollectorByPayrollId = ticketCollectorByPayrollId;
    }
}
