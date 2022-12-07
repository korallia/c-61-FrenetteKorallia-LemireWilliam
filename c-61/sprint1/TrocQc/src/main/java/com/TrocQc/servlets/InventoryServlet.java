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
import com.TrocQc.Entity.Product;
import com.TrocQc.Entity.Product.ProductBuilder;
import com.TrocQc.Entity.RawMaterial;
import com.TrocQc.Entity.UnitOfMeasure;
import com.TrocQc.Entity.User;

import java.util.List;

@WebServlet("/inventoryServlet")
public class InventoryServlet extends HttpServlet {
	
	public InventoryServlet( ) {
		super();
	}
	
	  protected void doPost(HttpServletRequest request,
		        HttpServletResponse response) throws ServletException, IOException {
		  
		  InventoryDao invDao = new InventoryDao();
		  
		  
		  if (request.getParameter("materialName") != null) {
			  
			  String materialName = request.getParameter("materialName");
			  double materialQuantity = Double.parseDouble(request.getParameter("materialQuantity"));
			  int materialUOM = Integer.parseInt(request.getParameter("materialUOM"));
			  double materialLQN = Double.parseDouble(request.getParameter("materialLQN"));
			  double materialCost = Double.parseDouble(request.getParameter("materialCost"));
			  
			  //Customfields
			  String materialCustomFieldName1 = request.getParameter("materialNewFieldName1");
			  String materialCustomFieldValue1 = request.getParameter("materialNewFieldValue1");
			  
			  System.out.print("UNIT OF MEASURE: " + materialUOM);
			  
			  UnitOfMeasure uom = invDao.getUnitOfMeasure(materialUOM);
			  //UnitOfMeasure uom = new UnitOfMeasure();
			  User user = (User)request.getSession().getAttribute("user");
			  
			  RawMaterialCustomField rmcf = new RawMaterialCustomField(materialCustomFieldName1, materialCustomFieldValue1);
			  
			  List<RawMaterialCustomField> rmcfList = new ArrayList<RawMaterialCustomField>();
			  rmcfList.add(rmcf);
			  
			  RawMaterial rawMaterial = new RawMaterial(materialName, materialCost, uom, materialQuantity, user.getId(), rmcfList);
			  
			  invDao.AddRawMaterial(rawMaterial);
			  
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
			  //String newFieldUnit1 = request.getParameter("newFieldUnit1");
			  
			  //Raw materials
			  int rawMaterialName1 = Integer.parseInt(request.getParameter("rawMaterialId")) ; 
			  double rawMaterialQuantity1 = Double.parseDouble( request.getParameter("rawMaterialQuantity1") ); 
			  int rawMaterialUOM1 = Integer.parseInt( request.getParameter("rawMaterialUOM1") );
			  
			  //BUILDER
			  ProductCustomFields pcf = new ProductCustomFields(newFieldName1, newFieldValue1);
			  List<ProductCustomFields> pcfList = new ArrayList<ProductCustomFields>();
			  RawMaterial rm = invDao.getRawMaterial(rawMaterialUOM1);
			  User user = (User)request.getSession().getAttribute("user");
			  
			  
			  Product.ProductBuilder pb = new Product.ProductBuilder(templateName, templateCost, templateMSRP ,templateSKU);
			  pb.description(templateDesc);
			  pb.idUnitOfMeasure(templateUOM);
			  pb.lowQuantityLevel(templateLQL);
			  pb.UserCustomFields(pcfList);
			  pb.userID(user.getId());
			  Product newProduct = pb.build();
			  invDao.AddProduct(newProduct);
			  response.sendRedirect("/TrocQc/Inventaire");
			  
		  }
		  
	  }
	
	
}
