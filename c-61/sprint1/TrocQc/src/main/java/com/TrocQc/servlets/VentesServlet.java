package com.TrocQc.servlets;

// Class VentesServlet
// Auteur: William Lemire
// Équipe: William et Korallia 
// Servlet gérant les ventes

import com.TrocQc.Entity.Vente;
import com.TrocQc.DAO.VenteDao;
import com.TrocQc.DAO.InventoryDao;
import com.TrocQc.Entity.Product;
import com.TrocQc.Entity.User;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ventesServlet")
public class VentesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	User user;
	
    public VentesServlet() {
        super();
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		try {
			user = (User)request.getSession().getAttribute("user");
		} catch (Exception e) {
			response.sendRedirect("/TrocQc/Login");
		}

		VenteDao vd = new VenteDao();
		InventoryDao invDao = new InventoryDao(user.getId());
		
		int prodId = Integer.parseInt(request.getParameter("productId"));

		String custName = request.getParameter("customerName");
		double quantity = Double.parseDouble(request.getParameter("soldProductQuantity"));
		Product prod = invDao.getProduct(prodId);
		Vente vente = new Vente(custName, prod, quantity, new java.sql.Date(System.currentTimeMillis()), user.getId());
		
		vd.addVente(vente);
		
		response.sendRedirect("/TrocQc/Ventes");
		
		
	}

}
