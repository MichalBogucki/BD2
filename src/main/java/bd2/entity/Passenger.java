package bd2.entity;

import javax.persistence.*;

@Entity
@Table(name="Passenger")
public class Passenger {

	@Id
	@GeneratedValue(strategy= GenerationType.IDENTITY)
	@Column(name="passengerId")
	private int id;

	@Column(name="name")
	private String name;

	@Column(name="surname")
	private String surname;

	@Column(name="pesel")
	private String pesel;

	@Column(name="documentSeries")
	private String documentSeries;

	@Column(name="city")
	private String city;

	@Column(name="street")
	private String street;

	@Column(name="buildingNumber")
	private Integer buildingNumber;

	@Column(name="flatNumber")
	private Integer flatNumber;

	@Column(name="nationality")
	private String nationality;

	@Column(name="birthCountry")
	private String birthCountry;

	@Column(name="birthCity")
	private String birthCity;

	@Column(name="birthDate")
	private String birthDate;

	public Passenger() {
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSurname() {
		return surname;
	}

	public void setSurname(String surname) {
		this.surname = surname;
	}

	public String getPesel() {
		return pesel;
	}

	public void setPesel(String pesel) {
		this.pesel = pesel;
	}

	public String getDocumentSeries() {
		return documentSeries;
	}

	public void setDocumentSeries(String documentSeries) {
		this.documentSeries = documentSeries;
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

	public Integer getBuildingNumber() {
		return buildingNumber;
	}

	public void setBuildingNumber(Integer buildingNumber) {
		this.buildingNumber = buildingNumber;
	}

	public Integer getFlatNumber() {
		return flatNumber;
	}

	public void setFlatNumber(Integer flatNumber) {
		this.flatNumber = flatNumber;
	}

	public String getNationality() {
		return nationality;
	}

	public void setNationality(String nationality) {
		this.nationality = nationality;
	}

	public String getBirthCountry() {
		return birthCountry;
	}

	public void setBirthCountry(String birthCountry) {
		this.birthCountry = birthCountry;
	}

	public String getBirthCity() {
		return birthCity;
	}

	public void setBirthCity(String birthCity) {
		this.birthCity = birthCity;
	}

	public String getBirthDate() {
		return birthDate;
	}

	public void setBirthDate(String birthDate) {
		this.birthDate = birthDate;
	}
}
