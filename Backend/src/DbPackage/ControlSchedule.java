package DbPackage;

import javax.persistence.*;
import java.util.Objects;

@Entity
public class ControlSchedule {
    private int controlScheduleId;
    private int regionId;
    private int meanOfTransportId;
    private int month;
    private metaMeanOfTansport meanOfTansportByControlScheduleId;
    private metaRegion regionByControlScheduleId;
    private TicketCollector ticketCollectorByControlScheduleId;

    @Id
    @Column(name = "ControlScheduleId", nullable = false)
    public int getControlScheduleId() {
        return controlScheduleId;
    }

    public void setControlScheduleId(int controlScheduleId) {
        this.controlScheduleId = controlScheduleId;
    }

    @Basic
    @Column(name = "RegionId", nullable = false)
    public int getRegionId() {
        return regionId;
    }

    public void setRegionId(int regionId) {
        this.regionId = regionId;
    }

    @Basic
    @Column(name = "MeanOfTransportId", nullable = false)
    public int getMeanOfTransportId() {
        return meanOfTransportId;
    }

    public void setMeanOfTransportId(int meanOfTransportId) {
        this.meanOfTransportId = meanOfTransportId;
    }

    @Basic
    @Column(name = "Month", nullable = false)
    public int getMonth() {
        return month;
    }

    public void setMonth(int month) {
        this.month = month;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        ControlSchedule that = (ControlSchedule) o;
        return controlScheduleId == that.controlScheduleId &&
                regionId == that.regionId &&
                meanOfTransportId == that.meanOfTransportId &&
                month == that.month;
    }

    @Override
    public int hashCode() {
        return Objects.hash(controlScheduleId, regionId, meanOfTransportId, month);
    }

    @OneToOne
    @JoinColumn(name = "ControlScheduleId", referencedColumnName = "MeanOfTransportId", nullable = false)
    public metaMeanOfTansport getMeanOfTansportByControlScheduleId() {
        return meanOfTansportByControlScheduleId;
    }

    public void setMeanOfTansportByControlScheduleId(metaMeanOfTansport meanOfTansportByControlScheduleId) {
        this.meanOfTansportByControlScheduleId = meanOfTansportByControlScheduleId;
    }

    @OneToOne
    @JoinColumn(name = "ControlScheduleId", referencedColumnName = "RegionId", nullable = false)
    public metaRegion getRegionByControlScheduleId() {
        return regionByControlScheduleId;
    }

    public void setRegionByControlScheduleId(metaRegion regionByControlScheduleId) {
        this.regionByControlScheduleId = regionByControlScheduleId;
    }

    @OneToOne(mappedBy = "controlScheduleByTicketCollectorId")
    public TicketCollector getTicketCollectorByControlScheduleId() {
        return ticketCollectorByControlScheduleId;
    }

    public void setTicketCollectorByControlScheduleId(TicketCollector ticketCollectorByControlScheduleId) {
        this.ticketCollectorByControlScheduleId = ticketCollectorByControlScheduleId;
    }
}
