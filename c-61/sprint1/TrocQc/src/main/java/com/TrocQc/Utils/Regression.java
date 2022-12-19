package com.TrocQc.Utils;


public class Regression {

	private LinkedList<Point> points;
	private double a;
	private double b;
	
	public Regression() {
		points =  new LinkedList<Point>();
	}
	
	public Regression(LinkedList<Point> points) {
		this.points = points;
		calcA();
		calcB();
	}

	public LinkedList<Point> getPoints() {
		return points;
	}

	public void setPoints(LinkedList<Point> points) {
		this.points = points;
		calcA();
		calcB();
	}
	
	public double sumX() {
		double sum = 0;
		for (int i = 0; i < getN(); i++) {
			sum += points.get(i).getX();
		}
		return sum;
	}
	
	public double sumXN() {
		double sum = 0;
		for (int i = 0; i < getN(); i++) {
			sum += points.get(i).getX() *getN();
		}
		return sum;
	}
	
	public double sumY() {
		return sumY(points);
	}
	
	public double sumY(LinkedList<Point> points ) {
		double sum = 0;
		for (int i = 0; i < getN(); i++) {
			sum += points.get(i).getY();
		}
		return sum;
	}
	
	public double sumY2() {
		return sumY2(points);
	}
	
	public double sumY2(LinkedList<Point> points ) {
		double sum = 0;
		for (int i = 0; i < getN(); i++) {
			sum += Math.pow(points.get(i).getY(), 2);
		}
		return sum;
	}
	
	public double sumYMeanSquared() {
		return sumYMeanSquared(points);
	}
	public double sumYMeanSquared(LinkedList<Point> points) {
		// https://en.wikipedia.org/wiki/Pearson_correlation_coefficient
		double mean = averageY(points);
		double sum = 0;
		for (int i = 0; i < getN(); i++) {
			sum += Math.pow(points.get(i).getY() - mean, 2);
		}
		return sum;
	}
	
	
	public double sumYMeanCombined(LinkedList<Point> prediction) {
		// https://en.wikipedia.org/wiki/Pearson_correlation_coefficient
		double mean = averageY(points);
		double predmean = averageY(prediction);
		double sum = 0;
		for (int i = 0; i < getN(); i++) {
			sum += (points.get(i).getY() - mean) * (prediction.get(i).getY() - predmean);
		}
		return sum;
	}
	
	
	public double sumYPredY(LinkedList<Point> pred) {
		double sum = 0;
		for (int i = 0; i < getN(); i++) {
			sum += points.get(i).getY() * pred.get(i).getY() ;
		}
		return sum;
	}
	
	
	public double sumYN() {
		double sum = 0;
		for (int i = 0; i < getN(); i++) {
			sum += points.get(i).getY() * getN();
		}
		return sum;
	}
	
	public double sumXY() {
		double sum = 0;
		for (int i = 0; i < getN(); i++) {
			sum += points.get(i).getX() * points.get(i).getY();
		}
		return sum;
	}
	public double squaredsumYYPredictionDifference(LinkedList<Point> prediction) {
		double difference = 0;
		
		if ( getN() == prediction.size()) {		
			for (int i = 0; i < getN(); i++) {

				double pred = prediction.get(i).getY();
				double point = points.get(i).getY();
				double diff = pred - point;
				difference += Math.pow(prediction.get(i).getY() - points.get(i).getY(), 2);
			}
			return difference;
		}
		else {
			//to avoid division by 1 error.
			return 1;
		}
	
	}
	
	public double averageX() {
		return sumX() / getN();
		
	}
	
	
	
	public double averageY(LinkedList<Point> prediction) {
		return sumY(prediction) / getN(prediction);
		
	}
	public double averageY() {
		return sumY() / getN();
		
	}
	
	public double stdDeviationX() {
		// https://www.mathsisfun.com/data/standard-deviation-formulas.html
		double deviation = 0;
		if ( getN() > 1) {
		
			double mean = averageX();
			
			double calcsum = 0;
			for (int i = 0; i < getN(); i++) {
				calcsum  += Math.pow(points.get(i).getX() - mean, 2);
			}
			double calcmean = calcsum / (getN()-1);
			deviation = Math.sqrt(calcmean);
			
		}
		return deviation;
	}
	public double stdDeviationY() {
		// https://www.mathsisfun.com/data/standard-deviation-formulas.html
		double deviation = 0;
		if (getN() > 1) {
			double mean = averageY();
			
			double calcsum = 0;
			for (int i = 0; i < getN(); i++) {
				calcsum  += Math.pow(points.get(i).getY() - mean, 2);
			}
			double calcmean = calcsum / (getN()-1);
			deviation = Math.sqrt(calcmean);
			
		}
		return deviation;
	}
	public int getN() {
		return points.size();
	}
	public int getN(LinkedList<Point> prediction) {
		return prediction.size();
	}
	
	
	
	public double getA() {
		return a;
	}

	public void setA(double a) {
		this.a = a;
	}

	public double getB() {
		return b;
	}

	public void setB(double b) {
		this.b = b;
	}

	public double calcA() {
		// http://faculty.cas.usf.edu/mbrannick/regression/Part3/RegBasics.html
		if (getN() > 1 ) {
			
			double sumxy =sumXY();
			int n =  getN();
			double averagex = averageX();
			double averagey = averageY();
			double stdevx = stdDeviationX();
			double pow =Math.pow(stdDeviationX(),2);
			
			
			
			
			setA( (sumXY() - ( getN() * averageX() * averageY() )) /
				( (getN()-1) * Math.pow(stdDeviationX(),2) )
				);
			return getA();
		}
		else {
			return getA();
		}
				
		
	}
	public double calcB() {
		// http://faculty.cas.usf.edu/mbrannick/regression/Part3/RegBasics.html
		
		setB(averageY() - (getA() * averageX()));
		return getB();
	}
	
	public double getLinearY(double x) {
		return (getA() * x) + getB();
	}
	
	
	public LinkedList<Point> getLinearPredictions(){
		LinkedList<Point> predictions = new LinkedList<Point>();
		for( int i = 0; i < getN(); i++) {
			Point p = new Point( points.get(i).getX(), getLinearY( points.get(i).getX()) );
			predictions.add(p);
		}
		return predictions;
	}
	
	public double getlogY(double x) {
		return (getA() * Math.log(x)) + getB();
	}

	public LinkedList<Point> getLogPredictions(){
		LinkedList<Point> predictions = new LinkedList<Point>();
		for( int i = 0; i < getN(); i++) {
			Point p = new Point( points.get(i).getX(), getlogY( points.get(i).getX()) );
			predictions.add(p);
		}
		return predictions;
	}
	
	
	public double getExponentialY(double x) {
		return getA() * Math.pow(getB() , x);
	}

	public LinkedList<Point> getExponentialPredictions(){
		LinkedList<Point> predictions = new LinkedList<Point>();
		for( int i = 0; i < getN(); i++) {
			Point p = new Point( points.get(i).getX(), getExponentialY( points.get(i).getX()) );
			predictions.add(p);
		}
		return predictions;
	}

	public LinkedList<Point> getNamedPredictions(String name){
		
		
		switch(name) {
			case "log":
				return getLogPredictions();
			case "exponential":
				return getExponentialPredictions();
			case "linear":
			default:
				return getLinearPredictions();
		}
	}
	
	public double getNamedY(String name, double x) {
		switch(name) {
		case "log":
			return getlogY(x);
		case "exponential":
			return getExponentialY(x);
		case "linear":
		default:
			return getLinearY(x);
		}
		
	}
 
	public double getBestY(double x) {
		String modelname = getBestRegressionModel();
		return getNamedY(modelname, x);
	}
	
	public double getR(LinkedList<Point> prediction) {
		// https://en.wikipedia.org/wiki/Pearson_correlation_coefficient
		double ssX = sumYMeanSquared(); 
		double ssY = sumYMeanSquared(prediction); 
		double sscombined = sumYMeanCombined(prediction); 
		return sscombined / Math.sqrt( ssX * ssY ); 
	}
	
	public double getR2(LinkedList<Point> prediction) {
		// https://en.wikipedia.org/wiki/Pearson_correlation_coefficient
		double r = getR(prediction);
		return Math.pow(r, 2);
	}

	
	public String getBestRegressionModel() {
		LinkedList<Point> linear = getLinearPredictions();
		LinkedList<Point> log = getLogPredictions();
		LinkedList<Point> exponential = getExponentialPredictions();
		
		double r2l = getR2(linear);
		double r2log = getR2(log);
		double r2e = getR2(exponential);
		
		if ( r2l > r2log && r2l > r2e ) {
			return "linear";
		}
		else if ( r2log > r2e) {
			return "log";
		}
		else {
			return "exponential";
		}
	}
	public LinkedList getBestPrediction() {
		String modelname = getBestRegressionModel();
		return getNamedPredictions(modelname);
	}
	
}
