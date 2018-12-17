package DbPackage;

import javax.persistence.*;
import java.util.Objects;

@Entity
public class UserLogin {
    private int loginId;
    private String login;
    private String password;
    private int permissionId;
    private String phoneNumber;
    private String email;
    private String pesel;
    private metaPermissionType permissionTypeByLoginId;

    @Id
    @Column(name = "LoginId", nullable = false)
    public int getLoginId() {
        return loginId;
    }

    public void setLoginId(int loginId) {
        this.loginId = loginId;
    }

    @Basic
    @Column(name = "Login", nullable = false, length = 50)
    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    @Basic
    @Column(name = "Password", nullable = false, length = 50)
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Basic
    @Column(name = "PermissionId", nullable = false)
    public int getPermissionId() {
        return permissionId;
    }

    public void setPermissionId(int permissionId) {
        this.permissionId = permissionId;
    }

    @Basic
    @Column(name = "PhoneNumber", nullable = false, length = 9)
    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    @Basic
    @Column(name = "Email", nullable = false, length = 40)
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Basic
    @Column(name = "PESEL", nullable = false, length = 9)
    public String getPesel() {
        return pesel;
    }

    public void setPesel(String pesel) {
        this.pesel = pesel;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        UserLogin userLogin = (UserLogin) o;
        return loginId == userLogin.loginId &&
                permissionId == userLogin.permissionId &&
                Objects.equals(login, userLogin.login) &&
                Objects.equals(password, userLogin.password) &&
                Objects.equals(phoneNumber, userLogin.phoneNumber) &&
                Objects.equals(email, userLogin.email) &&
                Objects.equals(pesel, userLogin.pesel);
    }

    @Override
    public int hashCode() {
        return Objects.hash(loginId, login, password, permissionId, phoneNumber, email, pesel);
    }

    @OneToOne
    @JoinColumn(name = "LoginId", referencedColumnName = "PermissionId", nullable = false)
    public metaPermissionType getPermissionTypeByLoginId() {
        return permissionTypeByLoginId;
    }

    public void setPermissionTypeByLoginId(metaPermissionType permissionTypeByLoginId) {
        this.permissionTypeByLoginId = permissionTypeByLoginId;
    }
}
