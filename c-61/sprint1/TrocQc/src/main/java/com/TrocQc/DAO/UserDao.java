package com.TrocQc.DAO;

import java.util.HashMap;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
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
	JdbcTemplate jdbcTemplate;
	
	
	
	public User Authentification(String username, String password) {
		String sql = "Select * From user where username =:ùsername and password= :password";
		
		Map<String, String> params = new HashMap<>();
		params.put("username", username);
		params.put("password", password);
		User user = (User) namedParameterJdbcTemplate.query(sql, params,BeanPropertyRowMapper.newInstance(User.class))
		if(user != null) {return user;}
		else {return null;}
		
		}
	
		
	
	public int AddUser(User user) {
	
		return jdbcTemplate.update(
			
			    "INSERT INTO user VALUES (?, ?, ?, ?,?,?,?,?,?)",user.getProductCategory(), user.getFirstName(), user.getLastName(), user.getPassword(),user.getUsername(),user.getAdress(),user.getCity(),user.getPostalCode());
			    
	}
	
	
}
