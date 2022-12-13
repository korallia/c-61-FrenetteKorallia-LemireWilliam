package com.TrocQc.Entity;

import java.sql.Date;
import java.sql.Time;
import java.sql.Timestamp;

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
	private double quantity;
	
	
	@Column(name="ventedate")
	private Date ventedate;


	@Column(name="userID")
	private int userID;
	
	
	public Vente(int productid, double quantity, Date date) {
		super();
		this.productid = productid;
		this.quantity = quantity;
		this.ventedate = date;
	}
	
	public Vente(int productid, double quantity, Date date, int userId) {
		super();
		this.productid = productid;
		this.quantity = quantity;
		this.ventedate = date;
		this.userID = userId;
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


	public double getQuantity() {
		return quantity;
	}


	public void setQuantity(double quantity) {
		this.quantity = quantity;
	}


	public Date getVentedate() {
		return ventedate;
	}


	public void setVentedate(Date ventedate) {
		this.ventedate = ventedate;
	}


	public int getUserID() {
		return userID;
	}


	public void setUserID(int userID) {
		this.userID = userID;
	}
	
	
	
	
}
