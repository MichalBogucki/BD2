package bd2.config;

import bd2.entities.*;
import bd2.entities.meta.*;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.*;
import org.springframework.core.env.Environment;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.orm.hibernate5.HibernateTransactionManager;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import javax.sql.DataSource;
import java.util.Properties;
import java.util.logging.Logger;

@Configuration
@EnableWebMvc
@EnableGlobalMethodSecurity(prePostEnabled = true)
@ComponentScan("bd2")
@EnableTransactionManagement
@PropertySource({ "classpath:persistence-mssql.properties" })
@Import({ SecurityConfig.class })
public class AppConfig implements WebMvcConfigurer {

	private Class[] entitiesList = new Class[]{
			//meta
			CompanyName.class,
			ComplaintStatus.class,
			ContractType.class,
			DocumentType.class,
			FineType.class,
			JobStatus.class,
			MeanOfTransport.class,
			PaymentStatus.class,
			PermissionType.class,
			Region.class,
			//entities
			Accounts.class,
			Company.class,
			Complaint.class,
			ControlSchedule.class,
			Fine.class,
			Passenger.class,
			Payroll.class,
			Ticket.class,
			TicketCollector.class,
			UserLogin.class
	};

	@Autowired
	private Environment env;

	private Logger logger = Logger.getLogger(getClass().getName());

	@Override
	public void addViewControllers(ViewControllerRegistry registry) {
		registry.addViewController("/").setViewName("index");
	}

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/css/**").addResourceLocations("classpath:/css/");
	}

	@Bean
	public DataSource myDataSource() {

		DriverManagerDataSource myDataSource = new DriverManagerDataSource();

		myDataSource.setDriverClassName(env.getProperty("jdbc.driver"));

		logger.info("jdbc.url=" + env.getProperty("jdbc.url"));
		logger.info("jdbc.user=" + env.getProperty("jdbc.user"));

		myDataSource.setUrl(env.getProperty("jdbc.url"));
		myDataSource.setUsername(env.getProperty("jdbc.user"));
		myDataSource.setPassword(env.getProperty("jdbc.password"));

		return myDataSource;
	}

	private Properties getHibernateProperties() {

		Properties props = new Properties();

		props.setProperty("hibernate.dialect", env.getProperty("hibernate.dialect"));
		props.setProperty("hibernate.show_sql", env.getProperty("hibernate.show_sql"));

		return props;
	}

	private int getIntProperty(String propName) {

		String propVal = env.getProperty(propName);

		int intPropVal = Integer.parseInt(propVal);

		return intPropVal;
	}

	@Bean
	public LocalSessionFactoryBean sessionFactory(){

		LocalSessionFactoryBean sessionFactory = new LocalSessionFactoryBean();

		sessionFactory.setDataSource(myDataSource());
		sessionFactory.setPackagesToScan(env.getProperty("hibernate.packagesToScan"));
		sessionFactory.setHibernateProperties(getHibernateProperties());
		sessionFactory.setAnnotatedClasses(entitiesList);

		return sessionFactory;
	}

	@Bean
	@Autowired
	public HibernateTransactionManager transactionManager(SessionFactory sessionFactory) {

		HibernateTransactionManager txManager = new HibernateTransactionManager();
		txManager.setSessionFactory(sessionFactory);

		return txManager;
	}
}
