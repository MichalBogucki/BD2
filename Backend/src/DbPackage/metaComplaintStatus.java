package DbPackage;

import javax.persistence.Entity;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "ComplaintStatus", schema = "meta", catalog = "bd2")
public class metaComplaintStatus {
    private Complaint complaintByComplaintStatusId;

    @OneToOne(mappedBy = "complaintStatusByComplaintId")
    public Complaint getComplaintByComplaintStatusId() {
        return complaintByComplaintStatusId;
    }

    public void setComplaintByComplaintStatusId(Complaint complaintByComplaintStatusId) {
        this.complaintByComplaintStatusId = complaintByComplaintStatusId;
    }
}
