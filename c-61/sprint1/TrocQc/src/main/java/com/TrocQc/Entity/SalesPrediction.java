package com.TrocQc.Entity;

import java.sql.Date;
import java.time.Duration;
import java.time.LocalDate;

import com.TrocQc.Utils.DatePoint;
import com.TrocQc.Utils.LinkedList;
import com.TrocQc.Utils.Point;
import com.TrocQc.Utils.Regression;

public class SalesPrediction {

	
	private Regression regression;
	private LinkedList<Point> actualsales;
	private Date startdate;
	private Date enddate;
	
	public SalesPrediction(Date startdate) {
		this.startdate = startdate;
		LocalDate ld = startdate.toLocalDate();
		this.enddate = Date.valueOf(ld.plusYears(1));
		regression = new Regression();
	}
	public SalesPrediction(Date startdate,Date enddate) {
		this.startdate = startdate;
		this.enddate = enddate;
		regression = new Regression();
	}
	public SalesPrediction(Date startdate,Date enddate, LinkedList<Point> sales) {
		this.startdate = startdate;
		this.enddate = enddate;
		this.actualsales = sales;
		regression = new Regression(sales);
	}
	public Regression getRegression() {
		return regression;
	}
	public void setRegression(Regression regression) {
		this.regression = regression;
	}
	public LinkedList getActualsales() {
		return actualsales;
	}
	public void setActualsales(LinkedList<Point> actualsales) {
		this.actualsales = actualsales;
		regression.setPoints(actualsales);
	}
	public Date getStartdate() {
		return startdate;
	}
	public void setStartdate(Date startdate) {
		this.startdate = startdate;
	}
	public Date getEnddate() {
		return enddate;
	}
	public void setEnddate(Date enddate) {
		this.enddate = enddate;
	}
	
	public double getPredictionForDate(Date requested) {
		LocalDate ldrequest = requested.toLocalDate();
		return getPredictionForDate(ldrequest);
	}
	public double getPredictionForDate(LocalDate requested) {
		LocalDate ldrequest = requested;
		LocalDate ldstart = startdate.toLocalDate();
		long x = Duration.between(ldrequest, ldstart).toDays() +1; // plus since since we start at 1
		return regression.getBestY(x);
	}
	
	public LinkedList<DatePoint> getDatedPredictions() {
		LinkedList<DatePoint> list = new LinkedList<DatePoint>();
		LocalDate firstday = startdate.toLocalDate();
		long days = Duration.between(firstday , enddate.toLocalDate()).toDays() +1; // plus one since we count start and end
		
		for(int i = 0; i < days; i++) {
			Date currentday = Date.valueOf(firstday.plusDays(i));
			double y = getPredictionForDate(currentday);
			DatePoint point = new DatePoint(currentday , y);
			list.add(point);
		}
		
		return list;
		
	}
	
	

}
