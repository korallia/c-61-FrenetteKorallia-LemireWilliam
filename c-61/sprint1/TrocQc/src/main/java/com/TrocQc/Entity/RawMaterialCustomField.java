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
	
	public RawMaterialCustomField(int rawMaterialid,String fieldtypeName,String fieldvalue ) {
		this.rawMaterialid=rawMaterialid;
		this.fieldtypeName =fieldtypeName;
		this.fieldvalue= fieldvalue; 
	}
	
}
