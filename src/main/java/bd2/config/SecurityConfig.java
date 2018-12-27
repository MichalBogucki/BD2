package bd2.config;

import bd2.service.AuthenticationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

	@Autowired
	AuthenticationService authenticationService;

	@Override
	protected void configure(HttpSecurity http) throws Exception {

		http
				.authorizeRequests()
				.antMatchers("/home").permitAll()
				.antMatchers("/passengers/list").hasAnyRole("PASSENGER", "ADMIN")
				.anyRequest().authenticated()
				.and()
				.formLogin()
				.loginPage("/loginPage")
				.failureUrl("/loginError")
				.loginProcessingUrl("/authenticateUser")
				.permitAll()
				.and()
				.logout()
				.logoutSuccessUrl("/logout")
				.permitAll()
				.and()
				.exceptionHandling()
				.accessDeniedPage("/access-denied");
	}

	@Autowired
	public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(authenticationService).passwordEncoder(passwordEncoder());
	}

	@Bean
	public DaoAuthenticationProvider authenticationProvider() {
		DaoAuthenticationProvider auth = new DaoAuthenticationProvider();
		auth.setUserDetailsService(authenticationService);
		auth.setPasswordEncoder(passwordEncoder());
		return auth;
	}

	@Bean
	public PasswordEncoder passwordEncoder(){
		return new BCryptPasswordEncoder();
	}
}
