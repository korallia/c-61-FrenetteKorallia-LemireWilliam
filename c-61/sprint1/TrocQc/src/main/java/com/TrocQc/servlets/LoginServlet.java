package com.TrocQc.servlets;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.TrocQc.DAO.UserDao;
import com.TrocQc.Entity.User;


//AUTO WIRE doesn't solve a big problem, there's no tight coupling, creating the dao here instead of injecting it changes nothing + auto wire works differently in servlet so we have to do a work around to use it when it doesn't add much.



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

    	User user = userDao.Authenticate(username, password);
    	
    	if(user != null) {
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
