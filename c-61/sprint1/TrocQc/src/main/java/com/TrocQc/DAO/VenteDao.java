package com.TrocQc.DAO;

import java.sql.Date;
import java.sql.Time;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.Map;

import org.springframework.jdbc.core.simple.SimpleJdbcInsert;

import com.TrocQc.Entity.Product;
import com.TrocQc.Entity.User;
import com.TrocQc.Entity.Vente;
import com.TrocQc.config.SpringJdbcConfig;

public class VenteDao extends SpringJdbcConfig{

	
	public Vente addVente(Vente vente ) {
		
		InventoryDao inventorydao = new InventoryDao();
		Product product =  inventorydao.getProduct(vente.getProductid());
		if ( product != null) {
			
			if ( product.getAvailableQuantity() < vente.getQuantity()) {
				return null;
			}
			
			if ( product.reduceInventory(vente.getQuantity())) {
				SaveProductLots(product);
				
				SimpleJdbcInsert simpleJdbcInsert = new SimpleJdbcInsert(mysqlDataSource()).withTableName("vente").usingGeneratedKeyColumns("id");
				
				Map<String, Object> parameters = new HashMap<>();
				
				parameters.put("productid", vente.getProductid());
				parameters.put("quantity", vente.getQuantity());
				parameters.put("userId", vente.getUserID());
				parameters.put("ventedate", vente.getVentedate());
				Number id = simpleJdbcInsert.executeAndReturnKey(parameters);
				vente.setId(id.intValue());
			}
			
			
		}
		
		return vente;
	}
	
	public Vente addVente(Product product, double Quantity, int userid ) {
		
		Date date = new java.sql.Date(System.currentTimeMillis());
		Vente vente = new Vente(product.getId(), (double)Quantity, date  );
		vente.setUserID(userid);
		
		
		return addVente(vente);
		
		
	}
	private void SaveProductLots(Product product) {
		
		for( int i = 0; i < product.getLots().size(); i++) {
			
			jdbcTemplate().update("UPDATE lot SET availableQuantity=? WHERE id=?",product.getLots().get(i).getAvailablequantity(), product.getLots().get(i).getId());
		}
		
	}
	
}
