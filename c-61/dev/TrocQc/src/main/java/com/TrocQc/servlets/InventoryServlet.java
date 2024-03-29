package com.TrocQc.servlets;

/* Class LobbyServlet
 * Auteur: William Lemire et Korallia Frenette
 * Équipe: William et Korallia 
 * Ce servlet gère les rêquetes de la page inventaire
 */


import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.annotation.Bean;

import com.TrocQc.DAO.InventoryDao; 
import com.TrocQc.Entity.RawMaterialCustomField;
import com.TrocQc.Entity.RawMaterialsPerProduct;
import com.TrocQc.Entity.SkuGenerator;
import com.TrocQc.Entity.ProductCustomFields;
import com.TrocQc.Entity.ExcelInventoryReport;
import com.TrocQc.Entity.Lot;
import com.TrocQc.Entity.Product;
import com.TrocQc.Entity.Product.ProductBuilder;
import com.TrocQc.Entity.RawMaterial;
import com.TrocQc.Entity.UnitOfMeasure;
import com.TrocQc.Entity.User;

import java.util.List;

@WebServlet("/inventoryServlet")
public class InventoryServlet extends HttpServlet {
	
	User user;
	InventoryDao invDao; 

	public InventoryServlet( ) {
		super();
	}
	  

	  protected void doPost(HttpServletRequest request,
		        HttpServletResponse response) throws ServletException, IOException {
		  
		  try {
				user = (User)request.getSession().getAttribute("user");

			} catch (Exception e) {
				response.sendRedirect("/TrocQc/Login");
			}
		   invDao = new InventoryDao(user.getId());
		  
		  
		   
		   switch(request.getParameter("action")) {
		   		case "generateInventoryReport":
			   		this.GenerateRapport(); 
					break;

		   		case "addLot":
		   			this.saveLot(request, response);
					break;
				
		   		case "addOrModifyMaterial":
		   			this.SaveRawMaterial(request, response);
					break;
					
		   		case "addOrModifyTemplate":
		   			this.SaveProduct(request, response);
					break;
		   			
				
		   }
		   
		   response.sendRedirect("/TrocQc/Inventaire");
		   
		  
		  
	  }
	  
	 private void SaveRawMaterial(HttpServletRequest request,
		     HttpServletResponse response) throws ServletException, IOException {
		  
		 int hiddenProdId = 0;

		  String materialCustomFieldName1 = null;
		  String materialCustomFieldValue1 = null;
		  String materialCustomFieldName2 = null;
		  String materialCustomFieldValue2 = null;
		  String materialCustomFieldName3 = null;
		  String materialCustomFieldValue3 = null;
		  
		  String materialName = request.getParameter("materialName");
		  double materialQuantity = Double.parseDouble(request.getParameter("materialQuantity"));
		  int materialUOM = Integer.parseInt(request.getParameter("materialUOM"));
		  UnitOfMeasure uom =  invDao.getUnitOfMeasure(materialUOM);
		  
		  
		  double materialCost = Double.parseDouble(request.getParameter("materialCost"));
		  
		  try {
			  hiddenProdId = Integer.parseInt(request.getParameter("hiddenProdId"));
		 	
		  } catch (Exception e) {
		
		  }
		  		  
		  try {
			  materialCustomFieldName1 = request.getParameter("materialNewFieldName1");
			  materialCustomFieldValue1 = request.getParameter("materialNewFieldValue1");
			  materialCustomFieldName2 = request.getParameter("materialNewFieldName2");
			  materialCustomFieldValue2 = request.getParameter("materialNewFieldValue2");
			  materialCustomFieldName3 = request.getParameter("materialNewFieldName3");
			  materialCustomFieldValue3 = request.getParameter("materialNewFieldValue3");

		  } catch (Exception e) {
		  }			
		  
		  List<RawMaterialCustomField> rmcfList = new ArrayList<RawMaterialCustomField>();
			
		
		  if (!materialCustomFieldName1.equals("") || !materialCustomFieldValue1.equals("")) {
			  RawMaterialCustomField rmcf1 = new RawMaterialCustomField(materialCustomFieldName1, materialCustomFieldValue1);
			  rmcfList.add(rmcf1);
			  
		  }
		  if (!materialCustomFieldName2.equals("") || !materialCustomFieldValue2.equals("")) {
			  RawMaterialCustomField rmcf2 = new RawMaterialCustomField(materialCustomFieldName2, materialCustomFieldValue2);
			  rmcfList.add(rmcf2);
			  
		  }
		  if (!materialCustomFieldName3.equals("") || !materialCustomFieldValue3.equals("")) {
			  RawMaterialCustomField rmcf3 = new RawMaterialCustomField(materialCustomFieldName3, materialCustomFieldValue3);
			  rmcfList.add(rmcf3);
		  }
		

		  RawMaterial rawMaterial = new RawMaterial(materialName, materialCost, uom, materialQuantity, user.getId(), rmcfList);
		  
		  if ( hiddenProdId > 0 ) {
			  rawMaterial.setId(hiddenProdId);
		  }
		  
			  invDao.SaveRawMaterial(rawMaterial);
		
	 }
	 
	 private void SaveProduct(HttpServletRequest request,
		     HttpServletResponse response) throws ServletException, IOException {
		 
		 
		 
		 
		 int hiddenTemplateId = 0;
		  int rawMaterialName1 = 0;
		  double rawMaterialQuantity1 = 0.0;
		  int rawMaterialName2 = 0;
		  double rawMaterialQuantity2 = 0.0;
		  int rawMaterialName3 = 0;
		  double rawMaterialQuantity3 = 0.0;
		  String newFieldName1 = null;
		  String newFieldValue1 = null;
		  String newFieldName2 = null;
		  String newFieldValue2 = null;
		  String newFieldName3 = null;
		  String newFieldValue3 = null;
		  String newSku = null;
		  
		  
	  try {
		  hiddenTemplateId = Integer.parseInt(request.getParameter("hiddenTemplateId"));
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		  
		  String templateName = request.getParameter("templateName");
		  String templateSKU = request.getParameter("templateSKU");
		  String templateDesc = request.getParameter("templateDesc");
		  int templateUOM = Integer.parseInt(request.getParameter("templateUOM"));
		  
		  
		  int templateLQL = Integer.parseInt(request.getParameter("templateLQL")) ; 
		  
		  double templateCost = Double.parseDouble( request.getParameter("templateCost") ); 
		  double templatePrice = Double.parseDouble( request.getParameter("templatePrice") ); 
		  
		  //Raw materials
		  
			try {
				  newFieldName1 = request.getParameter("newFieldName1"); 
				  newFieldValue1 = request.getParameter("newFieldValue1"); 
			
			} catch (Exception e) {
				// TODO: handle exception
			}
		  try {
			
				  rawMaterialName1 = Integer.parseInt(request.getParameter("rawMaterialId1")) ; 
				  rawMaterialQuantity1 = Double.parseDouble( request.getParameter("rawMaterialQuantity1") ); 
				  
			} catch (Exception e) {
				// TODO: handle exception
			}
			
			try {
				   newFieldName2 = request.getParameter("newFieldName2"); 
				   newFieldValue2 = request.getParameter("newFieldValue2"); 
			
			} catch (Exception e) {
				// TODO: handle exception
			}
		  try {
			
				   rawMaterialName2 = Integer.parseInt(request.getParameter("rawMaterialId2")) ; 
				   rawMaterialQuantity2 = Double.parseDouble( request.getParameter("rawMaterialQuantity2") ); 
				  
			} catch (Exception e) {
				// TODO: handle exception
			}
			
			try {
				   newFieldName3 = request.getParameter("newFieldName3"); 
				   newFieldValue3 = request.getParameter("newFieldValue3"); 

			} catch (Exception e) {
				// TODO: handle exception
			}
		  try {
						
				   rawMaterialName3 = Integer.parseInt(request.getParameter("rawMaterialId3")) ; 
				   rawMaterialQuantity3 = Double.parseDouble( request.getParameter("rawMaterialQuantity3") ); 
				
			} catch (Exception e) {
				// TODO: handle exception
			}
		  
			List<ProductCustomFields> pcfList = new ArrayList<ProductCustomFields>();

			if (newFieldName1.length() > 0 && newFieldValue1.length() > 0 ) {
				ProductCustomFields pcf = new ProductCustomFields(newFieldName1, newFieldValue1);
				pcfList.add(pcf);
			}
			if (newFieldName2.length() > 0 && newFieldValue2.length() > 0) {
				ProductCustomFields pcf2 = new ProductCustomFields(newFieldName2, newFieldValue2);
				pcfList.add(pcf2);
			}
			if (newFieldName3.length() > 0 && newFieldValue3.length() > 0) {
				ProductCustomFields pcf3 = new ProductCustomFields(newFieldName3, newFieldValue3);
				pcfList.add(pcf3);
			}


			
			  //RawMaterialsPerProduct rmpp = new RawMaterialsPerProduct(rawMaterialUOM3, templateLQL, rawMaterialQuantity3)
			 List<RawMaterialsPerProduct> rmList = new ArrayList<RawMaterialsPerProduct>();
			 
			if ( rawMaterialQuantity1 > 0 && rawMaterialName1 > 0 ) {
			 RawMaterialsPerProduct rmp = new RawMaterialsPerProduct();
			 rmp.setQuantity(rawMaterialQuantity1);
			 rmp.setRawmaterialid(rawMaterialName1);
			 rmList.add(rmp);
			}
			
			if ( rawMaterialQuantity2 > 0 && rawMaterialName2 > 0 ) {
			 RawMaterialsPerProduct rmp = new RawMaterialsPerProduct();
			 rmp.setQuantity(rawMaterialQuantity2);
			 rmp.setRawmaterialid(rawMaterialName2);
			 rmList.add(rmp);
			}
			
			
			if ( rawMaterialQuantity3 > 0 && rawMaterialName3 > 0 ) {
			 RawMaterialsPerProduct rmp = new RawMaterialsPerProduct();
			 rmp.setQuantity(rawMaterialQuantity3);
			 rmp.setRawmaterialid(rawMaterialName3);
			 rmList.add(rmp);
			}
		
			
			Product product = new Product();
			
			if (hiddenTemplateId > 0) {
				//UPDATE PROD
									
				product = invDao.getProduct(hiddenTemplateId);
				
				String delProd = request.getParameter("deleteProduct");
				
				try {
				
					if (delProd != null && delProd.equals("true")) {
						invDao.deleteProduct(product);
						return;
					}
				} catch (Exception e) {
					return;
				}
			
				
				//SET VALUES FROM FORM
				product.setName(templateName);
				product.setDescription(templateDesc);
				
				
				if (templateSKU.equals("")) {
				  newSku = SkuGenerator.generateSKU(hiddenTemplateId, templateName, newFieldValue1, newFieldValue2, newFieldValue3);
				  product.setSku(newSku);
					
				}
				else {
					product.setSku(templateSKU);
					
				}
				product.setCost(templateCost);
				product.setMsrp(templatePrice);
				product.setLowQuantityLevel(templateLQL);			
				product.setIdUnitOfMeasure(templateUOM);
				product.setUserCustomFields(pcfList);
				product.setRawmaterials(rmList);
				
				invDao.SaveProduct(product);
				
			}
			else {
				//CREATE PROD
				  //BUILDER

					
				  
					Product.ProductBuilder pb = new Product.ProductBuilder(templateName, templateCost, templatePrice , templateSKU);
					pb.description(templateDesc);
					pb.idUnitOfMeasure(templateUOM);
					pb.lowQuantityLevel(templateLQL);
					pb.UserCustomFields(pcfList);
					pb.userID(user.getId());
					Product newProduct = pb.build();
					newProduct.setRawmaterials(rmList);
				  	
				  if (templateSKU.equals("")) {
					  newSku = SkuGenerator.generateSKU(hiddenTemplateId, templateName, newFieldValue1, newFieldValue2, newFieldValue3);
					  newProduct.setSku(newSku);
				  }
				  
				  invDao.AddProduct(newProduct);
				  
			}
	 }
	 
	 private void saveLot(HttpServletRequest request,
     HttpServletResponse response) throws ServletException, IOException {
			int prodId = Integer.parseInt(request.getParameter("productId"));
			double prodQuantity = Double.parseDouble(request.getParameter("productQuantity"));
			Product prod = invDao.getProduct(prodId);
			double addedLots = invDao.addLot(prod, prodQuantity);
			String lotMsg = "Quantité désirée: " + prodQuantity + "." + " Lots créés: " + addedLots + ".";
			request.getSession().setAttribute("lotMsg", lotMsg);
			
			
	 }
	 
	 private void GenerateRapport() {
		 ExcelInventoryReport eir = new ExcelInventoryReport(user.getId());
		 
		 String home = System.getProperty("user.home");
		  eir.generateReport(home+"/Downloads/" +"InventoryReport.xls");
		  
		  
	 }
}
