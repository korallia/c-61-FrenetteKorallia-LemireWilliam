package com.TrocQc.Entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name="rawmaterialcustomfields")
public class RawMaterialCustomField {
	
	@Column(name="rawMaterialid")
	private int rawMaterialid;
	
	
	@Column(name="fieldtypeName")
	private String fieldtypeName;
	
	@Column(name="fieldvalue")
	private String fieldvalue;
	
	@Column(name="UserId")
	private int UserId;
	
	public RawMaterialCustomField() {
	
	}

	public RawMaterialCustomField(String fieldtypeName,String fieldvalue, int UserId) {
		this.fieldtypeName = fieldtypeName;
		this.fieldvalue= fieldvalue; 
		this.UserId = UserId;
	}
	
	public int getUserId() {
		return UserId;
	}

	public void setUserId(int userId) {
		UserId = userId;
	}

	public int getRawMaterialid() {
		return rawMaterialid;
	}

	public void setRawMaterialid(int rawMaterialid) {
		this.rawMaterialid = rawMaterialid;
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
