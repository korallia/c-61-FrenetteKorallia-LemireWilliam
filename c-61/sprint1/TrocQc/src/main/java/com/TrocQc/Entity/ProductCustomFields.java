package com.TrocQc.Entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name="productcustomfields")
public class ProductCustomFields {
	
	@Column(name="productid")
	private int productid;
	
	
	@Column(name="fieldtypeName")
	private String fieldtypeName;
	
	@Column(name="fieldvalue")
	private String fieldvalue;
	
	public ProductCustomFields(int productid,String fieldtypeName,String fieldvalue ) {
		this.productid=productid;
		this.fieldtypeName =fieldtypeName;
		this.fieldvalue= fieldvalue; 
	}
}
