package com.TrocQc.Entity;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class SkuGenerator {
	
	private static String reggie = "(?:[a-zA-Z]{3})|(\\d+[a-zA-Z])";
	
	
	public static String generateSKU(int id, String name, String customCol1, String customCol2, String customCol3 ) {
		
		
		
		//String rawString = name + " " + customCol1 + " " + customCol2 + " " + customCol3;
		String sku = "";
		
		
		
		Pattern pattern = Pattern.compile(reggie);
		Matcher matcher1 = pattern.matcher(name);
		Matcher matcher2 = pattern.matcher(customCol1);
		Matcher matcher3 = pattern.matcher(customCol2);
		Matcher matcher4 = pattern.matcher(customCol3);
		
		if(matcher1.find()) {
			sku += "" + matcher1.group();
		}
		if(matcher2.find()) {
			sku += "-" + matcher2.group();
		}
		if(matcher3.find()) {
			sku += "-" + matcher3.group();
		}
		if(matcher4.find()) {
			sku += "-" + matcher4.group();
		}
		
		
		return sku + "-" +id;
	}
	
}
