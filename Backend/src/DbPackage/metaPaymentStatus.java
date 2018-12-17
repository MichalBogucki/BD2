package DbPackage;

import javax.persistence.Entity;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "PaymentStatus", schema = "meta", catalog = "bd2")
public class metaPaymentStatus {
    private Fine fineByPaymentStatusId;

    @OneToOne(mappedBy = "paymentStatusByFineId")
    public Fine getFineByPaymentStatusId() {
        return fineByPaymentStatusId;
    }

    public void setFineByPaymentStatusId(Fine fineByPaymentStatusId) {
        this.fineByPaymentStatusId = fineByPaymentStatusId;
    }
}
