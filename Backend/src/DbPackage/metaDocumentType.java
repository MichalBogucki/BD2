package DbPackage;

import javax.persistence.Entity;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "DocumentType", schema = "meta", catalog = "bd2")
public class metaDocumentType {
    private Passenger passengerByDocumentTypeId;

    @OneToOne(mappedBy = "documentTypeByPersonId")
    public Passenger getPassengerByDocumentTypeId() {
        return passengerByDocumentTypeId;
    }

    public void setPassengerByDocumentTypeId(Passenger passengerByDocumentTypeId) {
        this.passengerByDocumentTypeId = passengerByDocumentTypeId;
    }
}
