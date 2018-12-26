package bd2.config;

import bd2.service.AuthenticationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.NoOpPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import javax.sql.DataSource;

@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true)
@ComponentScan("bd2")
@EnableTransactionManagement
@PropertySource({ "classpath:persistence-mssql.properties" })
public class SecurityConfig extends WebSecurityConfigurerAdapter {

	@Autowired
	AuthenticationService authenticationService;

	@Autowired
	private Environment env;

	@Bean
	public DataSource myDataSource() {

		DriverManagerDataSource myDataSource = new DriverManagerDataSource();

		myDataSource.setDriverClassName(env.getProperty("jdbc.driver"));
		myDataSource.setUrl(env.getProperty("jdbc.url"));
		myDataSource.setUsername(env.getProperty("jdbc.user"));
		myDataSource.setPassword(env.getProperty("jdbc.password"));

		return myDataSource;
	}

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
		auth.userDetailsService(authenticationService).passwordEncoder(NoOpPasswordEncoder.getInstance());
//		auth.jdbcAuthentication().passwordEncoder(passwordEncoder()).dataSource(myDataSource());
	}

	@Bean
	public PasswordEncoder passwordEncoder(){
		return new BCryptPasswordEncoder();
	}
}
