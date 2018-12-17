package DbPackage;

import javax.persistence.Entity;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "MeanOfTansport", schema = "meta", catalog = "bd2")
public class metaMeanOfTansport {
    private ControlSchedule controlScheduleByMeanOfTransportId;

    @OneToOne(mappedBy = "meanOfTansportByControlScheduleId")
    public ControlSchedule getControlScheduleByMeanOfTransportId() {
        return controlScheduleByMeanOfTransportId;
    }

    public void setControlScheduleByMeanOfTransportId(ControlSchedule controlScheduleByMeanOfTransportId) {
        this.controlScheduleByMeanOfTransportId = controlScheduleByMeanOfTransportId;
    }
}
