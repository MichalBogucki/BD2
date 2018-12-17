package DbPackage;

import javax.persistence.Entity;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "CompanyName", schema = "meta", catalog = "bd2")
public class metaCompanyName {
    private Company companyByCompanyNameId;

    @OneToOne(mappedBy = "companyNameByCompanyId")
    public Company getCompanyByCompanyNameId() {
        return companyByCompanyNameId;
    }

    public void setCompanyByCompanyNameId(Company companyByCompanyNameId) {
        this.companyByCompanyNameId = companyByCompanyNameId;
    }
}
