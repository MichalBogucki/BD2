package DbPackage;

import javax.persistence.Entity;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "PermissionType", schema = "meta", catalog = "bd2")
public class metaPermissionType {
    private UserLogin userLoginByPermissionId;

    @OneToOne(mappedBy = "permissionTypeByLoginId")
    public UserLogin getUserLoginByPermissionId() {
        return userLoginByPermissionId;
    }

    public void setUserLoginByPermissionId(UserLogin userLoginByPermissionId) {
        this.userLoginByPermissionId = userLoginByPermissionId;
    }
}
