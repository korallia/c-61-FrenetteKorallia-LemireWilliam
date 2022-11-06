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
import com.TrocQc.Entity.*;

import com.TrocQc.config.SpringJdbcConfig;

public class LobbyDao extends SpringJdbcConfig{
	@Autowired
	DataSource dataSource;
	
	@Autowired
	NamedParameterJdbcTemplate namedParameterJdbcTemplate;
	
	@Autowired
	JdbcTemplate jdbcTemplate;
	
	//constructor
	public LobbyDao() {
		super();
	}
	
	private List<Note> getLobbyNotes() {
		String sql = "Select * from Notes";
		return (List<Note>) namedParameterJdbcTemplate.query(sql, BeanPropertyRowMapper.newInstance(Note.class));
	}
	
	
	private int addNote(Note note) {
		return jdbcTemplate.update(
				"INSERT INTO Notes VALUES (?, ?, ?)", note.getBody(), note.getXVal(), note.getYVal()
				);
	}
	
	private int modifyNote(Note note) {
				//HOW TO BIND WITHOUT PREPARED STATEMENT
		return jdbcTemplate.update(
					"UPDATE Notes SET body=?, xVal=?, yVal=? WHERE id=?", note.getBody(), note.getXVal(), note.getYVal(), note.getId()
				);
		
	}
		
	
	private int deleteNote(Note note) {
		return jdbcTemplate.update(
					"DELETE FROM Notes WHERE id=?", note.getId()
				);
	}
	
}
