package com.TrocQc.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;

import com.TrocQc.DAO.LobbyDao; 
import com.TrocQc.Entity.Note;

@WebServlet("/lobbyServlet")
public class LobbyServlet extends HttpServlet {
	
	  public LobbyServlet() {
	        super();
	        // TODO Auto-generated constructor stub
	    }
	  
	  protected void doPost(HttpServletRequest request,
		        HttpServletResponse response) throws ServletException, IOException {

	  }
}

