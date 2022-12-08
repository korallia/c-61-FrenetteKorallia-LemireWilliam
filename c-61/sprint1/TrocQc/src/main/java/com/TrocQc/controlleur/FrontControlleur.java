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
import com.TrocQc.DAO.VenteDao;
import com.TrocQc.Entity.Note;
//import com.TrocQc.DAO.InventoryDao;
import com.TrocQc.Entity.Product;
import com.TrocQc.Entity.ProductCustomFields;
import com.TrocQc.Entity.RawMaterial;
import com.TrocQc.Entity.RawMaterialsPerProduct;
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
		List<Product> prodList = inventorydao.getProductsOfUserId(user.getId());
		theModel.addAttribute("rmList", rmList);
		theModel.addAttribute("uomList", uomList);
		theModel.addAttribute("prodList", prodList);
		return "inventaire"; //return the view
	}
	
	@GetMapping("/Ventes")
	public String GetVentes(Model theModel, HttpSession session) {
		
		inventorydao = new InventoryDao();
		User user = (User) session.getAttribute("user");
		if(user == null) {
			return  "redirect:/Login";
		}
		
		
		List<Product> prodList = inventorydao.getProductsOfUserId(user.getId());
		theModel.addAttribute("prodList", prodList);
		return "ventes"; //return the view
	}
	
	@GetMapping("/Finances")
	public String GetFinances(Model theModel, HttpSession session) {
		
		return "finances";
	}
	
	
	@GetMapping("/test")
	public String Gettest(Model model) {
		/*
		Product p = new Product();
		p.setCost(28);
		p.setDescription("This is a test");
		p.setIdUnitOfMeasure(4);
		p.setSku("123");
		p.setMsrp(128);
		p.setLowQuantityLevel(18);
		p.setName("Test from Front");
		p.setQRcode("12345");
		p.setUserID(1);
		
		ProductCustomFields pcf = new ProductCustomFields(0, "Custom", "value");
		ProductCustomFields pcf2 = new ProductCustomFields(0, "Custom2", "value2");
		List<ProductCustomFields > pcflist = new ArrayList();
		pcflist.add(pcf);
		pcflist.add(pcf2);
		
		p.setUserCustomFields(pcflist);
		
		RawMaterialsPerProduct rmp1 = new RawMaterialsPerProduct();
		rmp1.setQuantity(2);
		rmp1.setRawmaterialid(1);
		List<RawMaterialsPerProduct> rmplist = new ArrayList();
		rmplist.add(rmp1);
		p.setRawmaterials(rmplist);
	*/
		
		
		
		InventoryDao inventorydao = new InventoryDao();
		
		Product p7 = inventorydao.getProduct(7);
		//inventorydao.addLot(p7, 10);
		
		/*
		p7.setCost(14);
		p7.setDescription("New description");
		p7.setIdUnitOfMeasure(5);
		p7.setLowQuantityLevel(1);
		p7.setName("New name");
		p7.setQRcode("New QR code");
		p7.setMsrp(256);
		inventorydao.SaveProduct(p7);		
		
*/
		
		//RawMaterial r = inventorydao.getRawMaterial(5);
//		in//ventorydao.deleteRawMaterial(r);

		Product p = inventorydao.getProduct(7);
		
		VenteDao ventedao = new VenteDao();
		ventedao.addVente(p, 10, 1);

		
		/*
		r.setName("Belle chaise");
		r.getUserCustomFields().get(0).setFieldvalue("apple");
		inventorydao.SaveRawMaterial(r);
		*/
		model.addAttribute("test", 13);
		return "NewFile"; //return the view
	}
	


	

}
