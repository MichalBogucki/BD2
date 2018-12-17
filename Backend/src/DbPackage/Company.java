package DbPackage;

import javax.persistence.*;
import java.util.Objects;

@Entity
public class Company {
    private int companyId;
    private int companyNameId;
    private String city;
    private String street;
    private int buildingNumber;
    private String postalCode;
    private String phoneNumber;
    private String emailAddress;
    private Accounts accountsByCompanyId;
    private metaCompanyName companyNameByCompanyId;
    private TicketCollector ticketCollectorByCompanyId;

    @Id
    @Column(name = "CompanyId", nullable = false)
    public int getCompanyId() {
        return companyId;
    }

    public void setCompanyId(int companyId) {
        this.companyId = companyId;
    }

    @Basic
    @Column(name = "CompanyNameId", nullable = false)
    public int getCompanyNameId() {
        return companyNameId;
    }

    public void setCompanyNameId(int companyNameId) {
        this.companyNameId = companyNameId;
    }

    @Basic
    @Column(name = "City", nullable = false, length = 20)
    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    @Basic
    @Column(name = "Street", nullable = false, length = 30)
    public String getStreet() {
        return street;
    }

    public void setStreet(String street) {
        this.street = street;
    }

    @Basic
    @Column(name = "BuildingNumber", nullable = false)
    public int getBuildingNumber() {
        return buildingNumber;
    }

    public void setBuildingNumber(int buildingNumber) {
        this.buildingNumber = buildingNumber;
    }

    @Basic
    @Column(name = "PostalCode", nullable = false, length = 6)
    public String getPostalCode() {
        return postalCode;
    }

    public void setPostalCode(String postalCode) {
        this.postalCode = postalCode;
    }

    @Basic
    @Column(name = "PhoneNumber", nullable = false, length = 9)
    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    @Basic
    @Column(name = "EmailAddress", nullable = false, length = 30)
    public String getEmailAddress() {
        return emailAddress;
    }

    public void setEmailAddress(String emailAddress) {
        this.emailAddress = emailAddress;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Company company = (Company) o;
        return companyId == company.companyId &&
                companyNameId == company.companyNameId &&
                buildingNumber == company.buildingNumber &&
                Objects.equals(city, company.city) &&
                Objects.equals(street, company.street) &&
                Objects.equals(postalCode, company.postalCode) &&
                Objects.equals(phoneNumber, company.phoneNumber) &&
                Objects.equals(emailAddress, company.emailAddress);
    }

    @Override
    public int hashCode() {
        return Objects.hash(companyId, companyNameId, city, street, buildingNumber, postalCode, phoneNumber, emailAddress);
    }

    @OneToOne(mappedBy = "companyByAccountsId")
    public Accounts getAccountsByCompanyId() {
        return accountsByCompanyId;
    }

    public void setAccountsByCompanyId(Accounts accountsByCompanyId) {
        this.accountsByCompanyId = accountsByCompanyId;
    }

    @OneToOne
    @JoinColumn(name = "CompanyId", referencedColumnName = "CompanyNameId", nullable = false)
    public metaCompanyName getCompanyNameByCompanyId() {
        return companyNameByCompanyId;
    }

    public void setCompanyNameByCompanyId(metaCompanyName companyNameByCompanyId) {
        this.companyNameByCompanyId = companyNameByCompanyId;
    }

    @OneToOne(mappedBy = "companyByTicketCollectorId")
    public TicketCollector getTicketCollectorByCompanyId() {
        return ticketCollectorByCompanyId;
    }

    public void setTicketCollectorByCompanyId(TicketCollector ticketCollectorByCompanyId) {
        this.ticketCollectorByCompanyId = ticketCollectorByCompanyId;
    }
}
