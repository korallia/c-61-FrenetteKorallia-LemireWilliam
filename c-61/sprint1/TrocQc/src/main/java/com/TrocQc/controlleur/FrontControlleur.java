package com.TrocQc.controlleur;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.TrocQc.DAO.InventoryDao;
import com.TrocQc.Entity.Product;
import com.TrocQc.Entity.RawMaterial;
import com.TrocQc.Entity.RawMaterialProducts;
import com.TrocQc.Entity.User;



@Controller
public class FrontControlleur{
	
	
	@GetMapping("/Login")
	public String GetAuthentification(Model theModel) {
		
		return "login"; //return the view
	}
	
	@GetMapping("/Inscription")
	public String GetInscription(Model theModel) {
		 theModel.addAttribute("ProductCategorySet", User.ProductCategorySet);
		return "creercompte"; //return the view
	}
	@GetMapping("/Lobby")
	public String GetLobby(Model theModel) {
		 //theModel.addAttribute("ProductCategorySet", User.ProductCategorySet);
		return "lobby"; //return the view
	}
	
	
	
	@GetMapping("/test")
	public String Gettest(Model model) {
		model.addAttribute("test", 13);
		return "NewFile"; //return the view
	}
	
	@GetMapping("/Inventory")
	public String GetProducts(Model model) {

	InventoryDao inventorydao = new InventoryDao();
	RawMaterial rm = new RawMaterial();
	rm.setId(4);
	rm.setName("FROM FRONT CONTROLLER");
	rm.setCost(28.5);
	rm.setIdUnitOfMeasure(4);
	rm.setUserID(1);
	rm.setQuantity(228);
	//TODO add custom field
	inventorydao.AddRawMaterial(rm);
	
	Product p = new Product();
	p.setName("test from front controller");
	
	RawMaterialProducts rmp = new RawMaterialProducts();
	rmp.setRawmaterial(rm);
	rmp.setQuantity(2.4);
	
	List<RawMaterialProducts> list = new ArrayList() ;
	list.add(rmp);
	
	p.setRawmaterials(list);
	
	inventorydao.AddProduct(p);
	
	
	
	
	//int addedquantity = inventorydao.AddInventoryToProduct(inventorydao.getProduct(1), 10);
	//model.addAttribute("addedquantity", addedquantity );
	
		
	List<Product> products = inventorydao.getProductsOfUserId(1);
	List<RawMaterial> rawMaterial = inventorydao.getRawMaterialsOfUserId(1);
	
		model.addAttribute("test", 13);
		return "NewFile"; //return the view
	}
	
}
