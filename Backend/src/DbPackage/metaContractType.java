package DbPackage;

import javax.persistence.Entity;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "ContractType", schema = "meta", catalog = "bd2")
public class metaContractType {
    private Payroll payrollByContractTypeId;

    @OneToOne(mappedBy = "contractTypeByPayrollId")
    public Payroll getPayrollByContractTypeId() {
        return payrollByContractTypeId;
    }

    public void setPayrollByContractTypeId(Payroll payrollByContractTypeId) {
        this.payrollByContractTypeId = payrollByContractTypeId;
    }
}
