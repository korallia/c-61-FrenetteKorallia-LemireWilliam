package com.TrocQc.Entity;

import java.util.ArrayList;
import java.util.Vector;

import org.springframework.beans.factory.annotation.Autowired;

class LobbyModule extends Module {
	
	private Vector<Note> notesList;
	
	public LobbyModule(String name, String description, User user) {
		super(name, description, user);
		this.notesList = new Vector<Note>();
	}
	
	
	//@Autowired
	private Note addNote(String noteSubject, String noteBody) {
		
		return null;
	}
	
	private ArrayList<Note> getNotes(){
		ArrayList<Note> noteList = new ArrayList<Note>();
		
		return noteList;
		
	}
	
	private void modifyNote(Note note) {
		
	}
	
	private void deleteNote(Note note) {
		
	}
}