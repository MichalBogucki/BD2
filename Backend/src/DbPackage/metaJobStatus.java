package DbPackage;

import javax.persistence.Entity;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "JobStatus", schema = "meta", catalog = "bd2")
public class metaJobStatus {
    private TicketCollector ticketCollectorByJobStatusId;

    @OneToOne(mappedBy = "jobStatusByTicketCollectorId")
    public TicketCollector getTicketCollectorByJobStatusId() {
        return ticketCollectorByJobStatusId;
    }

    public void setTicketCollectorByJobStatusId(TicketCollector ticketCollectorByJobStatusId) {
        this.ticketCollectorByJobStatusId = ticketCollectorByJobStatusId;
    }
}
