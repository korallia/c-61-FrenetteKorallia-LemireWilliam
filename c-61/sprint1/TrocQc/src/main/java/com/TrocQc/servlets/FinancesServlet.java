package com.TrocQc.servlets;

import java.io.IOException;
import java.text.DateFormat;
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
import com.TrocQc.Utils.Point;



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
		
		String startDateStr = request.getParameter("startDate");
		String endDateStr = request.getParameter("endDate");
		
		Date startDate = java.sql.Date.valueOf(startDateStr);
		Date endDate = java.sql.Date.valueOf(endDateStr);
		
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
			SalesPrediction salesPrediction = new SalesPrediction(endDate);
			
			request.getSession().setAttribute("regModel", regModel);
		}
		else {
			// RANGE OF DATES
			SalesPrediction salesPrediction = new SalesPrediction(startDate, endDate);
			LinkedList <DatePoint> dpList = salesPrediction.getDatedPredictions();
			LinkedList <DatePoint> pointList = finDao.GetDailySalesOfPeriodByDay(startDate, endDate);
			String [] xVals = new String[dpList.size()];
			String [] yVals = new String[dpList.size()];
			
			DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			regModel = salesPrediction.getRegression().getBestRegressionModel();
			
			
			for (int i = 0; i < dpList.size(); i++) {
				DatePoint dp = dpList.get(i);
				Date date = dp.getDate();
				xVals[i] = df.format(date);
				yVals[i] = dp.getValue().toString();
			}
			
			
			
			
			
			request.getSession().setAttribute("xVals", xVals);
			request.getSession().setAttribute("yVals", yVals);
			request.getSession().setAttribute("regModel", regModel);
			
			response.sendRedirect("/TrocQc/Finances");
			
		}
		
		
	}

}
