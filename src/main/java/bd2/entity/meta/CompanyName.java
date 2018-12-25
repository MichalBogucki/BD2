package bd2.entity.meta;

import bd2.entity.Company;

import javax.persistence.*;

@Entity
@Table(name="meta.CompanyName")
public class CompanyName {

	@Id
	@GeneratedValue(strategy= GenerationType.IDENTITY)
	@Column(name="companyNameId")
	private int id;

	@OneToOne(
			mappedBy = "companyName",
			cascade = CascadeType.ALL
	)
	private Company company;

	@Column(name="nationalBusinessregistryNumber")
	private String nationalBusinessregistryNumber;

	@Column(name="taxNumber")
	private String taxNumber;

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

	public String getNationalBusinessregistryNumber() {
		return nationalBusinessregistryNumber;
	}

	public void setNationalBusinessregistryNumber(String nationalBusinessregistryNumber) {
		this.nationalBusinessregistryNumber = nationalBusinessregistryNumber;
	}

	public String getTaxNumber() {
		return taxNumber;
	}

	public void setTaxNumber(String taxNumber) {
		this.taxNumber = taxNumber;
	}
}
