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

@WebServlet("/configsServlet")

public class ConfigsServlet extends HttpServlet {

	public ConfigsServlet() {
		super();
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse resp) throws ServletException, IOException {
		User user = (User)request.getSession().getAttribute("user"); 
		if(request.getParameter("Name") != null || request.getParameter("Description") != null) {
			
			String name = request.getParameter("Name");
			String desc = request.getParameter("Desscription");
			
			
			
		}
	}
	
	

}