package DbPackage;

import javax.persistence.*;
import java.util.Objects;

@Entity
public class Accounts {
    private int accountsId;
    private int companyId;
    private double revenue;
    private double operationalCost;
    private int month;
    private int year;
    private Company companyByAccountsId;

    @Id
    @Column(name = "AccountsId", nullable = false)
    public int getAccountsId() {
        return accountsId;
    }

    public void setAccountsId(int accountsId) {
        this.accountsId = accountsId;
    }

    @Basic
    @Column(name = "CompanyId", nullable = false)
    public int getCompanyId() {
        return companyId;
    }

    public void setCompanyId(int companyId) {
        this.companyId = companyId;
    }

    @Basic
    @Column(name = "Revenue", nullable = false, precision = 0)
    public double getRevenue() {
        return revenue;
    }

    public void setRevenue(double revenue) {
        this.revenue = revenue;
    }

    @Basic
    @Column(name = "OperationalCost", nullable = false, precision = 0)
    public double getOperationalCost() {
        return operationalCost;
    }

    public void setOperationalCost(double operationalCost) {
        this.operationalCost = operationalCost;
    }

    @Basic
    @Column(name = "Month", nullable = false)
    public int getMonth() {
        return month;
    }

    public void setMonth(int month) {
        this.month = month;
    }

    @Basic
    @Column(name = "Year", nullable = false)
    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Accounts accounts = (Accounts) o;
        return accountsId == accounts.accountsId &&
                companyId == accounts.companyId &&
                Double.compare(accounts.revenue, revenue) == 0 &&
                Double.compare(accounts.operationalCost, operationalCost) == 0 &&
                month == accounts.month &&
                year == accounts.year;
    }

    @Override
    public int hashCode() {
        return Objects.hash(accountsId, companyId, revenue, operationalCost, month, year);
    }

    @OneToOne
    @JoinColumn(name = "AccountsId", referencedColumnName = "CompanyId", nullable = false)
    public Company getCompanyByAccountsId() {
        return companyByAccountsId;
    }

    public void setCompanyByAccountsId(Company companyByAccountsId) {
        this.companyByAccountsId = companyByAccountsId;
    }
}
