package com.TrocQc.Entity;

import java.awt.Image;
import java.io.InputStream;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.swing.ImageIcon;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.mysql.cj.jdbc.Blob;

@Entity
@Table(name="user")
public class User {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id")
	private int id;
	
	@Column(name="productCategory")
	private String productCategory;
	
	
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
	
	@Column(name="siteWeb")
	private String siteWeb;
	
	@Column(name="Avatar")
	private byte[] file;
	
	
	
	 public static Set<String> ProductCategorySet = new HashSet<String>() {{
	 add("vêtements");
	 add("appareils électroniques");
	 add("produits pour animaux");
	 add("artisanal");
	 add("services");
	 add("cosmétiques");
	 add("passe-temps");
	 }};
	
	
	
	
	
	

	public User() {
		  
	}
	
	public User(int id,String productCategory, String firstName, String lastName, String email, String password, String username,
			String adress, String city, String postalCode,String siteweb,byte[] avatar) {
		super();
		this.id = id;
		this.productCategory = productCategory;
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.password = password;
		this.username = username;
		this.adress = adress;
		this.city = city;
		this.postalCode = postalCode;
		this.siteWeb = siteweb;
		this.file = avatar;
	}
	
	public User(String productCategory,String firstName, String lastName, String email, String password, String username,
			String adress, String city, String postalCode,String siteweb) {
		super();
		this.productCategory = productCategory;
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.password = password;
		this.username = username;
		this.adress = adress;
		this.city = city;
		this.postalCode = postalCode;
		this.siteWeb = siteweb;
	}

	public int getId() {
		return id;
	}

	public String getProductCategory() {
		return productCategory;
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

	public void setId(int id) {
		this.id = id;
	}

	public void setProductCategory(String productCategory) {
		this.productCategory = productCategory;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	public void setAndEncodePassword(String password) {
		BCryptPasswordEncoder encoder  = new BCryptPasswordEncoder();
		this.password = encoder.encode(password);
		
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public void setAdress(String adress) {
		this.adress = adress;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public void setPostalCode(String postalCode) {
		this.postalCode = postalCode;
	}

	public String getSiteWeb() {
		return siteWeb;
	}

	public void setSiteWeb(String siteWeb) {
		this.siteWeb = siteWeb;
	}

	public byte[] getAvatar() {
		return file;
	}

	public void setAvatar(byte[] avatar) {
		this.file = avatar;
	}

	

	
	
	
	
}