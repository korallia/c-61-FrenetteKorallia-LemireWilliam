package com.TrocQc.servlets;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;

import com.TrocQc.DAO.UserDao;
import com.TrocQc.Entity.User;


//AUTOWIRE doesn't solve a big problem, there's no tight coupling, creating the dao here instead of injecting it changes nothing + autowire works differently in servlet so we have to do a work around to use it when it doesn't add much.



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
    	String username = request.getParameter("username");
    	String password = request.getParameter("password");
    	
    	//requête DAo
    	UserDao userDao = new UserDao();
    	User user = userDao.Authenticate(username, password);
    	if(user != null) {
   			//rediriger vers lobby
    		HttpSession session = request.getSession();
    		session.setMaxInactiveInterval(600);
    		request.getSession().setAttribute("user", user);
    		response.sendRedirect("/TrocQc/Lobby");
    		// ou response.setHeader("Location", request.getContextPath() + "/lobby");
    	}
    	else {
			 request.getSession().setAttribute("error", "Authentification échouée");
			 response.sendRedirect("/TrocQc/Login");
		 }
   	
    }
 
}
