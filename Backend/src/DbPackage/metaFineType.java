package DbPackage;

import javax.persistence.Entity;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "FineType", schema = "meta", catalog = "bd2")
public class metaFineType {
    private Fine fineByFineTypeId;

    @OneToOne(mappedBy = "fineTypeByFineId")
    public Fine getFineByFineTypeId() {
        return fineByFineTypeId;
    }

    public void setFineByFineTypeId(Fine fineByFineTypeId) {
        this.fineByFineTypeId = fineByFineTypeId;
    }
}
