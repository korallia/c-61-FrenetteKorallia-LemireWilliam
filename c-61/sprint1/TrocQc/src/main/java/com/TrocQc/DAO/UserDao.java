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
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.TrocQc.Entity.User;
import com.TrocQc.config.SpringJdbcConfig;

@Repository
public class UserDao extends SpringJdbcConfig {
	
	
	public User Authenticate(String username, String password) {
		String sql = "Select * From user where username =:username and password= :password";
		
		Map<String, String> params = new HashMap<>();
		params.put("username", username);
		params.put("password", password);
				
		try {
		User user = (User) namedParameterJdbcTemplate().queryForObject(sql, params,BeanPropertyRowMapper.newInstance(User.class));
				
		if(user != null) {
			
			return user;
			
		}
		
		else {return null;}
		}catch(Exception e ) {
			return null;
		}
		
		}
	
		
	
	public int AddUser(User user) {
	
		return jdbcTemplate().update(
			
			    "INSERT INTO user (productCategory, firstName,lastName,password,username,adress,city,postalcode, email,siteWeb,Avatar ) VALUES (?, ?, ?, ?,?,?,?, ?,?,?,?)",
			    user.getProductCategory(), 
			    user.getFirstName(), 
			    user.getLastName(), 
			    user.getPassword(),
			    user.getUsername(),
			    user.getAdress(),
			    user.getCity(),
			    user.getPostalCode(),
			    user.getEmail(),
			    user.getSiteWeb(),
			    user.getAvatar()
			    );
			    
	}
	//TODO: add siteweb and image avatar
	
}
