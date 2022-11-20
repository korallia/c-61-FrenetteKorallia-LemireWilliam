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

	public int getProductid() {
		return productid;
	}

	public void setProductid(int productid) {
		this.productid = productid;
	}

	public String getFieldtypeName() {
		return fieldtypeName;
	}

	public void setFieldtypeName(String fieldtypeName) {
		this.fieldtypeName = fieldtypeName;
	}

	public String getFieldvalue() {
		return fieldvalue;
	}

	public void setFieldvalue(String fieldvalue) {
		this.fieldvalue = fieldvalue;
	}
	
}
