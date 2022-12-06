package com.TrocQc.Entity;

import java.sql.Date;
import java.sql.Time;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="vente")
public class Vente {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id")
	private int id;
	
	@Column(name="productId")
	private int productid;
	
	@Column(name="quantity")
	private int quantity;
	
	
	@Column(name="ventedate")
	private Time ventedate;


	@Column(name="userID")
	private int userID;
	
	
	public Vente(int productid, int quantity, Time time) {
		super();
		this.productid = productid;
		this.quantity = quantity;
		this.ventedate = time;
	}


	public Vente() {
		super();
	}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public int getProductid() {
		return productid;
	}


	public void setProductid(int productid) {
		this.productid = productid;
	}


	public int getQuantity() {
		return quantity;
	}


	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}


	public Time getVentedate() {
		return ventedate;
	}


	public void setVentedate(Time ventedate) {
		this.ventedate = ventedate;
	}


	public int getUserID() {
		return userID;
	}


	public void setUserID(int userID) {
		this.userID = userID;
	}
	
	
	
	
}
