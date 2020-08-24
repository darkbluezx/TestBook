package _00_init.config;

import java.beans.PropertyVetoException;
import java.util.Properties;

import javax.sql.DataSource;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.orm.hibernate5.HibernateTransactionManager;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import com.mchange.v2.c3p0.ComboPooledDataSource;

@Configuration
@EnableTransactionManagement
@PropertySource("classpath:dbSQLServer.properties") //參考路徑看資料庫換dbSQLServer.properties 或 dbMySQL.properties"
public class RootAppConfig {
	
	@Value("${jdbc.initPoolSize}")      //${jdbc.xxx}裡的參數請至，對應路徑的properties檔中的對應名字更改，例如帳號、密碼之類的
	int ips;
	
	@Value("${jdbc.maxPoolSize}")
	int mps;
	
	@Autowired
	Environment env;
	
	@Bean       //mysql
	public DataSource mysqlDataSource() {
		ComboPooledDataSource ds = new ComboPooledDataSource();
		ds.setUser(env.getProperty("jdbc.user"));
		ds.setPassword(env.getProperty("jdbc.password"));
		try {
			ds.setDriverClass(env.getProperty("jdbc.driverClass"));
		} catch (PropertyVetoException e) {
			e.printStackTrace();
		}
		ds.setJdbcUrl(env.getProperty("jdbc.jdbcUrl"));
		ds.setInitialPoolSize(ips);
		ds.setMaxPoolSize(mps);
		return ds;
	}
	
	@Bean       //mssql server
	public DataSource sqlServerDataSource() {
		ComboPooledDataSource ds = new ComboPooledDataSource();
		ds.setUser(env.getProperty("jdbc.user"));
		ds.setPassword(env.getProperty("jdbc.password"));
		try {
			ds.setDriverClass(env.getProperty("jdbc.driverClass"));
		} catch (PropertyVetoException e) {
			e.printStackTrace();
		}
		ds.setJdbcUrl(env.getProperty("jdbc.jdbcUrl"));
		ds.setInitialPoolSize(ips);
		ds.setMaxPoolSize(mps);
		return ds;
	}
    
    @Bean
    public LocalSessionFactoryBean sessionFactory() {
        LocalSessionFactoryBean factory = new LocalSessionFactoryBean();
        factory.setDataSource(sqlServerDataSource());   //看資料庫置換mysqlDataSource/sqlServerDataSource 方法
        factory.setPackagesToScan(new String[] {
        			"_00_init",
        			"_01_order.model",
        			"_02_statistics",
        			"_03_cart",
        			"_05_loginSystem.model",
                    "_08_Promotion_com.web.store.model",
                    "_09_Book.model",
                    "shopping.store.model"
                });
        factory.setHibernateProperties(sqlServerAdditionalProperties()); //看資料庫置換mysqlAdditionalProperties/sqlServerAdditionalProperties 方法
        return factory;
    }
    @Bean(name="transactionManager")
    @Autowired
    public HibernateTransactionManager transactionManager(SessionFactory sessionFactory) {
         HibernateTransactionManager txManager = new HibernateTransactionManager();
         txManager.setSessionFactory(sessionFactory);
         return txManager;
      }    
    
    private Properties mysqlAdditionalProperties() {     //mysql
		Properties properties = new Properties();
		properties.put("hibernate.dialect", org.hibernate.dialect.MySQL8Dialect.class);
		properties.put("hibernate.hbm2ddl.auto", "update");
		properties.put("hibernate.show_sql", Boolean.FALSE);
		properties.put("hibernate.format_sql", Boolean.TRUE);
		properties.put("default_batch_fetch_size", 10);
//		properties.put("hibernate.current_session_context_class", "thread");
		return properties;
	}
	
	private Properties sqlServerAdditionalProperties() {    //mssql server
		Properties properties = new Properties();
		properties.put("hibernate.dialect", org.hibernate.dialect.SQLServer2012Dialect.class);
		properties.put("hibernate.show_sql", Boolean.FALSE);
		properties.put("hibernate.format_sql", Boolean.TRUE);
		properties.put("default_batch_fetch_size", 10);
		properties.put("hibernate.hbm2ddl.auto", "update");
//		properties.put("hibernate.current_session_context_class", "thread");
		return properties;
	}
}
