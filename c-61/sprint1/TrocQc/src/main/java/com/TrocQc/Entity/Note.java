package com.TrocQc.Entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="notes")
public class Note {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id")
	private int id;
	
	@Column(name="note_body")
	private String note_body;

	@Column(name="note_subject")
	private String note_subject;
	
	@Column(name="posX")
	private int posX;
	
	@Column(name="posY")
	private int posY;
	
	@Column(name="userID")
	private int userID;
	
	
	
	public Note(int id, String note_subject, String note_body, int posX, int posY, int userID) {
		super();
		this.id = id;
		this.note_subject = note_subject;
		this.note_body = note_body;
		this.posX = posX;
		this.posY = posY;
		this.userID = userID;
	}
	
	public Note(String note_subject, String note_body, int posX, int posY,int userID) {
		super();
		this.id = 0;
		this.note_subject = note_subject;
		this.note_body = note_body;
		this.posX = posX;
		this.posY = posY;
		this.userID = userID;
	}
	
	public Note() {
		super();
	}
	
	public int getId() {
		return this.id;
		
	}
	
	public int getposX() {
		return this.posX;
		
	}
	
	public int getposY() {
		return this.posY;
		
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	public void setposX(int posX) {
		this.posX = posX;
	}
	
	public void setposY(int posY) {
		this.posY = posY;
	}

	public String getNote_body() {
		return note_body;
	}

	public void setNote_body(String note_body) {
		this.note_body = note_body;
	}

	public String getNote_subject() {
		return note_subject;
	}

	public void setNote_subject(String note_subject) {
		this.note_subject = note_subject;
	}

	public int getUserID() {
		return userID;
	}

	public void setUserID(int userID) {
		this.userID = userID;
	}

	
	
}
