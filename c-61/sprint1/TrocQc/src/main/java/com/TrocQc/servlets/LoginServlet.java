package com.TrocQc.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.annotation.Bean;

import com.TrocQc.DAO.UserDao;
import com.TrocQc.Entity.User;

@WebServlet("/loginServlet")
public class LoginServlet extends HttpServlet {
 
	
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
    	String username = request.getParameter("username");
    	String password = request.getParameter("password");
    	
    	//requete DAo
    	UserDao userDao = new UserDao();
    	User user = userDao.Authentification(username, password);
    	if(user != null) {
    		//https://docs.spring.io/spring-framework/docs/1.2.x/reference/beans.html
    	}
    	
    	//add user to context
       
 
    }
 
}
