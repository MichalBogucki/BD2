package DbPackage;

import javax.persistence.Entity;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "Region", schema = "meta", catalog = "bd2")
public class metaRegion {
    private ControlSchedule controlScheduleByRegionId;

    @OneToOne(mappedBy = "regionByControlScheduleId")
    public ControlSchedule getControlScheduleByRegionId() {
        return controlScheduleByRegionId;
    }

    public void setControlScheduleByRegionId(ControlSchedule controlScheduleByRegionId) {
        this.controlScheduleByRegionId = controlScheduleByRegionId;
    }
}
