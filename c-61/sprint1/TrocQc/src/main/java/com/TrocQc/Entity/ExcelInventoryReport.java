
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
	
	public void generateReport(String filename) {  
		
		try {  
			
			InventoryDao invDao = new InventoryDao(this.userId);
			List<RawMaterial> rmList = invDao.getRawMaterials();
			List<Product> prodList = invDao.getProducts();
			List<UnitOfMeasure> uomList = invDao.getUnitsOfMesure();
			
			//REF: https://www.javatpoint.com/java-create-excel-file

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
			rowhead.createCell(6).setCellValue("Valeur en inventaire");
			
			
			for (int i = 0; i < rmList.size(); i++) {
				//VARIABLE NAMING
				HSSFRow row = sheetMateriaux.createRow((short)i+1);
				row.createCell(0).setCellValue(rmList.get(i).getId());  
				row.createCell(1).setCellValue(rmList.get(i).getName());  
				row.createCell(2).setCellValue(rmList.get(i).getCost());
				if ( rmList.get(i).getAddedDate() != null) {
					row.createCell(3).setCellValue(rmList.get(i).getAddedDate().toString());
				}
				row.createCell(4).setCellValue(rmList.get(i).getQuantity());  
				row.createCell(5).setCellValue( uomList.get(rmList.get(i).getIdUnitOfMeasure()).getName() );
				row.createCell(6).setCellValue(rmList.get(i).getQuantity() *rmList.get(i).getCost() );
				
			}
			
			
			
			
			//TEMPLATES
			HSSFSheet sheetTemplates = workbook.createSheet("Produits");
			
			rowhead = sheetTemplates.createRow((short)0); 
			
			rowhead.createCell(0).setCellValue("ID");  
			rowhead.createCell(1).setCellValue("Nom");  
			rowhead.createCell(2).setCellValue("Sku");  
			rowhead.createCell(3).setCellValue("Coût");  
			rowhead.createCell(4).setCellValue("Description");  
			rowhead.createCell(5).setCellValue("MSRP");  
			rowhead.createCell(6).setCellValue("Date d'ajout");  
			rowhead.createCell(7).setCellValue("Unité de mesure");  
			rowhead.createCell(8).setCellValue("Alerte de basse qty");  
			rowhead.createCell(9).setCellValue("Inventaire");
			rowhead.createCell(10).setCellValue("Valeur en inventaire");
			  
			
			
			for (int i = 0; i < prodList.size(); i++) {
				//VARIABLE NAMING
				HSSFRow row = sheetTemplates.createRow((short)i+1);
				row.createCell(0).setCellValue(prodList.get(i).getId());  
				row.createCell(1).setCellValue(prodList.get(i).getName());  
				row.createCell(2).setCellValue(prodList.get(i).getSku()); 
				row.createCell(3).setCellValue(prodList.get(i).getCost());
				row.createCell(4).setCellValue(prodList.get(i).getDescription());  
				row.createCell(5).setCellValue(prodList.get(i).getMsrp());
				if ( prodList.get(i).getAddedDate() != null) {
					row.createCell(6).setCellValue(prodList.get(i).getAddedDate().toString());
				}
				row.createCell(7).setCellValue( uomList.get(prodList.get(i).getIdUnitOfMeasure()).getName() ); 
				row.createCell(8).setCellValue(prodList.get(i).getLowQuantityLevel()); 
				row.createCell(9).setCellValue(prodList.get(i).getAvailableQuantity());
				row.createCell(10).setCellValue(prodList.get(i).getAvailableQuantity() * prodList.get(i).getMsrp() );
			 
				
			}
			
			//LOTS
			HSSFSheet sheetLots = workbook.createSheet("Lots");
			
			rowhead = sheetLots.createRow((short)0); 
			
			rowhead.createCell(0).setCellValue("ID");  
			rowhead.createCell(1).setCellValue("Produit");  
			rowhead.createCell(2).setCellValue("SKU");  
			rowhead.createCell(3).setCellValue("QTY Inventaire");  
			rowhead.createCell(4).setCellValue("QTY Originale");  
			rowhead.createCell(5).setCellValue("Date d'ajout");  
			rowhead.createCell(6).setCellValue("Valeur en inventaire");
			  
			
			
			int rownumber= 1;
			for (int i = 0; i < prodList.size(); i++) {
				//VARIABLE NAMING
				
				for (int j = 0; j < prodList.get(i).getLots().size(); j++) {
				
					Lot lot = prodList.get(i).getLots().get(j);
					HSSFRow row = sheetLots.createRow((short)rownumber);
					row.createCell(0).setCellValue(lot.getId());  
					row.createCell(1).setCellValue(prodList.get(i).getName());  
					row.createCell(2).setCellValue(prodList.get(i).getSku()); 
					row.createCell(3).setCellValue(lot.getAvailablequantity());
					row.createCell(4).setCellValue(lot.getOriginalquantity());
					if ( lot.getAddeddate() != null) {
						row.createCell(5).setCellValue(lot.getAddeddate().toString());
					}
					row.createCell(6).setCellValue(lot.getAvailablequantity() * prodList.get(i).getMsrp());  
					rownumber++;
				}
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

