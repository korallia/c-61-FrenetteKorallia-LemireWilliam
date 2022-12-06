package com.TrocQc.Entity;

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
	private int availablequantity;
	
	@Column(name="originalquantity")
	private int originalquantity;
	
	@Column(name="addeddate")
	private Date addeddate;

	public Lot(int productid) {
		super();
		this.productid = productid;
	}
	
	public Lot() {
		super();
	}

	public Lot(int productid, int availablequantity, int originalquantity, Date addeddate) {
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



	public int getAvailablequantity() {
		return availablequantity;
	}



	public void setAvailablequantity(int availablequantity) {
		this.availablequantity = availablequantity;
	}



	public int getOriginalquantity() {
		return originalquantity;
	}



	public void setOriginalquantity(int originalquantity) {
		this.originalquantity = originalquantity;
	}



	public Date getAddeddate() {
		return addeddate;
	}



	public void setAddeddate(Date addeddate) {
		this.addeddate = addeddate;
	}
	
	
	
	
	
}
