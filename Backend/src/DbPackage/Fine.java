package DbPackage;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Objects;

@Entity
public class Fine {
    private int fineId;
    private int ticketCollectorId;
    private int personId;
    private Timestamp writingDate;
    private int fineTypeId;
    private double fineAmountWithInterests;
    private int paymentStatusId;
    private metaFineType fineTypeByFineId;
    private metaPaymentStatus paymentStatusByFineId;
    private Passenger passengerByFineId;
    private TicketCollector ticketCollectorByFineId;

    @Id
    @Column(name = "FineId", nullable = false)
    public int getFineId() {
        return fineId;
    }

    public void setFineId(int fineId) {
        this.fineId = fineId;
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
    @Column(name = "PersonId", nullable = false)
    public int getPersonId() {
        return personId;
    }

    public void setPersonId(int personId) {
        this.personId = personId;
    }

    @Basic
    @Column(name = "WritingDate", nullable = false)
    public Timestamp getWritingDate() {
        return writingDate;
    }

    public void setWritingDate(Timestamp writingDate) {
        this.writingDate = writingDate;
    }

    @Basic
    @Column(name = "FineTypeId", nullable = false)
    public int getFineTypeId() {
        return fineTypeId;
    }

    public void setFineTypeId(int fineTypeId) {
        this.fineTypeId = fineTypeId;
    }

    @Basic
    @Column(name = "FineAmountWithInterests", nullable = false, precision = 0)
    public double getFineAmountWithInterests() {
        return fineAmountWithInterests;
    }

    public void setFineAmountWithInterests(double fineAmountWithInterests) {
        this.fineAmountWithInterests = fineAmountWithInterests;
    }

    @Basic
    @Column(name = "PaymentStatusId", nullable = false)
    public int getPaymentStatusId() {
        return paymentStatusId;
    }

    public void setPaymentStatusId(int paymentStatusId) {
        this.paymentStatusId = paymentStatusId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Fine fine = (Fine) o;
        return fineId == fine.fineId &&
                ticketCollectorId == fine.ticketCollectorId &&
                personId == fine.personId &&
                fineTypeId == fine.fineTypeId &&
                Double.compare(fine.fineAmountWithInterests, fineAmountWithInterests) == 0 &&
                paymentStatusId == fine.paymentStatusId &&
                Objects.equals(writingDate, fine.writingDate);
    }

    @Override
    public int hashCode() {
        return Objects.hash(fineId, ticketCollectorId, personId, writingDate, fineTypeId, fineAmountWithInterests, paymentStatusId);
    }

    @OneToOne
    @JoinColumn(name = "FineId", referencedColumnName = "FineTypeId", nullable = false)
    public metaFineType getFineTypeByFineId() {
        return fineTypeByFineId;
    }

    public void setFineTypeByFineId(metaFineType fineTypeByFineId) {
        this.fineTypeByFineId = fineTypeByFineId;
    }

    @OneToOne
    @JoinColumn(name = "FineId", referencedColumnName = "PaymentStatusId", nullable = false)
    public metaPaymentStatus getPaymentStatusByFineId() {
        return paymentStatusByFineId;
    }

    public void setPaymentStatusByFineId(metaPaymentStatus paymentStatusByFineId) {
        this.paymentStatusByFineId = paymentStatusByFineId;
    }

    @OneToOne
    @JoinColumn(name = "FineId", referencedColumnName = "PersonId", nullable = false)
    public Passenger getPassengerByFineId() {
        return passengerByFineId;
    }

    public void setPassengerByFineId(Passenger passengerByFineId) {
        this.passengerByFineId = passengerByFineId;
    }

    @OneToOne
    @JoinColumn(name = "FineId", referencedColumnName = "TicketCollectorId", nullable = false)
    public TicketCollector getTicketCollectorByFineId() {
        return ticketCollectorByFineId;
    }

    public void setTicketCollectorByFineId(TicketCollector ticketCollectorByFineId) {
        this.ticketCollectorByFineId = ticketCollectorByFineId;
    }
}
