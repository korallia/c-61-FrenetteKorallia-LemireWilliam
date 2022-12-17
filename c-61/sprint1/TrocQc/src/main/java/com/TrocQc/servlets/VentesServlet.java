package com.TrocQc.servlets;

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
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    /*
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		VenteDao vd = new VenteDao();
		InventoryDao invDao = new InventoryDao();
		
		try {
			user = (User)request.getSession().getAttribute("user");
		} catch (Exception e) {
			response.sendRedirect("/TrocQc/Login");
		}
		
		int prodId = Integer.parseInt(request.getParameter("productId"));
		InventoryDao inventorydao = new InventoryDao();
		Product p = inventorydao.getProduct(prodId);
		String custName = request.getParameter("customerName");
		double quantity = Double.parseDouble(request.getParameter("soldProductQuantity"));
		
		Product prod = invDao.getProduct(prodId);
		Vente vente = new Vente(prod, quantity, new java.sql.Date(System.currentTimeMillis()), user.getId());
		
		
		vd.addVente(vente);
		
		response.sendRedirect("/TrocQc/Ventes");
		
		
	}

}
