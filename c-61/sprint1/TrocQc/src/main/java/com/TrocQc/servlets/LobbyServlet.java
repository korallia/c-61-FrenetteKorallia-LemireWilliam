package com.TrocQc.servlets;

import java.io.IOException;
import java.util.ArrayList;

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
		  
		  
		  
		  LobbyDao ld = new LobbyDao();

		  if(request.getParameter("id") != null) {
			  String noteId = request.getParameter("id");
			  Note note = new Note();
			  note.setId(Integer.parseInt(noteId));
			  
			  ld.deleteNote(note);
			  request.setAttribute("refresh", true);
			  response.sendRedirect("/TrocQc/Lobby");
		  }
		  else if (request.getParameter("newSubject") != null || request.getParameter("newBody") != null ) {
			  System.out.println(request.getParameter("newSubject"));
			  System.out.println(request.getParameter("newBody"));
			  System.out.println(request.getParameter("selectXPos"));
			  System.out.println(request.getParameter("selectYPos"));
			  System.out.println(request.getParameter("selectId"));
			  
			  String newSubject = request.getParameter("newSubject");
			  String newBody = request.getParameter("newBody");
			  int xVal = Integer.parseInt(request.getParameter("selectXPos"));
			  int yVal = Integer.parseInt(request.getParameter("selectYPos"));
			  int idNote = Integer.parseInt(request.getParameter("selectId"));
			  Note note = new Note(idNote, newSubject, newBody, xVal, yVal);
			  
			  ld.modifyNote(note);
			  response.sendRedirect("/TrocQc/Lobby");
		  }
		  else {
			  String subject = request.getParameter("subject");
			  String body = request.getParameter("content");
			  int xVal = Integer.parseInt(request.getParameter("xVal"));
			  int yVal = Integer.parseInt(request.getParameter("yVal"));
			  Note note = new Note(subject, body, xVal, yVal);
			  
			  ld.addNote(note);
			  request.setAttribute("refresh", true);
			  response.sendRedirect("/TrocQc/Lobby");
			  
		  }
		  
		  

		  
	  }
}

