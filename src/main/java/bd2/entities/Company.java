package bd2.entities;

import bd2.entities.meta.CompanyName;

import javax.persistence.*;
import java.util.Set;

@Entity
@Table(name="Company")
public class Company {

	@Id
	@GeneratedValue(strategy= GenerationType.IDENTITY)
	@Column(name="companyId")
	private Integer id;

	@OneToMany(
			mappedBy = "company",
			cascade = CascadeType.ALL
	)
	private Set<Accounts> accounts;

	@OneToMany(
			mappedBy = "company",
			cascade = CascadeType.ALL
	)
	private Set<TicketCollector> ticketCollectors;

	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "companyNameId")
	private CompanyName companyName;

	@Column(name="city")
	private String city;

	@Column(name="street")
	private String street;

	@Column(name="buildingNumber")
	private int buildingNumber;

	@Column(name="postalCode")
	private String postalCode;

	@Column(name="phoneNumber")
	private String phoneNumber;

	@Column(name="emailAddress")
	private String emailAddress;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Set<Accounts> getAccounts() {
		return accounts;
	}

	public void setAccounts(Set<Accounts> accounts) {
		this.accounts = accounts;
	}

	public Set<TicketCollector> getTicketCollectors() {
		return ticketCollectors;
	}

	public void setTicketCollectors(Set<TicketCollector> ticketCollectors) {
		this.ticketCollectors = ticketCollectors;
	}

	public CompanyName getCompanyName() {
		return companyName;
	}

	public void setCompanyName(CompanyName companyName) {
		this.companyName = companyName;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getStreet() {
		return street;
	}

	public void setStreet(String street) {
		this.street = street;
	}

	public int getBuildingNumber() {
		return buildingNumber;
	}

	public void setBuildingNumber(int buildingNumber) {
		this.buildingNumber = buildingNumber;
	}

	public String getPostalCode() {
		return postalCode;
	}

	public void setPostalCode(String postalCode) {
		this.postalCode = postalCode;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getEmailAddress() {
		return emailAddress;
	}

	public void setEmailAddress(String emailAddress) {
		this.emailAddress = emailAddress;
	}
}
