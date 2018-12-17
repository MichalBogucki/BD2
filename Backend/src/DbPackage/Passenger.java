package DbPackage;

import javax.persistence.*;
import java.sql.Date;
import java.util.Objects;

@Entity
public class Passenger {
    private int personId;
    private String name;
    private String surname;
    private String pesel;
    private int documentTypeId;
    private String documentSeries;
    private String fathersName;
    private String city;
    private String street;
    private int buildingNumber;
    private Integer flatNumber;
    private String nationality;
    private String birthCountry;
    private String birthCity;
    private Date birthDate;
    private Complaint complaintByPersonId;
    private Fine fineByPersonId;
    private metaDocumentType documentTypeByPersonId;

    @Id
    @Column(name = "PersonId", nullable = false)
    public int getPersonId() {
        return personId;
    }

    public void setPersonId(int personId) {
        this.personId = personId;
    }

    @Basic
    @Column(name = "Name", nullable = false, length = 30)
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Basic
    @Column(name = "Surname", nullable = false, length = 30)
    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    @Basic
    @Column(name = "PESEL", nullable = true)
    public String getPesel() {
        return pesel;
    }

    public void setPesel(String pesel) {
        this.pesel = pesel;
    }

    @Basic
    @Column(name = "DocumentTypeId", nullable = false)
    public int getDocumentTypeId() {
        return documentTypeId;
    }

    public void setDocumentTypeId(int documentTypeId) {
        this.documentTypeId = documentTypeId;
    }

    @Basic
    @Column(name = "DocumentSeries", nullable = false, length = 7)
    public String getDocumentSeries() {
        return documentSeries;
    }

    public void setDocumentSeries(String documentSeries) {
        this.documentSeries = documentSeries;
    }

    @Basic
    @Column(name = "FathersName", nullable = true, length = 30)
    public String getFathersName() {
        return fathersName;
    }

    public void setFathersName(String fathersName) {
        this.fathersName = fathersName;
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
    @Column(name = "FlatNumber", nullable = true)
    public Integer getFlatNumber() {
        return flatNumber;
    }

    public void setFlatNumber(Integer flatNumber) {
        this.flatNumber = flatNumber;
    }

    @Basic
    @Column(name = "Nationality", nullable = true, length = 20)
    public String getNationality() {
        return nationality;
    }

    public void setNationality(String nationality) {
        this.nationality = nationality;
    }

    @Basic
    @Column(name = "BirthCountry", nullable = true, length = 20)
    public String getBirthCountry() {
        return birthCountry;
    }

    public void setBirthCountry(String birthCountry) {
        this.birthCountry = birthCountry;
    }

    @Basic
    @Column(name = "BirthCity", nullable = true, length = 20)
    public String getBirthCity() {
        return birthCity;
    }

    public void setBirthCity(String birthCity) {
        this.birthCity = birthCity;
    }

    @Basic
    @Column(name = "BirthDate", nullable = false)
    public Date getBirthDate() {
        return birthDate;
    }

    public void setBirthDate(Date birthDate) {
        this.birthDate = birthDate;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Passenger passenger = (Passenger) o;
        return personId == passenger.personId &&
                documentTypeId == passenger.documentTypeId &&
                buildingNumber == passenger.buildingNumber &&
                Objects.equals(name, passenger.name) &&
                Objects.equals(surname, passenger.surname) &&
                Objects.equals(pesel, passenger.pesel) &&
                Objects.equals(documentSeries, passenger.documentSeries) &&
                Objects.equals(fathersName, passenger.fathersName) &&
                Objects.equals(city, passenger.city) &&
                Objects.equals(street, passenger.street) &&
                Objects.equals(flatNumber, passenger.flatNumber) &&
                Objects.equals(nationality, passenger.nationality) &&
                Objects.equals(birthCountry, passenger.birthCountry) &&
                Objects.equals(birthCity, passenger.birthCity) &&
                Objects.equals(birthDate, passenger.birthDate);
    }

    @Override
    public int hashCode() {
        return Objects.hash(personId, name, surname, pesel, documentTypeId, documentSeries, fathersName, city, street, buildingNumber, flatNumber, nationality, birthCountry, birthCity, birthDate);
    }

    @OneToOne(mappedBy = "passengerByComplaintId")
    public Complaint getComplaintByPersonId() {
        return complaintByPersonId;
    }

    public void setComplaintByPersonId(Complaint complaintByPersonId) {
        this.complaintByPersonId = complaintByPersonId;
    }

    @OneToOne(mappedBy = "passengerByFineId")
    public Fine getFineByPersonId() {
        return fineByPersonId;
    }

    public void setFineByPersonId(Fine fineByPersonId) {
        this.fineByPersonId = fineByPersonId;
    }

    @OneToOne
    @JoinColumn(name = "PersonId", referencedColumnName = "DocumentTypeId", nullable = false)
    public metaDocumentType getDocumentTypeByPersonId() {
        return documentTypeByPersonId;
    }

    public void setDocumentTypeByPersonId(metaDocumentType documentTypeByPersonId) {
        this.documentTypeByPersonId = documentTypeByPersonId;
    }
}
