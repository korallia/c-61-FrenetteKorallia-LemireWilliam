package com.TrocQc.Entity;

import java.io.FileOutputStream;
import java.sql.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import com.TrocQc.DAO.FinanceDao;
import com.TrocQc.DAO.InventoryDao;
import com.TrocQc.DAO.VenteDao;
import com.TrocQc.Utils.DatePoint;
import com.TrocQc.Utils.LinkedList;
import com.TrocQc.Utils.Point;

public class FinanceReport {

	private int userId;
	
	public FinanceReport(int userId) {
		this.userId = userId;
	}
	
	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}  
	
	public void generateReport(String filename, Date startdate, Date enddate) {  
		
		try {
			
			InventoryDao invDao = new InventoryDao();
			List<Product> prodList = invDao.getProducts();
			
			Map<Integer, Product> products = new HashMap<>();
			for(int i= 0; i < prodList.size(); i++) {
				products.put(prodList.get(i).getId(), prodList.get(i));
			}
			
			FinanceDao financedao = new FinanceDao(this.userId);
			
			HSSFWorkbook workbook = new HSSFWorkbook();  

			List<Vente> ventes = financedao.GetAllVentes();
			
			
			
			//VENTES
			HSSFSheet sheetVentes= workbook.createSheet("Ventes");   
			
			//creating the 0th row using the createRow() method  
			HSSFRow rowhead = sheetVentes.createRow((short)0);  
			//creating cell by using the createCell() method and setting the values to the cell by using the setCellValue() method  
			rowhead.createCell(0).setCellValue("ID");  
			rowhead.createCell(1).setCellValue("Date Vente");
			rowhead.createCell(2).setCellValue("Nom Produit");  
			rowhead.createCell(3).setCellValue("SKU");  
			rowhead.createCell(4).setCellValue("Quantité");  
			rowhead.createCell(5).setCellValue("Montant");  
			rowhead.createCell(6).setCellValue("Coût");  
			rowhead.createCell(7).setCellValue("Profit");
			
			
			for (int i = 0; i < ventes.size(); i++) {
				//VARIABLE NAMING
				HSSFRow row = sheetVentes.createRow((short)i+1);
				
				row.createCell(0).setCellValue(ventes.get(i).getId());
				row.createCell(1).setCellValue(ventes.get(i).getVentedate().toString());
				row.createCell(2).setCellValue(products.get(ventes.get(i).getProductid()).getName());
				row.createCell(3).setCellValue(products.get(ventes.get(i).getProductid()).getSku());
				row.createCell(4).setCellValue(ventes.get(i).getQuantity());
				row.createCell(5).setCellValue(ventes.get(i).getMontant());
				row.createCell(6).setCellValue(ventes.get(i).getCout());
				row.createCell(7).setCellValue(ventes.get(i).getMontant()-ventes.get(i).getCout());
				
			}
			
			SalesPrediction sp = new SalesPrediction(startdate, enddate );
			
			LinkedList<Point> points = financedao.GetDailySalesOfPeriod(sp.getStartdate(), sp.getEnddate());
			
			sp.setActualsales(points );
			LinkedList<DatePoint> predictions = sp.getDatedPredictions();
			LinkedList<DatePoint> sales = financedao.GetDailySalesOfPeriodByDay(startdate, enddate);
			
			
			//Day report
			HSSFSheet sheetReport= workbook.createSheet("Rapport par jour");   
			
			//creating the 0th row using the createRow() method  
			rowhead = sheetReport.createRow((short)0);  
			//creating cell by using the createCell() method and setting the values to the cell by using the setCellValue() method  
			rowhead.createCell(0).setCellValue("Date");  
			rowhead.createCell(1).setCellValue("Ventes");
			rowhead.createCell(2).setCellValue("Prédiction");  
			rowhead.createCell(3).setCellValue("Écart");  
			
			
			Iterator<DatePoint> predictionIterator = predictions.iterator();
			Iterator<DatePoint> venteIterator = sales.iterator();
			int rownumber = 1;
			DatePoint nextvente = null;
			if ( venteIterator.hasNext()) {
				nextvente = (DatePoint) venteIterator.next();
			}
			double actual = 0;
			while(predictionIterator.hasNext()){
				//VARIABLE NAMING
				
				DatePoint prediction = (DatePoint) predictionIterator.next();
				if ( prediction != null && prediction.getDate() != null) {
					
					HSSFRow row = sheetReport.createRow((short)rownumber);
					row.createCell(0).setCellValue(prediction.getDate().toString());
					
					if ( nextvente != null && nextvente.getDate().toString().compareTo(prediction.getDate().toString()) ==0 ) {
						actual = nextvente.getValue();
						nextvente = (DatePoint) venteIterator.next();
					}
					else {
						actual  = 0;
					}
					row.createCell(1).setCellValue(actual);
					row.createCell(2).setCellValue(prediction.getValue());
					row.createCell(3).setCellValue(actual - prediction.getValue());
				}
				else {
					System.out.println("We have a null date point");
				}
				rownumber++;
				
			}
			
			
			
			
			
			
			
			FileOutputStream fileOut = new FileOutputStream(filename);  
			workbook.write(fileOut);  

			fileOut.close();  

			workbook.close();  

			System.out.println("Excel file has been generated successfully.");  
			
			
			
			
		}   
		catch (Exception e) {  
			e.printStackTrace();  
		}  
		
	}
		
	
}
