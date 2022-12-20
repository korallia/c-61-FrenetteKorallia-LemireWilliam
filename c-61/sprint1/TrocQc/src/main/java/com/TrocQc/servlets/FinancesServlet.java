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
import com.TrocQc.Entity.FinanceReport;
import com.TrocQc.Entity.SalesPrediction;
import com.TrocQc.Entity.User;
import com.TrocQc.Utils.DatePoint;
import com.TrocQc.Utils.LinkedList;
import com.TrocQc.Utils.Point;

/* Class FinancesServlet
 * Auteur: William Lemire
 * Équipe: William et Korallia 
 * Ce servlet met à jour le rapport de finance
 */


@WebServlet("/financesServlet")
public class FinancesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
	User user;
	
    public FinancesServlet() {
        super();

    }
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			user = (User)request.getSession().getAttribute("user");
		
		} catch (Exception e) {
			response.sendRedirect("/TrocQc/Login");
		}
				
		//Date startDate = java.sql.Date.valueOf(startDateStr);
		if (request.getParameter("action").equals("generateFinanceReport")) {
			FinanceReport fr = new FinanceReport(user.getId());
			Date startDate = java.sql.Date.valueOf( (String) request.getSession().getAttribute("startDateSession") );
			Date endDate = java.sql.Date.valueOf( (String) request.getSession().getAttribute("endDateSession") );
			
			String home = System.getProperty("user.home");
			fr.generateReport(home+"/Downloads/" +"FinancialReport.xls", startDate, endDate);
			response.sendRedirect("/TrocQc/Finances");
			return;
		}
		
		
		FinanceDao finDao = new FinanceDao(1);
		
		String startDateStr = request.getParameter("startDate");
		String endDateStr = request.getParameter("endDate");
		
		Date startDate = java.sql.Date.valueOf(startDateStr);
		Date endDate = java.sql.Date.valueOf(endDateStr);
		
		String regModel = "---";
		request.getSession().setAttribute("regModel", regModel);
		
		if (startDate == null) {
			// ONLY FOR THE DAY
			SalesPrediction salesPrediction = new SalesPrediction(endDate);
			double daySalePrediction = salesPrediction.getPredictionForDate(endDate);
			
			request.getSession().setAttribute("daySalePrediction", daySalePrediction);
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
