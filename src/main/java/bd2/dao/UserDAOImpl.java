package bd2.dao;

import bd2.entities.helpers.Permission;
import bd2.entities.helpers.UserInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;

@Repository
public class UserDAOImpl {

	private JdbcTemplate jdbcTemplate;

	@Autowired
	public void setDataSource(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	public UserInfo getUserInfo(String username) {
		String sql = "SELECT ul.login username, ul.password pass, ul.passengerId passengerId, pt.permissionType role FROM "+
				"userlogin ul JOIN meta.permissiontype pt on ul.permissionId = pt.permissionId WHERE "+
				"ul.login = ?";
		UserInfo userInfo = jdbcTemplate.queryForObject(sql, new Object[]{username},
				(result, rowNum) -> {
					UserInfo user = new UserInfo();
					user.setUsername(result.getString("username"));
					user.setPassword(result.getString("pass"));
					user.setPermission(Permission.valueOf(result.getString("role")));
					user.setPassengerId((Integer) result.getObject("passengerId"));
					return user;
				});
		return userInfo;
	}
}
