package com.TrocQc.config;
import java.util.Properties;

import javax.persistence.EntityManagerFactory;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.dao.annotation.PersistenceExceptionTranslationPostProcessor;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.orm.jpa.JpaTransactionManager;
import org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean;
import org.springframework.orm.jpa.vendor.HibernateJpaVendorAdapter;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@Configuration
@EnableTransactionManagement
@PropertySource({ "classpath:database.properties" })
@ComponentScan({ "com.TrocQc" })

public class SpringJdbcConfig {
	
	public DataSource

mysqlDataSource() {
		DriverManagerDataSource
dataSource = new
DriverManagerDataSource();
		
dataSource.setDriverClassName("com.mysql.jdbc.Driver");

dataSource.setUrl("jdbc:mysql://localhost:3306/trocqc");
dataSource.setUsername("trocqc");
dataSource.setPassword("BBBbbb222");
	return dataSource;
	}
	
	public NamedParameterJdbcTemplate namedParameterJdbcTemplate() {
	      return new NamedParameterJdbcTemplate(mysqlDataSource());
	   }
	
	 @Bean
	   public JdbcTemplate jdbcTemplate() {
	      return new JdbcTemplate(mysqlDataSource());
	   }
}