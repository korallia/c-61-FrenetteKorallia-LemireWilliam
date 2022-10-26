package com.TrocQc.controlleur;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;



@Controller
public class FrontControlleur{
	
	@GetMapping("/Login")
	public String GetAuthentification(Model theModel) {
		
		return "login"; //return the view
	}
	
	@GetMapping("/Inscription")
	public String GetInscription(Model theModel) {
		
		return "creercompte"; //return the view
	}
	
}
