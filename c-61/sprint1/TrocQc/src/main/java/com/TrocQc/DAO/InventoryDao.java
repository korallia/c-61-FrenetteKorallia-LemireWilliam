package com.TrocQc.DAO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.TrocQc.config.SpringJdbcConfig;
import com.TrocQc.Entity.Product;
import com.TrocQc.Entity.RawMaterial;
import com.TrocQc.Entity.UnitOfMeasure;
import com.TrocQc.Entity.User;

public class InventoryDao extends SpringJdbcConfig{
 //TODO: GET ALL products for a specific user
//TODO get all raw materials specific by a product id and an user id
//TODO: Create product from template(insert product passed in parameters => check if avaible rawMaterial, when added subscrat the rawMateiral linked to product from the reserve of freeRawMaterial in the table
//TODO: Create new CustomFields (create an object  for the custom field and add it than add the field to the linked table)
	
	public List<Product> getProducts() {
		try {
			
			Map<String, String> params = new HashMap<>();
			List<Product> products = namedParameterJdbcTemplate().query("select * from product", params , BeanPropertyRowMapper.newInstance(Product.class));

			if ( products != null && !products.isEmpty()) {
				for( int i=0; i< products.size(); i++){
					if ( products.get(i).getIdUnitOfMeasure() > 0) {
						products.get(i).setUnitofmeasure(this.getUnitOfMeasure(products.get(i).getIdUnitOfMeasure()));
					}
				}
			}
			return products;
			
		}catch(Exception e ) {
			return null;
		}
	}
	
	public List<RawMaterial> getRawMaterials() {
		try {
			
			Map<String, String> params = new HashMap<>();
			List<RawMaterial> rawmaterials = namedParameterJdbcTemplate().query("select * from rawmaterial", params , BeanPropertyRowMapper.newInstance(RawMaterial.class));

			if ( rawmaterials != null && !rawmaterials.isEmpty()) {
				for( int i=0; i< rawmaterials.size(); i++){
					if ( rawmaterials.get(i).getIdUnitOfMeasure() > 0) {
						rawmaterials.get(i).setUnitofmeasure(this.getUnitOfMeasure(rawmaterials.get(i).getIdUnitOfMeasure()));
					}
				}
			}
			return rawmaterials;
			
		}catch(Exception e ) {
			return null;
		}
	}
	
	public List<Product> getProductsOfUserId(int userid) {
		try {
			
			Map<String, String> params = new HashMap<>();
			params.put("userid", Integer.toString(userid) );
			List<Product> products = namedParameterJdbcTemplate().query("select * from product WHERE userid=:userid", params , BeanPropertyRowMapper.newInstance(Product.class));

			if ( products != null && !products.isEmpty()) {
				for( int i=0; i< products.size(); i++){
					if ( products.get(i).getIdUnitOfMeasure() > 0) {
						products.get(i).setUnitofmeasure(this.getUnitOfMeasure(products.get(i).getIdUnitOfMeasure()));
					}
				}
			}
			return products;
			
		}catch(Exception e ) {
			return null;
		}
	}
	
	public List<RawMaterial> getRawMaterialsOfUserId(int userid) {
		try {
			
			Map<String, String> params = new HashMap<>();
			params.put("userid", Integer.toString(userid) );
			List<RawMaterial> rawmaterials = namedParameterJdbcTemplate().query("select * from rawmaterial WHERE userid=:userid", params , BeanPropertyRowMapper.newInstance(RawMaterial.class));

			if ( rawmaterials != null && !rawmaterials.isEmpty()) {
				for( int i=0; i< rawmaterials.size(); i++){
					if ( rawmaterials.get(i).getIdUnitOfMeasure() > 0) {
						rawmaterials.get(i).setUnitofmeasure(this.getUnitOfMeasure(rawmaterials.get(i).getIdUnitOfMeasure()));
					}
				}
			}
			return rawmaterials;
			
		}catch(Exception e ) {
			return null;
		}
	}

	
	
	public Product getProduct(int id) {
		String sql = "Select * From product where id=:id";
		
		Map<String, String> params = new HashMap<>();
		params.put("id", Integer.toString(id) );
				
		try {
			Product product = (Product) namedParameterJdbcTemplate().queryForObject(sql, params,BeanPropertyRowMapper.newInstance(Product.class));
				
		if(product  != null) {
			if ( product.getIdUnitOfMeasure() > 0) {
				product.setUnitofmeasure(this.getUnitOfMeasure(product.getIdUnitOfMeasure()));
			}
			return product ;
		}
		
		else {return null;}
		}catch(Exception e ) {
			return null;
		}
	}
	public RawMaterial getRawMaterial(int id) {
		String sql = "Select * From rawmaterial where id=:id";
		
		Map<String, String> params = new HashMap<>();
		params.put("id", Integer.toString(id) );
				
		try {
			RawMaterial rawmaterial= (RawMaterial) namedParameterJdbcTemplate().queryForObject(sql, params,BeanPropertyRowMapper.newInstance(RawMaterial.class));
				
		if(rawmaterial  != null) {
			if ( rawmaterial.getIdUnitOfMeasure() > 0) {
				rawmaterial.setUnitofmeasure(this.getUnitOfMeasure(rawmaterial.getIdUnitOfMeasure()));
			}
			return rawmaterial ;
		}
		
		else {return null;}
		}catch(Exception e ) {
			return null;
		}
	}
	
	
	public UnitOfMeasure getUnitOfMeasure(int id) {
		String sql = "Select * From UnitOfMeasure where id=:id";
		
		Map<String, String> params = new HashMap<>();
		params.put("id", Integer.toString(id) );
				
		try {
			UnitOfMeasure unitofmeasure = (UnitOfMeasure) namedParameterJdbcTemplate().queryForObject(sql, params,BeanPropertyRowMapper.newInstance(UnitOfMeasure.class));
				
		if(unitofmeasure != null) {return unitofmeasure;}
		
		else {return null;}
		}catch(Exception e ) {
			return null;
		}
		
	}
	
	
//----------------VUE--------------:
//Check low quantity (Different color)
//Form to create custom field value(servlet (creation de l'objet => passer au dao ou faire get mapping si le switch de page devient un problème)
//hable to show the list of products (one page) and the list of raw materials(another page) =toggle
//Form to create template(servlet => passer au dao ou faire get mapping si le switch de page devient un problème)

	
	
	
}
