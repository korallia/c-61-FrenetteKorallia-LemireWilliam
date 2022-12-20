
/* Class Point
 * Auteur: Korallia Frenette
 * Équipe: William et Korallia 
 * Cette classe est un type custom pour storer un point X et Y
 */

package com.TrocQc.Utils;


public class Point {

	private double x;
	private double y;
	
	public Point() {
	
	}
	public Point(double x, double y) {
		this.x = x;
		this.y = y;
	}
	public double getX() {
		return x;
	}
	public void setX(double x) {
		this.x = x;
	}
	public double getY() {
		return y;
	}
	public void setY(double y) {
		this.y = y;
	}
	

}
