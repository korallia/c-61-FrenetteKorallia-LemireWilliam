package com.TrocQc.servlets;


/* Class ConfigsServlet
 * Auteur: William Lemire
 * Équipe: William et Korallia 
 * Ce servlet gère les paramêtres du compte usager
 */


import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.TrocQc.DAO.UserDao;
import com.TrocQc.Entity.User;

@WebServlet("/configsServlet")
@MultipartConfig(
		  fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
		  maxFileSize = 1024 * 1024 * 10,      // 10 MB
		  maxRequestSize = 1024 * 1024 * 100   // 100 MB
		)
public class ConfigsServlet extends HttpServlet {
	

	private static final long serialVersionUID = 1L;
	
	User user;

	public ConfigsServlet() {
		super();
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user = (User)request.getSession().getAttribute("user"); 
		if(request.getParameter("firstName") != null) {
			
			UserDao userDao = new UserDao();
			
			try {
				user = (User)request.getSession().getAttribute("user");
			} catch (Exception e) {
				response.sendRedirect("/TrocQc/Login");
			}
			
			
			javax.servlet.http.Part filePart = request.getPart("file");
			InputStream file = filePart.getInputStream();
			
			String firstName = request.getParameter("firstName");
			String lastName = request.getParameter("lastName");
			String email = request.getParameter("email");
			String username = request.getParameter("username");
			String address = request.getParameter("address");
			String city = request.getParameter("city");
			String postalCode = request.getParameter("postalCode");
			String url = request.getParameter("url");
			String prodCategory = request.getParameter("productCategory");
			
			String newPassword = request.getParameter("newPassword");
			String repeatPassword = request.getParameter("repeatPassword");
			
			if (newPassword.length() > 0 && repeatPassword.length() > 0) {
				if (newPassword.equals(repeatPassword)) {
					user.setPassword(newPassword);
				} 
			}
			if (prodCategory.length() > 0) {
				user.setProductCategory(prodCategory);
			}
			
			
			//VALIDATION
			
			user.setFirstName(firstName);
			user.setLastName(lastName);
			user.setEmail(email);
			user.setUsername(username);
			user.setAdress(address);
			user.setCity(city);
			user.setPostalCode(postalCode);
			user.setSiteWeb(url);
			
			if (file != null) {
				userDao.SaveUser(user, file);
			}
			else {
				userDao.SaveUser(user);
			}
			
			user = userDao.getuser(user.getId());
			request.getSession().setAttribute("user", user);
			response.sendRedirect("/TrocQc/Configurations");
		}
	}
	
	

}
