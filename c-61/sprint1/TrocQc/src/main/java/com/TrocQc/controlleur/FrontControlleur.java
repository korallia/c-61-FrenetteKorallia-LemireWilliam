package com.TrocQc.controlleur;

import java.io.IOException;
import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.TrocQc.DAO.ConfigDao;
import com.TrocQc.DAO.FinanceDao;
import com.TrocQc.DAO.InventoryDao;
import com.TrocQc.DAO.LobbyDao;
import com.TrocQc.DAO.UserDao;
import com.TrocQc.DAO.VenteDao;
import com.TrocQc.Entity.ExcelInventoryReport;
import com.TrocQc.Entity.FinanceReport;
import com.TrocQc.Entity.Note;
//import com.TrocQc.DAO.InventoryDao;
import com.TrocQc.Entity.Product;
import com.TrocQc.Entity.ProductCustomFields;
import com.TrocQc.Entity.RawMaterial;
import com.TrocQc.Entity.RawMaterialsPerProduct;
import com.TrocQc.Entity.SalesPrediction;
import com.TrocQc.Entity.UnitOfMeasure;
import com.TrocQc.Entity.User;
import com.TrocQc.Utils.DatePoint;
import com.TrocQc.Utils.EmailSender;
import com.TrocQc.Utils.LinkedList;
import com.TrocQc.Utils.Point;
import com.TrocQc.Utils.Regression;
import com.TrocQc.Utils.EmailSender;



@Controller
public class FrontControlleur{	

	LobbyDao ld;
	InventoryDao inventorydao;
	
	
	@GetMapping("/Login")
	public String GetAuthentification(Model theModel, HttpSession  session) {
	    if (session!=null){
	        session.invalidate();
	    }
		
		return "login"; 
	}
	
	@GetMapping("/Inscription")
	public String GetInscription(Model theModel) {
		 theModel.addAttribute("ProductCategorySet", User.ProductCategorySet);
		return "creercompte"; 
	}
	@GetMapping("/Lobby")
	public String GetLobby(Model theModel,HttpSession session) {
		ld = new LobbyDao();
		User user = (User) session.getAttribute("user");
		if(user == null) {
			//https://stackoverflow.com/questions/21763321/change-url-in-spring-mvc
			return  "redirect:/Login";

		}
		List<Note> noteList = ld.getLobbyNotesByUserId(user.getId());
		theModel.addAttribute("noteList", noteList);
		return "lobby"; 
	}
	
	@GetMapping("/Inventaire")
	public String GetInventaire(Model theModel,HttpSession session) {

		User user = (User) session.getAttribute("user");
		if(user == null) {
			return  "redirect:/Login";
		}
		
		inventorydao = new InventoryDao(user.getId());
		List<RawMaterial> rmList = inventorydao.getRawMaterials();
		List<UnitOfMeasure> uomList = inventorydao.getUnitsOfMesure();
		List<Product> prodList = inventorydao.getProducts();
		theModel.addAttribute("rmList", rmList);
		theModel.addAttribute("uomList", uomList);
		theModel.addAttribute("prodList", prodList);
		return "inventaire"; 
	}
	
	@GetMapping("/Ventes")
	public String GetVentes(Model theModel, HttpSession session) {
		
		
		User user = (User) session.getAttribute("user");
		if(user == null) {
			return  "redirect:/Login";
		}
		inventorydao = new InventoryDao(user.getId());
		List<Product> prodList = inventorydao.getProducts();
		theModel.addAttribute("prodList", prodList);
		return "ventes"; 
	}
	
	@GetMapping("/Finances")
	public String GetFinances(Model theModel, HttpSession session, @RequestParam Map<String,String> params) {
		
		FinanceDao finDao = new FinanceDao(1);
		
		
		String startDateStr = "2022-11-26";
		String endDateStr = "2022-12-26";
		
		if (params.containsKey("startDate")) {
			startDateStr = params.get("startDate");
		}
		if (params.containsKey("endDate")) {
			endDateStr = params.get("endDate");
		}
		  
		
		Date startDate = java.sql.Date.valueOf(startDateStr);
		Date endDate = java.sql.Date.valueOf(endDateStr);
		
		
		String regModel = "---";
		
			// RANGE OF DATES
		SalesPrediction salesPrediction = new SalesPrediction(startDate, endDate);
		salesPrediction.setActualsales(finDao.GetDailySalesOfPeriod(startDate, endDate));
		LinkedList <DatePoint> dpList = salesPrediction.getDatedPredictions();
		LinkedList <DatePoint> salesList = finDao.GetDailySalesOfPeriodByDay(startDate, endDate);
		String [] xVals = new String[dpList.size()];
		String [] predVals = new String[dpList.size()];
		String [] salesVals = new String[dpList.size()];
		
		List<Map> values = new ArrayList<>();
		
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		regModel = salesPrediction.getRegression().getBestRegressionModel();
		
		Iterator<DatePoint> venteIterator = salesList.iterator();
		DatePoint nextvente = null;
		if ( venteIterator.hasNext()) {
			nextvente = (DatePoint) venteIterator.next();
		}
		
		double actual = 0;
		
		for (int i = 0; i < dpList.size(); i++) {
			DatePoint dp = dpList.get(i);
			if ( nextvente != null && nextvente.getDate().toString().compareTo(dp.getDate().toString()) ==0 ) {
				actual = nextvente.getValue();
				nextvente = (DatePoint) venteIterator.next();
			}
			else {
				actual  = 0;
			}
		
			
			Map<String, String> map = new HashMap<>();
			map.put("date",dp.getDate().toString());
			map.put("ventes",String.valueOf(actual));
			map.put("prediction",dp.getValue().toString());
			values.add(map);
			
				
			//salesVals[i] = ;
		}
		
		double productcost = finDao.GetProductCosts(startDate, endDate);
		double rawmaterialcost = finDao.GetRawMaterialCosts(startDate, endDate);
		double sales = finDao.GetTotalSalesOfPeriod(startDate, endDate);
		double profit = sales - ( productcost + rawmaterialcost);
		
		theModel.addAttribute("productcost", productcost);
		theModel.addAttribute("rawmaterialcost", rawmaterialcost);
		theModel.addAttribute("sales", sales);
		theModel.addAttribute("profit", profit);
		
		
		theModel.addAttribute("regModel", regModel);
		theModel.addAttribute("values", values);
		
		theModel.addAttribute("startDate",startDate.toString() );
		theModel.addAttribute("endDate",endDate.toString() );
		session.setAttribute("startDateSession", startDate.toString());
		session.setAttribute("endDateSession", endDate.toString());
		
		
		return "finances";
	}
	
	@GetMapping("/Configurations")
	public String GetConfigurations(Model theModel, HttpSession session) {
		
		User user = (User) session.getAttribute("user");
		if(user == null) {
			return  "redirect:/Login";
		}

		theModel.addAttribute("ProductCategorySet", User.ProductCategorySet);
		
		return "configurations";
	}
	
	@GetMapping("/logout")
	public String GetLogout(Model theModel, HttpSession session) {
		return "login";
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
		
		/*Date start = Date.valueOf("2022-11-01");
		
		SalesPrediction sp = new SalesPrediction(start );
		
		FinanceDao financedao = new FinanceDao( );
		sp.setActualsales( financedao.GetDailySalesOfPeriod(sp.getStartdate(), sp.getEnddate()));
		LinkedList<DatePoint> predictions = sp.getDatedPredictions();
		*/
		
		//ExcelInventoryReport report = new ExcelInventoryReport(1);
		//report.generateReport("C:\\Users\\koral\\Downloads\\test.xls");
		
		/*FinanceReport report = new FinanceReport(1);
		Date start = Date.valueOf("2022-11-26");
		Date end = Date.valueOf("2023-11-26");
		report.generateReport("C:\\Users\\koral\\Downloads\\test2.xls", start, end);
		*/
		
	//	EmailSender es = new EmailSender("koralliafrenette@gmail.com");
	//	es.sendemail("koralliafrenette01@gmail.com", "This is the first test", "This is the body of the first test");
		
		//CongifDao configdao = new CongifDao();
		//configdao.addSkuPattern(1, "test1");
		
		
		UserDao userdao = new UserDao();
		userdao.ResetUserPassword("test@gmail.com");
		
		//configdao.deleteSku(2);
		//configdao.modifySkuPattern(3, "test2");
		return "NewFile"; //return the view
	}
	


	

}
