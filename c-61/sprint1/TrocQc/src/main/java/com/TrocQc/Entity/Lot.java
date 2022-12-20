package com.TrocQc.Entity;

/* Class Lot
 * Auteur: Korallia Frenette
 * Équipe: William et Korallia 
 * Cette entité store un lot de produit crée en une occasion
 */


import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="product")
public class Lot {

	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id")
	private int id;
	
	@Column(name="productId")
	private int productid;
	
	@Column(name="availablequantity")
	private double availablequantity;
	
	@Column(name="originalquantity")
	private double originalquantity;
	
	@Column(name="addeddate")
	private Date addeddate;

	public Lot(int productid) {
		super();
		this.productid = productid;
	}
	
	public Lot() {
		super();
	}

	public Lot(int productid, double availablequantity, double originalquantity, Date addeddate) {
		super();
		this.productid = productid;
		this.availablequantity = availablequantity;
		this.originalquantity = originalquantity;
		this.addeddate = addeddate;
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



	public double getAvailablequantity() {
		return availablequantity;
	}



	public void setAvailablequantity(double availablequantity) {
		this.availablequantity = availablequantity;
	}



	public double getOriginalquantity() {
		return originalquantity;
	}



	public void setOriginalquantity(double originalquantity) {
		this.originalquantity = originalquantity;
	}



	public Date getAddeddate() {
		return addeddate;
	}



	public void setAddeddate(Date addeddate) {
		this.addeddate = addeddate;
	}
	
	
	
	
	
}
