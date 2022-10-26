package com.TrocQc.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;

import com.TrocQc.DAO.UserDao;
import com.TrocQc.Entity.User;

/**
 * Servlet implementation class InscriptionUsagerServlet
 */

@WebServlet("/inscriptionUsagerServlet")
public class InscriptionUsagerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	@Autowired
	private UserDao userDao;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InscriptionUsagerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user = new User( "vêtements",request.getParameter("firstname"),request.getParameter("lastname"),request.getParameter("email"),
				request.getParameter("password"),request.getParameter("accountname"),request.getParameter("address"),
				request.getParameter("city"),request.getParameter("postalcode"));
		userDao.AddUser(user);
		
		//doGet(request, response);
		
	}

}
