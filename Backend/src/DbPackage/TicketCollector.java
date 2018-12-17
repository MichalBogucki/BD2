package DbPackage;

import javax.persistence.*;
import java.sql.Date;
import java.util.Objects;

@Entity
public class TicketCollector {
    private int ticketCollectorId;
    private int companyId;
    private Integer controlScheduleId;
    private String name;
    private String surname;
    private Date medicalExamValidity;
    private Date birthDate;
    private int licenseNumber;
    private Date trainingValidity;
    private int jobStatusId;
    private String bankAccountNumber;
    private Integer colleagueTicketCollectorId;
    private Complaint complaintByTicketCollectorId;
    private Fine fineByTicketCollectorId;
    private Payroll payrollByTicketCollectorId;
    private Company companyByTicketCollectorId;
    private ControlSchedule controlScheduleByTicketCollectorId;
    private metaJobStatus jobStatusByTicketCollectorId;

    @Id
    @Column(name = "TicketCollectorId", nullable = false)
    public int getTicketCollectorId() {
        return ticketCollectorId;
    }

    public void setTicketCollectorId(int ticketCollectorId) {
        this.ticketCollectorId = ticketCollectorId;
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
    @Column(name = "ControlScheduleId", nullable = true)
    public Integer getControlScheduleId() {
        return controlScheduleId;
    }

    public void setControlScheduleId(Integer controlScheduleId) {
        this.controlScheduleId = controlScheduleId;
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
    @Column(name = "MedicalExamValidity", nullable = false)
    public Date getMedicalExamValidity() {
        return medicalExamValidity;
    }

    public void setMedicalExamValidity(Date medicalExamValidity) {
        this.medicalExamValidity = medicalExamValidity;
    }

    @Basic
    @Column(name = "BirthDate", nullable = false)
    public Date getBirthDate() {
        return birthDate;
    }

    public void setBirthDate(Date birthDate) {
        this.birthDate = birthDate;
    }

    @Basic
    @Column(name = "LicenseNumber", nullable = false)
    public int getLicenseNumber() {
        return licenseNumber;
    }

    public void setLicenseNumber(int licenseNumber) {
        this.licenseNumber = licenseNumber;
    }

    @Basic
    @Column(name = "TrainingValidity", nullable = false)
    public Date getTrainingValidity() {
        return trainingValidity;
    }

    public void setTrainingValidity(Date trainingValidity) {
        this.trainingValidity = trainingValidity;
    }

    @Basic
    @Column(name = "JobStatusId", nullable = false)
    public int getJobStatusId() {
        return jobStatusId;
    }

    public void setJobStatusId(int jobStatusId) {
        this.jobStatusId = jobStatusId;
    }

    @Basic
    @Column(name = "BankAccountNumber", nullable = false, length = 26)
    public String getBankAccountNumber() {
        return bankAccountNumber;
    }

    public void setBankAccountNumber(String bankAccountNumber) {
        this.bankAccountNumber = bankAccountNumber;
    }

    @Basic
    @Column(name = "ColleagueTicketCollectorId", nullable = true)
    public Integer getColleagueTicketCollectorId() {
        return colleagueTicketCollectorId;
    }

    public void setColleagueTicketCollectorId(Integer colleagueTicketCollectorId) {
        this.colleagueTicketCollectorId = colleagueTicketCollectorId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        TicketCollector that = (TicketCollector) o;
        return ticketCollectorId == that.ticketCollectorId &&
                companyId == that.companyId &&
                licenseNumber == that.licenseNumber &&
                jobStatusId == that.jobStatusId &&
                Objects.equals(controlScheduleId, that.controlScheduleId) &&
                Objects.equals(name, that.name) &&
                Objects.equals(surname, that.surname) &&
                Objects.equals(medicalExamValidity, that.medicalExamValidity) &&
                Objects.equals(birthDate, that.birthDate) &&
                Objects.equals(trainingValidity, that.trainingValidity) &&
                Objects.equals(bankAccountNumber, that.bankAccountNumber) &&
                Objects.equals(colleagueTicketCollectorId, that.colleagueTicketCollectorId);
    }

    @Override
    public int hashCode() {
        return Objects.hash(ticketCollectorId, companyId, controlScheduleId, name, surname, medicalExamValidity, birthDate, licenseNumber, trainingValidity, jobStatusId, bankAccountNumber, colleagueTicketCollectorId);
    }

    @OneToOne(mappedBy = "ticketCollectorByComplaintId")
    public Complaint getComplaintByTicketCollectorId() {
        return complaintByTicketCollectorId;
    }

    public void setComplaintByTicketCollectorId(Complaint complaintByTicketCollectorId) {
        this.complaintByTicketCollectorId = complaintByTicketCollectorId;
    }

    @OneToOne(mappedBy = "ticketCollectorByFineId")
    public Fine getFineByTicketCollectorId() {
        return fineByTicketCollectorId;
    }

    public void setFineByTicketCollectorId(Fine fineByTicketCollectorId) {
        this.fineByTicketCollectorId = fineByTicketCollectorId;
    }

    @OneToOne(mappedBy = "ticketCollectorByPayrollId")
    public Payroll getPayrollByTicketCollectorId() {
        return payrollByTicketCollectorId;
    }

    public void setPayrollByTicketCollectorId(Payroll payrollByTicketCollectorId) {
        this.payrollByTicketCollectorId = payrollByTicketCollectorId;
    }

    @OneToOne
    @JoinColumn(name = "TicketCollectorId", referencedColumnName = "CompanyId", nullable = false)
    public Company getCompanyByTicketCollectorId() {
        return companyByTicketCollectorId;
    }

    public void setCompanyByTicketCollectorId(Company companyByTicketCollectorId) {
        this.companyByTicketCollectorId = companyByTicketCollectorId;
    }

    @OneToOne
    @JoinColumn(name = "TicketCollectorId", referencedColumnName = "ControlScheduleId", nullable = false)
    public ControlSchedule getControlScheduleByTicketCollectorId() {
        return controlScheduleByTicketCollectorId;
    }

    public void setControlScheduleByTicketCollectorId(ControlSchedule controlScheduleByTicketCollectorId) {
        this.controlScheduleByTicketCollectorId = controlScheduleByTicketCollectorId;
    }

    @OneToOne
    @JoinColumn(name = "TicketCollectorId", referencedColumnName = "JobStatusId", nullable = false)
    public metaJobStatus getJobStatusByTicketCollectorId() {
        return jobStatusByTicketCollectorId;
    }

    public void setJobStatusByTicketCollectorId(metaJobStatus jobStatusByTicketCollectorId) {
        this.jobStatusByTicketCollectorId = jobStatusByTicketCollectorId;
    }
}
