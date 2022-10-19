package com.TrocQc.DAO;

import java.util.HashMap;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;

import com.TrocQc.Entity.User;
import com.TrocQc.config.SpringJdbcConfig;

public class UserDao extends SpringJdbcConfig {
	@Autowired
	DataSource dataSource;
	
	@Autowired
	NamedParameterJdbcTemplate namedParameterJdbcTemplate;
	
	@Autowired
	JdbcTemplate JdbcTemplate;
	
	
	
	public User Authentification(String username, String password) {
		String sql = "Select * From user where username =:ùsername and password= :password";
		SqlParameterSource param = new MapSqlParameterSource().addValue("username", username).addValue("password", password); 
		User user= namedParameterJdbcTemplate.queryForObject(sql, param, User.class);
		if(user!= null) {return user;}
		else {return null;}
		}
	
	public void AddUser(User user) {
	
		String sql = "INSERT INTO user (id, firstName, lastName,email,password,username,adress,city,postalCode) VALUES (:id, :firstname, :lastname,:email,:password,:username,:adress,:city,:postalCode)";
		 
		Map<String, String> params = new HashMap<>();
		 
		params.put("name", "Tom");
		params.put("email", "tomea@gmail.com");
		params.put("address", "USA");
		 
		JdbcTemplate.update(sql, params);
	}
	
	
}
