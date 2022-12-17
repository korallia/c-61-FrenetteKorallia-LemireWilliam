package com.TrocQc.controlleur;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.TrocQc.DAO.CongifDao;
import com.TrocQc.DAO.FinanceDao;
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
import com.TrocQc.Utils.LinkedList;
import com.TrocQc.Utils.Point;
import com.TrocQc.Utils.Regression;



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
		List<Product> productlist = inventorydao.getProductsOfUserId(user.getId());
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
	
	@GetMapping("/Configurations")
	public String GetConfigurations(Model theModel, HttpSession session) {
		
		User user = (User) session.getAttribute("user");
		if(user == null) {
			return  "redirect:/Login";
		}
		 InventoryDao     inventorydao = new InventoryDao();
		List<Product> prodList = inventorydao.getProductsOfUserId(user.getId());
		List<ProductCustomFields> productCustomFieldsList = new ArrayList<>();
		for (int i =0; i<prodList.size();i++) {
			Product product = prodList.get(i);
			if (product.getUserCustomFields().size()!=0) {
				for (int j =0; j<prodList.size();j++) {
				//productCustomFieldsList.add(product.getUserCustomFields())
			}
				
		}
		theModel.addAttribute("prodList", prodList);
		}		
		
		 theModel.addAttribute("ProductCategorySet", User.ProductCategorySet);
		
		return "configurations";
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
		
		/*
		FinanceDao financedao = new FinanceDao();
		
		LinkedList<Point> dailysales = financedao.GetDailySales();
		
		
		Regression r = new Regression(dailysales);
		
		LinkedList<Point> linear = r.getLinearPredictions();
		LinkedList<Point> log = r.getLogPredictions();
		LinkedList<Point> exponential = r.getExponentialPredictions();
		
		double r2l = r.getR2(linear);
		double r2log = r.getR2(log);
		double r2e = r.getR2(exponential);
		
		if ( r2l > r2log) {
			model.addAttribute("method", "linear" );
		}
		else if ( r2log > r2e) {
			model.addAttribute("method", "log" );
		}
		else {
			model.addAttribute("method", "exponential" );
		}
		
		
		
		
		Iterator<Point> it = dailysales.iterator();
		
		
		
		
		while ( it.hasNext()) {
			Point p = it.next();
			model.addAttribute("p"+ p.getX(), p.getY());
			
			
		}
		
		
		/*InventoryDao inventorydao = new InventoryDao();
		
		Product p7 = inventorydao.getProduct(7);*/
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

	//	Product p = inventorydao.getProduct(7);
		
		//VenteDao ventedao = new VenteDao();
		//ventedao.addVente(p, 10, 1);

		
		/*		 
		RawMaterial r = new RawMaterial();
		r.setName("Belle chaise2");
		r.setIdUnitOfMeasure(4);
		//r.getUserCustomFields().get(0).setFieldvalue("apple");
		inventorydao.AddRawMaterial(r);
		
		
		
		model.addAttribute("test", 13);
		*/
		
		CongifDao configdao = new CongifDao();
		configdao.addSkuPattern(1, "test1");
		//configdao.deleteSku(2);
		//configdao.modifySkuPattern(3, "test2");
		return "NewFile"; //return the view
	}
	


	

}
