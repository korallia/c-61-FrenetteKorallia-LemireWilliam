package com.TrocQc.Entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="rawmaterialproducts")
public class RawMaterialProducts {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id")
	private int id;
	
	
	@Column(name="productid")
	private int productid;
	
	
	@Column(name="rawmaterialid")
	private int rawmaterialid;
	
	@Column(name="quantity")
	private double quantity;
	
	private RawMaterial rawmaterial;
	

	public RawMaterialProducts() {
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

	public int getRawmaterialid() {
		return rawmaterialid;
	}

	public void setRawmaterialid(int rawmaterialid) {
		this.rawmaterialid = rawmaterialid;
	}

	public double getQuantity() {
		return quantity;
	}

	public void setQuantity(double quantity) {
		this.quantity = quantity;
	}

	public RawMaterial getRawmaterial() {
		return rawmaterial;
	}

	public void setRawmaterial(RawMaterial rawmaterial) {
		if ( rawmaterial.getId() > 0) {
			this.setRawmaterialid(rawmaterial.getId());
		}
		this.rawmaterial = rawmaterial;
	}

	

}
