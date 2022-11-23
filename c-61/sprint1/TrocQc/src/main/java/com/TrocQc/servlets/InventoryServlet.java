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
			  int materialLQN = Integer.parseInt(request.getParameter("materialLQN"));
			  double materialCost = Double.parseDouble(request.getParameter("materialCost"));
			  
			  //Customfields
			  String materialCustomFieldName1 = request.getParameter("materialNewFieldName1");
			  String materialCustomFieldValue1 = request.getParameter("materialNewFieldValue1");
			  
			  System.out.print("UNIT OF MEASURE: " + materialUOM);
			  
			  UnitOfMeasure uom = invDao.getUnitOfMeasure(4);
			  //UnitOfMeasure uom = new UnitOfMeasure();
			  User user = (User)request.getSession().getAttribute("user");
			  
			  RawMaterialCustomField rmcf = new RawMaterialCustomField(materialCustomFieldName1, materialCustomFieldValue1, user.getId());
			  
			  
			  
			  List<RawMaterialCustomField> rmcfList = new ArrayList<RawMaterialCustomField>();
			  rmcfList.add(rmcf);
			  
			  RawMaterial rawMaterial = new RawMaterial(materialName, materialCost, uom, materialQuantity, user.getId(), rmcfList);
			  
			  invDao.AddRawMaterial(rawMaterial);
			  
			  response.sendRedirect("/TrocQc/Inventaire");
			  
		  }
		  
	  }
	
	
}
