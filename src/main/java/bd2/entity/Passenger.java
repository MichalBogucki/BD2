package bd2.entity;

import javax.persistence.*;

@Entity
@Table(name="dbo.Passenger")
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
	private int buildingNumber;

	@Column(name="flatNumber")
	private int flatNumber;

	@Column(name="nationality")
	private String nationality;

	@Column(name="birthCountry")
	private String birthCountry;

	@Column(name="birthCity")
	private String birthCity;

	@Column(name="birthDate")
	private String birthDate;
}
