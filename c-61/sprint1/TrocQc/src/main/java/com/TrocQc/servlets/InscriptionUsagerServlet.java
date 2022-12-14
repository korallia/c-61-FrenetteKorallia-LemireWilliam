package com.TrocQc.servlets;

import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.parser.Part;

import com.TrocQc.DAO.UserDao;
import com.TrocQc.Entity.User;

/**
 * Servlet implementation class InscriptionUsagerServlet
 */

@WebServlet("/inscriptionUsagerServlet")
@MultipartConfig(
	  fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
	  maxFileSize = 1024 * 1024 * 10,      // 10 MB
	  maxRequestSize = 1024 * 1024 * 100   // 100 MB
	)
public class InscriptionUsagerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
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
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 javax.servlet.http.Part filePart = request.getPart("file");
		 InputStream file = filePart.getInputStream();
		
		    //source for upload code: https://www.theserverside.com/blog/Coffee-Talk-Java-News-Stories-and-Opinions/Java-File-Upload-Servlet-Ajax-Example
		
		  String postalcode = request.getParameter("postalcode");
		  String couriel = request.getParameter("email");
		  String adresse = request.getParameter("address");
		  
		  if (postalcode.length() >0) {
			  if( !postalcode.matches("^(?!.*[DFIOQU])[A-VXY][0-9][A-Z] ?[0-9][A-Z][0-9]$")) {
				  
				  request.getSession().setAttribute("error", "Champ Code postal mal remplie");
				  response.sendRedirect("/TrocQc/Inscription");}
		  }
			  
		  if(adresse.length()>0){
			  	if( !adresse.matches("^(?!.*[DFIOQU])[A-VXY][0-9][A-Z] ?[0-9][A-Z][0-9]$")) {
				  
				  request.getSession().setAttribute("error", "Champ Code postal mal remplie");
				  response.sendRedirect("/TrocQc/Inscription");}
		  }
		  
			
		 
		 
		 
		 if ( request.getParameter("firstname").length() > 0 && request.getParameter("lastname").length() > 0 && request.getParameter("email").length() > 0 && 
			request.getParameter("password").length() > 0 && request.getParameter("accountname").length() > 0 ) {		 
		 
			User user = new User( request.getParameter("categorie"),request.getParameter("firstname"),request.getParameter("lastname"),request.getParameter("email"),
					request.getParameter("password"),request.getParameter("accountname"),request.getParameter("address"),
					request.getParameter("city"),request.getParameter("postalcode"),request.getParameter("url"));
			UserDao userDao = new UserDao();
	    	userDao.AddUser(user,file);
	    	response.sendRedirect("/TrocQc/Lobby");
		 }
		 else {
			 request.getSession().setAttribute("error", "Champ(s) obligatoire(s) non rempli(s)");
			 response.sendRedirect("/TrocQc/Inscription");
		 }
    	
    	
    	
		
	
		    
	}
		    

}
