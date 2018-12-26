package bd2.dao.api;

import bd2.entities.helpers.UserInfo;

import javax.sql.DataSource;

public interface UserDAO {

	void setDataSource(DataSource dataSource);

	UserInfo getUserInfo(String username);
}
