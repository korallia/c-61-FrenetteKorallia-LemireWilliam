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
	
	@Column(name="note_subject")
	private String subject;
	
	@Column(name="note_body")
	private String body;
	
	@Column(name="posX")
	private int xVal;
	
	@Column(name="posY")
	private int yVal;
	
	public Note(int id, String subject, String body, int xVal, int yVal) {
		super();
		this.id = id;
		this.subject = subject;
		this.body = body;
		this.xVal = xVal;
		this.yVal = yVal;
	}
	
	public Note(String subject, String body, int xVal, int yVal) {
		super();
		this.id = 0;
		this.subject = subject;
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
	
	public String getSubject() {
		return this.subject;
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
	
	public void setSubject(String subject) {
		this.subject = subject;
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
