package com.TrocQc.Entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="Notes")
public class Note {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id")
	private int id;
	
	@Column(name="body")
	private String body;
	
	@Column(name="xVal")
	private int xVal;
	
	@Column(name="yVal")
	private int yVal;
	
	public Note(int id, String body, int xVal, int yVal) {
		super();
		this.id = id;
		this.body = body;
		this.xVal = xVal;
		this.yVal = yVal;
	}
	
	public Note() {
		super();
	}
	
	public int getId() {
		return this.id;
		
	}
	
	public String getBody() {
		return this.body;
	}
	
	public int getXVal() {
		return this.xVal;
		
	}
	
	public int getYVal() {
		return this.yVal;
		
	}
	
	public void setBody(String body) {
		this.body = body;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	public void setxVal(int xVal) {
		this.xVal = xVal;
	}
	
	public void setyVal(int yVal) {
		this.yVal = yVal;
	}

}
