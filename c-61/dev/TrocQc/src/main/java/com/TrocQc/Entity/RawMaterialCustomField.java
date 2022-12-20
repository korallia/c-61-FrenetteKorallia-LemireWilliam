/* Class RawMaterialCustomField
 * Auteur: Korallia Frenette
 * Équipe: William et Korallia 
 * Cette entité contient les champs customs pour un raw material
 */

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
	
	
	public RawMaterialCustomField() {
	
	}

	public RawMaterialCustomField(String fieldtypeName,String fieldvalue) {
		this.fieldtypeName = fieldtypeName;
		this.fieldvalue= fieldvalue; 
		
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
