package com.TrocQc.controlleur;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.TrocQc.DAO.InventoryDao;
import com.TrocQc.DAO.LobbyDao;
import com.TrocQc.Entity.Note;
//import com.TrocQc.DAO.InventoryDao;
import com.TrocQc.Entity.Product;
import com.TrocQc.Entity.RawMaterial;
import com.TrocQc.Entity.RawMaterialProducts;
import com.TrocQc.Entity.UnitOfMeasure;
import com.TrocQc.Entity.User;



@Controller
public class FrontControlleur{	

	LobbyDao ld;
	
	InventoryDao inventorydao;
	
	@GetMapping("/Login")
	public String GetAuthentification(Model theModel, HttpSession  session) {
		

			    if (session!=null){
			        session.invalidate();
			    }
		
		return "login"; //return the view
	}
	
	@GetMapping("/Inscription")
	public String GetInscription(Model theModel) {
		 theModel.addAttribute("ProductCategorySet", User.ProductCategorySet);
		return "creercompte"; //return the view
	}
	@GetMapping("/Lobby")
	public String GetLobby(Model theModel,HttpSession session) {
		 //theModel.addAttribute("ProductCategorySet", User.ProductCategorySet);
		//Get all notes from DAO
		ld = new LobbyDao();
		User user = (User) session.getAttribute("user");
		if(user == null) {
			//https://stackoverflow.com/questions/21763321/change-url-in-spring-mvc
			return  "redirect:/Login";
			
			
		}
		List<Note> noteList = ld.getLobbyNotesByUserId(user.getId());
		theModel.addAttribute("noteList", noteList);
		return "lobby"; //return the view
	}
	
	@GetMapping("/Inventaire")
	public String GetInventaire(Model theModel,HttpSession session) {
  	//List<Product> products = inventorydao.getProducts();
		inventorydao = new InventoryDao();
		User user = (User) session.getAttribute("user");
		if(user == null) {
			return  "redirect:/Login";
		}
		List<RawMaterial> rmList = inventorydao.getRawMaterialsOfUserId(user.getId());
		List<UnitOfMeasure> uomList = inventorydao.getUnitsOfMesure();
		theModel.addAttribute("rmList", rmList);
		theModel.addAttribute("uomList", uomList);
		return "inventaire"; //return the view
	}
	
	
	
	@GetMapping("/test")
	public String Gettest(Model model) {
		model.addAttribute("test", 13);
		return "NewFile"; //return the view
	}
	


	

}
