package com.TrocQc.DAO;

import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.TrocQc.Entity.RawMaterial;
import com.TrocQc.Entity.User;
import com.TrocQc.config.SpringJdbcConfig;


public class UserDao extends SpringJdbcConfig {
	
	
	public User Authenticate(String username, String password) {
		String sql = "Select * From user where username =:username";
		
		Map<String, String> params = new HashMap<>();
		params.put("username", username);
		
				
		try {
		User user = (User) namedParameterJdbcTemplate().queryForObject(sql, params,BeanPropertyRowMapper.newInstance(User.class));
		
		//BCryptPasswordEncoder encoder  = new BCryptPasswordEncoder();
		
		if(user != null) {
				//encoder.matches(password, user.getPassword()) || password == user.getPassword() ) {
			return user;
		}
		
		else {return null;}
		}catch(Exception e ) {
			return null;
		}
		
		}
	
		
	public int AddUser(User user) {
		
		BCryptPasswordEncoder encoder  = new BCryptPasswordEncoder();
		
		
		return jdbcTemplate().update(
			
				"INSERT INTO user (productCategory, firstName,lastName,password,username,adress,city,postalcode, email,siteWeb,Avatar ) VALUES (?, ?, ?, ?,?,?,?, ?,?,?,null)",
			    user.getProductCategory(), 
			    user.getFirstName(), 
			    user.getLastName(), 
			    encoder.encode(user.getPassword()),
			    user.getUsername(),
			    user.getAdress(),
			    user.getCity(),
			    user.getPostalCode(),
			    user.getEmail(),
			    user.getSiteWeb()
			    
			    );
			    
	}
	
	public int AddUser(User user, InputStream file) {
	
		BCryptPasswordEncoder encoder  = new BCryptPasswordEncoder();
		
		
		return jdbcTemplate().update(
			
				"INSERT INTO user (productCategory, firstName,lastName,password,username,adress,city,postalcode, email,siteWeb,Avatar ) VALUES (?, ?, ?, ?,?,?,?, ?,?,?,?)",
			    user.getProductCategory(), 
			    user.getFirstName(), 
			    user.getLastName(), 
			    encoder.encode(user.getPassword()),
			    user.getUsername(),
			    user.getAdress(),
			    user.getCity(),
			    user.getPostalCode(),
			    user.getEmail(),
			    user.getSiteWeb(),
			    file
			    );
			    
	}
	public int SaveUser(User user) {

		if (user.getId() == 0) {
			return this.AddUser(user);
		} else {

			String sql = "UPDATE user SET productCategory=?, firstName=?,lastName=?,password=?,username=?,adress=?,city=?,postalcode=?, email=?,siteWeb=?,Avatar=? WHERE id=?";
			jdbcTemplate().update(sql, user.getProductCategory(), user.getFirstName(), 	user.getLastName(), user.getPassword(), user.getUsername(),
					user.getAdress(), user.getCity(), user.getPostalCode(), user.getEmail(), user.getSiteWeb(),user.getAvatar() ,user.getId());
			return user.getId();
		}
	}

	
	public int SaveUser(User user, InputStream file) {
		
		if (user.getId() == 0) {
			return this.AddUser(user);
		} else {
			
			String sql = "UPDATE user SET productCategory=?, firstName=?,lastName=?,password=?,username=?,adress=?,city=?,postalcode=?, email=?,siteWeb=?,Avatar=? WHERE id=?";
			jdbcTemplate().update(sql, user.getProductCategory(), user.getFirstName(), 	user.getLastName(), user.getPassword(), user.getUsername(),
					user.getAdress(), user.getCity(), user.getPostalCode(), user.getEmail(), user.getSiteWeb(),file ,user.getId());
			return user.getId();
		}
	}
	

	
}
