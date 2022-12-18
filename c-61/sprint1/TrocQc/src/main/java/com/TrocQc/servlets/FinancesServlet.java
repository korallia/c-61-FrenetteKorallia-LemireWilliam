package com.TrocQc.servlets;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.sql.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.TrocQc.DAO.FinanceDao;
import com.TrocQc.Entity.SalesPrediction;
import com.TrocQc.Entity.User;
import com.TrocQc.Utils.DatePoint;
import com.TrocQc.Utils.LinkedList;



@WebServlet("/financesServlet")
public class FinancesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
	User user;
	
    public FinancesServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		FinanceDao finDao = new FinanceDao();
		
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");
		
		Date startoDato = java.sql.Date.valueOf(startDate);
		Date endoDato = java.sql.Date.valueOf(endDate);
		
		String regModel = "---";
		request.getSession().setAttribute("regModel", regModel);
		
		/*
		Date parsedStartDate = null;
		Date parsedEndDate = null;
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		try {
			parsedStartDate = (Date) format.parse(startDate);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			parsedEndDate = (Date) format.parse(endDate);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		*/
		
		if (startDate == null) {
			// ONLY FOR THE DAY
		}
		else {
			// RANGE OF DATES
			SalesPrediction salesPrediction = new SalesPrediction(startoDato, endoDato);
			LinkedList <DatePoint> dpList = salesPrediction.getDatedPredictions();
			
			
			regModel = salesPrediction.getRegression().getBestRegressionModel();
			
			request.getSession().setAttribute("regModel", regModel);
			
			response.sendRedirect("/TrocQc/Finances");
			
		}
		
		
	}

}
