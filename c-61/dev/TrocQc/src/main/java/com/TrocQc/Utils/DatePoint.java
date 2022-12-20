// Class DatePoint
// Auteur: Korallia Frenette
// Équipe: William et Korallia 
// Similaire à un point X et Y, mais avec une date et une valeur

package com.TrocQc.Utils;


import java.sql.Date;

public class DatePoint {

	Date date;
	double value;
	
	public DatePoint() {
	}

	public DatePoint(Date date, double value) {
		this.date = date;
		this.value = value;
		
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public Double getValue() {
		return value;
	}

	public void setValue(Double value) {
		this.value = value;
	}
	

}
