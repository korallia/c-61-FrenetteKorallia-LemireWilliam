package com.TrocQc.servlets;

/* Class inscriptionUsagerServlet
 * Auteur: Korallia Frenette
 * Équipe: William et Korallia 
 * Ce servlet simule un lien d'image de la base de donnée
 */


import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.TrocQc.Entity.User;

/**
 * Servlet implementation class getUserAvatar
 */
public class getUserAvatar extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public getUserAvatar() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// <a href="https://www.geeksforgeeks.org/servlet-display-image/">Servlet Display Image</a>
		// inspiration pour l'affichage d'une image
		User user = (User)request.getSession().getAttribute("user"); 
		byte[] byteArray = user.getAvatar() ;
	     response.setContentType("image/gif");
	     response.setContentLength(byteArray.length);
	     ServletOutputStream sos = response.getOutputStream();
	     sos.write(byteArray);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		
		
	}

}
