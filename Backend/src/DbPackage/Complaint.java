package DbPackage;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Objects;

@Entity
public class Complaint {
    private int complaintId;
    private Integer personId;
    private Integer ticketCollectorId;
    private String justification;
    private Timestamp arrivalDate;
    private int complaintStatusId;
    private metaComplaintStatus complaintStatusByComplaintId;
    private Passenger passengerByComplaintId;
    private TicketCollector ticketCollectorByComplaintId;

    @Id
    @Column(name = "ComplaintId", nullable = false)
    public int getComplaintId() {
        return complaintId;
    }

    public void setComplaintId(int complaintId) {
        this.complaintId = complaintId;
    }

    @Basic
    @Column(name = "PersonId", nullable = true)
    public Integer getPersonId() {
        return personId;
    }

    public void setPersonId(Integer personId) {
        this.personId = personId;
    }

    @Basic
    @Column(name = "TicketCollectorId", nullable = true)
    public Integer getTicketCollectorId() {
        return ticketCollectorId;
    }

    public void setTicketCollectorId(Integer ticketCollectorId) {
        this.ticketCollectorId = ticketCollectorId;
    }

    @Basic
    @Column(name = "Justification", nullable = false, length = 3000)
    public String getJustification() {
        return justification;
    }

    public void setJustification(String justification) {
        this.justification = justification;
    }

    @Basic
    @Column(name = "ArrivalDate", nullable = false)
    public Timestamp getArrivalDate() {
        return arrivalDate;
    }

    public void setArrivalDate(Timestamp arrivalDate) {
        this.arrivalDate = arrivalDate;
    }

    @Basic
    @Column(name = "ComplaintStatusId", nullable = false)
    public int getComplaintStatusId() {
        return complaintStatusId;
    }

    public void setComplaintStatusId(int complaintStatusId) {
        this.complaintStatusId = complaintStatusId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Complaint complaint = (Complaint) o;
        return complaintId == complaint.complaintId &&
                complaintStatusId == complaint.complaintStatusId &&
                Objects.equals(personId, complaint.personId) &&
                Objects.equals(ticketCollectorId, complaint.ticketCollectorId) &&
                Objects.equals(justification, complaint.justification) &&
                Objects.equals(arrivalDate, complaint.arrivalDate);
    }

    @Override
    public int hashCode() {
        return Objects.hash(complaintId, personId, ticketCollectorId, justification, arrivalDate, complaintStatusId);
    }

    @OneToOne
    @JoinColumn(name = "ComplaintId", referencedColumnName = "ComplaintStatusId", nullable = false)
    public metaComplaintStatus getComplaintStatusByComplaintId() {
        return complaintStatusByComplaintId;
    }

    public void setComplaintStatusByComplaintId(metaComplaintStatus complaintStatusByComplaintId) {
        this.complaintStatusByComplaintId = complaintStatusByComplaintId;
    }

    @OneToOne
    @JoinColumn(name = "ComplaintId", referencedColumnName = "PersonId", nullable = false)
    public Passenger getPassengerByComplaintId() {
        return passengerByComplaintId;
    }

    public void setPassengerByComplaintId(Passenger passengerByComplaintId) {
        this.passengerByComplaintId = passengerByComplaintId;
    }

    @OneToOne
    @JoinColumn(name = "ComplaintId", referencedColumnName = "TicketCollectorId", nullable = false)
    public TicketCollector getTicketCollectorByComplaintId() {
        return ticketCollectorByComplaintId;
    }

    public void setTicketCollectorByComplaintId(TicketCollector ticketCollectorByComplaintId) {
        this.ticketCollectorByComplaintId = ticketCollectorByComplaintId;
    }
}
