package com.TrocQc.DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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
	
	private List<Note> getLobbyNotes() {
		String sql = "Select * from Notes";
		return (List<Note>) namedParameterJdbcTemplate().query(sql, BeanPropertyRowMapper.newInstance(Note.class));
	}
	
	
	public int addNote(Note note) {
		return jdbcTemplate().update(
				"INSERT INTO Notes (note_subject, note_body, posX, posY)VALUES (?, ?, ?, ?)", note.getSubject(),note.getBody(), note.getXVal(), note.getYVal()
				);
	}
	
	private int modifyNote(Note note) {
				//HOW TO BIND WITHOUT PREPARED STATEMENT
		return jdbcTemplate().update(
					"UPDATE Notes SET subject=?, body=?, xVal=?, yVal=? WHERE id=?",note.getSubject(), note.getBody(), note.getXVal(), note.getYVal(), note.getId()
				);
		
	}
		
	
	private int deleteNote(Note note) {
		return jdbcTemplate().update(
					"DELETE FROM Notes WHERE id=?", note.getId()
				);
	}
	
}
