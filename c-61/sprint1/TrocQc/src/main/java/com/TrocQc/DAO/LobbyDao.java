package com.TrocQc.DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;
import javax.swing.tree.RowMapper;
import javax.swing.tree.TreePath;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowCallbackHandler;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Repository;

import com.TrocQc.Entity.*;

import com.TrocQc.config.SpringJdbcConfig;

@Repository
public class LobbyDao extends SpringJdbcConfig{

	
	//constructor
	public LobbyDao() {
		super();
	}
	
	public ArrayList<Note> getLobbyNotesByUserId(int userID) {
		String sql = "SELECT * FROM notes where userID=:userID";
		Map<String, Object> params = new HashMap<>();
		params.put("userID", userID);
		ArrayList<Note> notesList = new ArrayList<Note>();
		notesList = (ArrayList<Note>)namedParameterJdbcTemplate().query(sql,params, BeanPropertyRowMapper.newInstance(Note.class));
		return notesList;
		//return (List<Note>) namedParameterJdbcTemplate().query(sql, BeanPropertyRowMapper.newInstance(Note.class));
	}
	
	
	public int addNote(Note note) {
		return jdbcTemplate().update(
				"INSERT INTO notes (note_subject, note_body, posX, posY, userID)VALUES (?, ?, ?, ?,?)", note.getNote_subject(),note.getNote_body(), note.getposX(), note.getposY(),note.getUserID()
				);
	}
	
	public int modifyNote(Note note) {
				//HOW TO BIND WITHOUT PREPARED STATEMENT
		return jdbcTemplate().update(
					"UPDATE Notes SET note_subject=?, note_body=?, posX=?, posY=? WHERE id=?",note.getNote_subject(), note.getNote_body(), note.getposX(), note.getposY(), note.getId()
				);
		
	}
		
	
	public int deleteNote(Note note) {
		return jdbcTemplate().update(
					"DELETE FROM Notes WHERE id=?", note.getId()
				);
	}
	
}