package com.TrocQc.servlets;


/* Class LoginServlet
 * Auteur: William Lemire et Korallia Frenette
 * Équipe: William et Korallia 
 * Ce servlet permet le login des usagers
 */


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.TrocQc.DAO.UserDao;
import com.TrocQc.Entity.User;



@WebServlet("/loginServlet")
public class LoginServlet extends HttpServlet {
	
	  /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public LoginServlet() {
	        super();
	        // TODO Auto-generated constructor stub
	    }
	
	
    protected void doPost(HttpServletRequest request,
        HttpServletResponse response) throws ServletException, IOException {
    	UserDao userDao = new UserDao();
    	String username = request.getParameter("username");
    	String password = request.getParameter("password");
    	String forgotpwd = request.getParameter("forgotpwd");
    	
    	if ( username.length() > 0 && forgotpwd.length() > 0 ) {
    		
    		User user = userDao.getuserByUsername(username);
    		userDao.ResetUserPassword(user.getEmail());
    		return;
    	}
    	
    	
    	request.getSession().setAttribute("loginError", "false");
    	User user = userDao.Authenticate(username, password);
    	
    	if(user != null) {
    		// <a href="https://www.digitalocean.com/community/tutorials/java-session-management-servlet-httpsession-url-rewriting">Session Management in Java</a>
    		// explique comment gérer une session en Java
    		HttpSession session = request.getSession();
    		session.setMaxInactiveInterval(600);
    		request.getSession().setAttribute("user", user);
    		response.sendRedirect("/TrocQc/Lobby");
    		// ou response.setHeader("Location", request.getContextPath() + "/lobby");
    	}
    	else {
			 request.getSession().setAttribute("loginError", "true");
			 response.sendRedirect("/TrocQc/Login");
		 }
   	
    }
 
}
