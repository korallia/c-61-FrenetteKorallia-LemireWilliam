package com.TrocQc.controlleur;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.TrocQc.DAO.InventoryDao;
import com.TrocQc.Entity.Product;
import com.TrocQc.Entity.User;



@Controller
public class FrontControlleur{
	
	@Autowired 
	InventoryDao inventorydao;
	
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
	List<Product> products = inventorydao.getProducts();
		model.addAttribute("test", 13);
		return "NewFile"; //return the view
	}
	
}
