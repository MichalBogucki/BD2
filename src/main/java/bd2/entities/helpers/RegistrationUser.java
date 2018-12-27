package bd2.entities.helpers;


import bd2.validation.FieldMatch;
import bd2.validation.ValidEmail;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.time.LocalDate;

/**
 * Class needed because Passenger and UserLogin is split into two tables, which breaks standard Spring configuration
 */
@FieldMatch.List({
		@FieldMatch(first = "password", second = "matchingPassword", message = "The password fields must match")
})
public class RegistrationUser {

	@NotNull(message = "is required")
	@Size(min = 1, message = "is required")
	private String login;

	@NotNull(message = "is required")
	@Size(min = 1, message = "is required")
	private String password;

	@NotNull(message = "is required")
	@Size(min = 1, message = "is required")
	private String matchingPassword;

	@NotNull(message = "is required")
	@Size(min = 1, message = "is required")
	private String name;

	@NotNull(message = "is required")
	@Size(min = 1, message = "is required")
	private String surname;

	@NotNull(message = "is required")
	@Size(min = 1, message = "is required")
	private String pesel;

	@NotNull(message = "is required")
	@Size(min = 1, message = "is required")
	private String city;

	@NotNull(message = "is required")
	@Size(min = 1, message = "is required")
	private String street;

	private Integer buildingNumber;

	private Integer flatNumber;

	@NotNull(message = "is required")
	@Size(min = 1, message = "is required")
	private String nationality;

	@NotNull(message = "is required")
	@Size(min = 1, message = "is required")
	private String birthCountry;

	@NotNull(message = "is required")
	@Size(min = 1, message = "is required")
	private String birthCity;

	@NotNull(message = "is required")
	@Size(min = 1, message = "is required")
	private LocalDate birthDate;

	@NotNull(message = "is required")
	@Size(min = 1, message = "is required")
	private String phoneNumber;

	@NotNull(message = "is required")
	@Size(min = 1, message = "is required")
	@ValidEmail
	private String email;

	public String getLogin() {
		return login;
	}

	public void setLogin(String login) {
		this.login = login;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getMatchingPassword() {
		return matchingPassword;
	}

	public void setMatchingPassword(String matchingPassword) {
		this.matchingPassword = matchingPassword;
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

	public LocalDate getBirthDate() {
		return birthDate;
	}

	public void setBirthDate(LocalDate birthDate) {
		this.birthDate = birthDate;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
}
