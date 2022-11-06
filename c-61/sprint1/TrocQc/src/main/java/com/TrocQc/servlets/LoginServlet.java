package com.TrocQc.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;

import com.TrocQc.DAO.UserDao;
import com.TrocQc.Entity.User;


//AUTOWIRE doesnt solve a big problem, theirs no tight coupling, creating the dao here instead of injecting it cahnges nothing + autowire works differently in sevlet so we have to do a work around to use it when it doesnt add much.



@WebServlet("/loginServlet")
public class LoginServlet extends HttpServlet {
	
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
    		//https://docs.spring.io/spring-framework/docs/1.2.x/reference/beans.html
    	}
    }
 
}
