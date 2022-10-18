package com.TrocQc.Entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="user")
public class User {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id")
	private int id;
	
	@Column(name="firstname")
	private String firstName;
	
	@Column(name="lastname")
	private String lastName;
	
	@Column(name="email")
	private String email;
	
	@Column(name="password")
	private String password;
	
	@Column(name="username")
	private String username;
	
	@Column(name="adress")
	private String adress;
	
	@Column(name="city")
	private String city;
	
	@Column(name="postalCode")
	private String postalCode;

	public User(int id, String firstName, String lastName, String email, String password, String username,
			String adress, String city, String postalCode) {
		super();
		this.id = id;
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.password = password;
		this.username = username;
		this.adress = adress;
		this.city = city;
		this.postalCode = postalCode;
	}

	public int getId() {
		return id;
	}

	public String getFirstName() {
		return firstName;
	}


	public String getLastName() {
		return lastName;
	}



	public String getEmail() {
		return email;
	}



	public String getPassword() {
		return password;
	}



	public String getUsername() {
		return username;
	}



	public String getAdress() {
		return adress;
	}



	public String getCity() {
		return city;
	}



	public String getPostalCode() {
		return postalCode;
	}

	


	
	

}