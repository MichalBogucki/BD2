package bd2.service;

import bd2.dao.UserDAOImpl;
import bd2.entities.helpers.UserInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.Arrays;

@Service
public class AuthenticationService implements UserDetailsService {

	@Autowired
	private UserDAOImpl userDAO;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
			UserInfo userInfo = userDAO.getUserInfo(username);
			GrantedAuthority authority = new SimpleGrantedAuthority(userInfo.getPermission().toString());
			UserDetails userDetails = new User(userInfo.getUsername(),
					userInfo.getPassword(), Arrays.asList(authority));
			return userDetails;
	}
}
