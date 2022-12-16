package com.TrocQc.servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;

import com.TrocQc.DAO.InventoryDao; 
import com.TrocQc.Entity.RawMaterialCustomField;
import com.TrocQc.Entity.ProductCustomFields;
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

	public InventoryServlet( ) {
		super();
	}
	
	  protected void doPost(HttpServletRequest request,
		        HttpServletResponse response) throws ServletException, IOException {
		  
		  InventoryDao invDao = new InventoryDao();
		  
		  
		  if (request.getParameter("materialName") != null) {
			  int hiddenProdId = 0;
			  String materialCustomFieldName1 = null;
			  String materialCustomFieldValue1 = null;
			  String materialCustomFieldName2 = null;
			  String materialCustomFieldValue2 = null;
			  String materialCustomFieldName3 = null;
			  String materialCustomFieldValue3 = null;
			  
			  try {
				  hiddenProdId = Integer.parseInt(request.getParameter("hiddenProdId"));
				
			} catch (Exception e) {
				// TODO: handle exception
			}

			  String materialName = request.getParameter("materialName");
			  double materialQuantity = Double.parseDouble(request.getParameter("materialQuantity"));
			  int materialUOM = Integer.parseInt(request.getParameter("materialUOM"));
			  //double materialLQN = Double.parseDouble(request.getParameter("materialLQN"));
			  double materialCost = Double.parseDouble(request.getParameter("materialCost"));
			  
			  //Customfields
			try {
				  materialCustomFieldName1 = request.getParameter("materialNewFieldName1");
				  materialCustomFieldValue1 = request.getParameter("materialNewFieldValue1");
				
			} catch (Exception e) {
				// TODO: handle exception
			}
			  
			  

			try {
				  materialCustomFieldName2 = request.getParameter("materialNewFieldName2");
				  materialCustomFieldValue2 = request.getParameter("materialNewFieldValue2");
				
			} catch (Exception e) {
				// TODO: handle exception
			}
			  
			
			  
			try {
				  materialCustomFieldName3 = request.getParameter("materialNewFieldName3");
				  materialCustomFieldValue3 = request.getParameter("materialNewFieldValue3");
				
			} catch (Exception e) {
				// TODO: handle exception
			}
			  

			  
			  UnitOfMeasure uom = invDao.getUnitOfMeasure(materialUOM);

				try {
					user = (User)request.getSession().getAttribute("user");
				} catch (Exception e) {
					response.sendRedirect("/TrocQc/Login");
				}
		
			  RawMaterialCustomField rmcf1 = new RawMaterialCustomField(materialCustomFieldName1, materialCustomFieldValue1);
			  RawMaterialCustomField rmcf2 = new RawMaterialCustomField(materialCustomFieldName2, materialCustomFieldValue2);
			  RawMaterialCustomField rmcf3 = new RawMaterialCustomField(materialCustomFieldName3, materialCustomFieldValue3);
			  
			  List<RawMaterialCustomField> rmcfList = new ArrayList<RawMaterialCustomField>();
			  rmcfList.add(rmcf1);
			  rmcfList.add(rmcf2);
			  rmcfList.add(rmcf3);
			  
			  RawMaterial rawMaterial = new RawMaterial(materialName, materialCost, uom, materialQuantity, user.getId(), rmcfList);
			  
			  if (hiddenProdId > 0) {
				  rawMaterial.setId(hiddenProdId);
				  invDao.SaveRawMaterial(rawMaterial);
			  }
			  else {
				  invDao.AddRawMaterial(rawMaterial);
			  }
			  
			  response.sendRedirect("/TrocQc/Inventaire");

		  }
		  else if (request.getParameter("templateName") != null) {
			  String templateName = request.getParameter("templateName");
			  String templateSKU = request.getParameter("templateSKU");
			  String templateDesc = request.getParameter("templateDesc");
			  int templateUOM = Integer.parseInt(request.getParameter("templateUOM"));
			  int templateLQL = Integer.parseInt(request.getParameter("templateLQL")) ; 
			  
			  double templateCost = Double.parseDouble( request.getParameter("templateCost") ); 
			  double templatePrice = Double.parseDouble( request.getParameter("templatePrice") ); 
			  double templateMSRP = Double.parseDouble( request.getParameter("templateMSRP") ); 
			  
			  //String barcode = request.getParameter("barcode"); 
			  
			  //Custom fields
			  String newFieldName1 = request.getParameter("newFieldName1"); 
			  String newFieldValue1 = request.getParameter("newFieldValue1"); 
			  
			  String newFieldName2 = request.getParameter("newFieldName2"); 
			  String newFieldValue2 = request.getParameter("newFieldValue2"); 
			  
			  String newFieldName3 = request.getParameter("newFieldName3"); 
			  String newFieldValue3 = request.getParameter("newFieldValue3"); 
			  
			  
			  //Raw materials
			  int rawMaterialName1 = Integer.parseInt(request.getParameter("rawMaterialId1")) ; 
			  double rawMaterialQuantity1 = Double.parseDouble( request.getParameter("rawMaterialQuantity1") ); 
			  int rawMaterialUOM1 = Integer.parseInt( request.getParameter("rawMaterialUOM1") );
			  
			  
			  int rawMaterialName2 = Integer.parseInt(request.getParameter("rawMaterialId2")) ; 
			  double rawMaterialQuantity2 = Double.parseDouble( request.getParameter("rawMaterialQuantity2") ); 
			  int rawMaterialUOM2 = Integer.parseInt( request.getParameter("rawMaterialUOM2") );
			  
			  int rawMaterialName3 = Integer.parseInt(request.getParameter("rawMaterialId3")) ; 
			  double rawMaterialQuantity3 = Double.parseDouble( request.getParameter("rawMaterialQuantity3") ); 
			  int rawMaterialUOM3 = Integer.parseInt( request.getParameter("rawMaterialUOM3") );
			  
			  
			  //BUILDER
			  ProductCustomFields pcf = new ProductCustomFields(newFieldName1, newFieldValue1);
			  List<ProductCustomFields> pcfList = new ArrayList<ProductCustomFields>();
			  pcfList.add(pcf);
			  RawMaterial rm = invDao.getRawMaterial(rawMaterialName1);
			  List<RawMaterial> rmList = new ArrayList<RawMaterial>();
			  rmList.add(rm);
				try {
					user = (User)request.getSession().getAttribute("user");
				} catch (Exception e) {
					response.sendRedirect("/TrocQc/Login");
				}
			  
			  
			  Product.ProductBuilder pb = new Product.ProductBuilder(templateName, templateCost, templateMSRP ,templateSKU);
			  pb.description(templateDesc);
			  pb.idUnitOfMeasure(templateUOM);
			  pb.lowQuantityLevel(templateLQL);
			  pb.UserCustomFields(pcfList);
			  pb.RawMaterials(rmList);
			  pb.userID(user.getId());
			  Product newProduct = pb.build();
			  invDao.AddProduct(newProduct);
			  response.sendRedirect("/TrocQc/Inventaire");
		  }
		  else if (request.getParameter("productId") != null) {
			int prodId = Integer.parseInt(request.getParameter("productId"));
			double prodQuantity = Double.parseDouble(request.getParameter("productQuantity"));
			try {
				user = (User)request.getSession().getAttribute("user");
			} catch (Exception e) {
				response.sendRedirect("/TrocQc/Login");
			}
			
			Product prod = invDao.getProduct(prodId);

			Lot lot = new Lot(prodId, prodQuantity, prodQuantity, new java.sql.Date(System.currentTimeMillis()) );
			
			invDao.addLot(prod, prodQuantity);

			response.sendRedirect("/TrocQc/Inventaire");
			
		}
		  else if (request.getParameter("hiddenProdId") != null) {
			
			  
			  
			  
			  
			  
		}
		  
	  }
	
}
