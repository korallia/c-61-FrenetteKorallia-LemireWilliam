
package com.TrocQc.Entity;

import java.io.*;
import java.util.List;

import com.TrocQc.DAO.InventoryDao; 
import com.TrocQc.Entity.RawMaterialCustomField;
import com.TrocQc.Entity.Product;
import com.TrocQc.Entity.Product.ProductBuilder;
import com.TrocQc.Entity.RawMaterial;
import com.TrocQc.Entity.UnitOfMeasure;
import com.TrocQc.Entity.User;

import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFSheet;  
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.hibernate.validator.constraints.Length;
import org.apache.poi.hssf.usermodel.HSSFRow;  

public class ExcelInventoryReport  {  
	private int userId;
	
	
	
	public ExcelInventoryReport(int userId) {
		this.userId = userId;
	}
	
	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}  
	
	public void generateReport(String[]args) {  
		
		try {  
			
			InventoryDao invDao = new InventoryDao();
			List<RawMaterial> rmList = invDao.getRawMaterialsOfUserId(this.userId);
			List<Product> prodList = invDao.getProductsOfUserId(this.userId);
			List<UnitOfMeasure> uomList = invDao.getUnitsOfMesure();
			
			//REF: https://www.javatpoint.com/java-create-excel-file
			String filename = "F:\\Demo Data\\Balance.xlsx";  

			HSSFWorkbook workbook = new HSSFWorkbook();  

			
			//RAW MATERIALS
			HSSFSheet sheetMateriaux = workbook.createSheet("Matériaux");   
			
			//creating the 0th row using the createRow() method  
			HSSFRow rowhead = sheetMateriaux.createRow((short)0);  
			//creating cell by using the createCell() method and setting the values to the cell by using the setCellValue() method  
			rowhead.createCell(0).setCellValue("ID");  
			rowhead.createCell(1).setCellValue("Nom");  
			rowhead.createCell(2).setCellValue("Coût");  
			rowhead.createCell(3).setCellValue("Date d'ajout");  
			rowhead.createCell(4).setCellValue("Quantité");  
			rowhead.createCell(5).setCellValue("Unité de mesure");  
			
			
			for (int i = 1; i <= rmList.size(); i++) {
				//VARIABLE NAMING
				HSSFRow row = sheetMateriaux.createRow((short)i);
				row.createCell(0).setCellValue(rmList.get(i).getId());  
				row.createCell(1).setCellValue(rmList.get(i).getName());  
				row.createCell(2).setCellValue(rmList.get(i).getCost());  
				row.createCell(3).setCellValue(rmList.get(i).getAddedDate());  
				row.createCell(4).setCellValue(rmList.get(i).getQuantity());  
				row.createCell(5).setCellValue( uomList.get(rmList.get(i).getIdUnitOfMeasure()).getName() ); 
				
			}
			
			
			//TEMPLATES
			HSSFSheet sheetTemplates = workbook.createSheet("Gabarits");
			
			rowhead = sheetTemplates.createRow((short)0); 
			
			rowhead.createCell(0).setCellValue("ID");  
			rowhead.createCell(1).setCellValue("Nom");  
			rowhead.createCell(2).setCellValue("Sku");  
			rowhead.createCell(3).setCellValue("Coût");  
			rowhead.createCell(4).setCellValue("Description");  
			rowhead.createCell(5).setCellValue("MSRP");  
			rowhead.createCell(6).setCellValue("Date d'ajout");  
			rowhead.createCell(7).setCellValue("Unité de mesure");  
			rowhead.createCell(8).setCellValue("NBQ");  
			rowhead.createCell(9).setCellValue("QR Code");  
			
			
			for (int i = 1; i <= rmList.size(); i++) {
				//VARIABLE NAMING
				HSSFRow row = sheetTemplates.createRow((short)i);
				row.createCell(0).setCellValue(prodList.get(i).getId());  
				row.createCell(1).setCellValue(prodList.get(i).getName());  
				row.createCell(2).setCellValue(prodList.get(i).getSku()); 
				row.createCell(3).setCellValue(prodList.get(i).getCost());
				row.createCell(4).setCellValue(prodList.get(i).getDescription());  
				row.createCell(5).setCellValue(prodList.get(i).getMsrp()); 
				row.createCell(6).setCellValue(prodList.get(i).getAddedDate());  
				row.createCell(7).setCellValue( uomList.get(prodList.get(i).getIdUnitOfMeasure()).getName() ); 
				row.createCell(8).setCellValue(prodList.get(i).getLowQuantityLevel()); 
				row.createCell(9).setCellValue(prodList.get(i).getQRcode()); 
				
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

