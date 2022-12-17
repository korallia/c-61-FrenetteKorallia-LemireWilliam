package com.TrocQc.DAO;

import java.util.ArrayList;
import java.util.HashMap;

import java.util.List;
import java.util.Map;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.core.simple.SimpleJdbcInsert;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.TrocQc.config.SpringJdbcConfig;
import com.TrocQc.Entity.Lot;
import com.TrocQc.Entity.Product;
import com.TrocQc.Entity.ProductCustomFields;
import com.TrocQc.Entity.RawMaterial;
import com.TrocQc.Entity.RawMaterialCustomField;
import com.TrocQc.Entity.RawMaterialsPerProduct;
import com.TrocQc.Entity.UnitOfMeasure;
import com.TrocQc.Entity.User;

@Repository
public class InventoryDao extends SpringJdbcConfig {
	// TODO: GET ALL products for a specific user
//TODO get all raw materials specific by a product id and an user id
//TODO: Create product from template(insert product passed in parameters => check if avaible rawMaterial, when added subscrat the rawMateiral linked to product from the reserve of freeRawMaterial in the table
//TODO: Create new CustomFields (create an object  for the custom field and add it than add the field to the linked table)

	// constructor
	public InventoryDao() {
		super();
	}

	public List<UnitOfMeasure> getUnitsOfMesure() {

		return jdbcTemplate().query("Select * From unitofmeasure",
				BeanPropertyRowMapper.newInstance(UnitOfMeasure.class));

	}

	public List<Product> getProducts() {
		try {

			Map<String, String> params = new HashMap<>();
			List<Product> products = namedParameterJdbcTemplate().query("select * from product", params,
					BeanPropertyRowMapper.newInstance(Product.class));

			if (products != null && !products.isEmpty()) {
				for (int i = 0; i < products.size(); i++) {
					if (products.get(i).getIdUnitOfMeasure() > 0) {
						products.get(i).setUnitofmeasure(this.getUnitOfMeasure(products.get(i).getIdUnitOfMeasure()));

					}

					products.get(i).setUserCustomFields(this.getProductCustomField(products.get(i).getId()) );
					products.get(i).setRawmaterials(this.getrawmaterialperproduct(products.get(i).getId()));
					products.get(i).setLots(this.getLotsFromProduct(products.get(i).getId()));
				}
			}
			return products;

		} catch (Exception e) {
			return null;
		}
	}

	public List<RawMaterial> getRawMaterials() {
		try {

			Map<String, String> params = new HashMap<>();
			List<RawMaterial> rawmaterials = namedParameterJdbcTemplate().query("select * from rawmaterial", params,
					BeanPropertyRowMapper.newInstance(RawMaterial.class));

			if ( rawmaterials != null && !rawmaterials.isEmpty()) {
				for( int i=0; i< rawmaterials.size(); i++){
					if ( rawmaterials.get(i).getIdUnitOfMeasure() > 0) {
						rawmaterials.get(i).setUnitofmeasure(this.getUnitOfMeasure(rawmaterials.get(i).getIdUnitOfMeasure()));
						rawmaterials.get(i).setUserCustomFields(this.getRawMaterialCustomField(rawmaterials.get(i).getId()) );

					}

				}
			}
			return rawmaterials;

		} catch (Exception e) {
			return null;
		}
	}

	public List<Product> getProductsOfUserId(int userid) {
		try {

			Map<String, String> params = new HashMap<>();
			params.put("userid", Integer.toString(userid));
			List<Product> products = namedParameterJdbcTemplate().query("select * from product WHERE userid=:userid",
					params, BeanPropertyRowMapper.newInstance(Product.class));

			if (products != null && !products.isEmpty()) {
				for (int i = 0; i < products.size(); i++) {
					if (products.get(i).getIdUnitOfMeasure() > 0) {
						products.get(i).setUnitofmeasure(this.getUnitOfMeasure(products.get(i).getIdUnitOfMeasure()));

					}

					products.get(i).setUserCustomFields(this.getProductCustomField(products.get(i).getId()) );
					products.get(i).setRawmaterials(this.getrawmaterialperproduct(products.get(i).getId()));
					products.get(i).setLots(this.getLotsFromProduct(products.get(i).getId()));
				}
			}
			return products;

		} catch (Exception e) {
			return null;
		}
	}

	public List<RawMaterial> getRawMaterialsOfUserId(int userid) {
		try {

			Map<String, Object> params = new HashMap<>();
			params.put("idUser", userid);
			List<RawMaterial> rawmaterials = namedParameterJdbcTemplate().query(
					"select * from rawmaterial WHERE idUser=:idUser", params,
					BeanPropertyRowMapper.newInstance(RawMaterial.class));

			if (rawmaterials != null && !rawmaterials.isEmpty()) {
				for (int i = 0; i < rawmaterials.size(); i++) {
					if (rawmaterials.get(i).getIdUnitOfMeasure() > 0) {
						rawmaterials.get(i)
								.setUnitofmeasure(this.getUnitOfMeasure(rawmaterials.get(i).getIdUnitOfMeasure()));
					}


					rawmaterials.get(i).setUserCustomFields(this.getRawMaterialCustomField(rawmaterials.get(i).getId()) );

				}
			}
			return rawmaterials;

		} catch (Exception e) {
			return null;
		}
	}

	public List<ProductCustomFields> getProductCustomField(int productid) {
		try {

			Map<String, String> params = new HashMap<>();
			params.put("productid", Integer.toString(productid));
			List<ProductCustomFields> productcustomfields = namedParameterJdbcTemplate().query(
					"select * from productcustomfields WHERE productid=:productid", params,
					BeanPropertyRowMapper.newInstance(ProductCustomFields.class));
			return productcustomfields;

		} catch (Exception e) {
			return null;
		}
	}

	public ProductCustomFields getNamedProductCustomField(int productid, String name) {
		try {

			Map<String, String> params = new HashMap<>();
			params.put("productid", Integer.toString(productid));
			params.put("name", name);
			ProductCustomFields productcustomfield = namedParameterJdbcTemplate().queryForObject(
					"select * from ProductCustomFields WHERE productid=:productid AND fieldtypeName=:name LIMIT 1",
					params, BeanPropertyRowMapper.newInstance(ProductCustomFields.class));
			return productcustomfield;

		} catch (Exception e) {
			return null;
		}
	}

	public Product getProduct(int id) {
		String sql = "Select * From product where id=:id";

		Map<String, String> params = new HashMap<>();
		params.put("id", Integer.toString(id));

		try {
			Product product = (Product) namedParameterJdbcTemplate().queryForObject(sql, params,
					BeanPropertyRowMapper.newInstance(Product.class));

			if (product != null) {
				if (product.getIdUnitOfMeasure() > 0) {
					product.setUnitofmeasure(this.getUnitOfMeasure(product.getIdUnitOfMeasure()));

				}
				product.setUserCustomFields(this.getProductCustomField(product.getId()));
				product.setRawmaterials(this.getrawmaterialperproduct(product.getId()));
				product.setLots(this.getLotsFromProduct(product.getId()));
				return product;
			}

			else {
				return null;
			}
		} catch (Exception e) {
			return null;
		}
	}

	public int GetAvailableQuantityPerProduct(int productid) {
		String sql = "Select sum(availablequantity) as qty From lot where productid=:productid";
		Map<String, Object> params = new HashMap<>();
		params.put("productid", productid);
		try {

			int qty = (int) namedParameterJdbcTemplate().queryForObject(sql, params,
					BeanPropertyRowMapper.newInstance(int.class));
			return qty;

		} catch (Exception e) {
			return 0;
		}
	}

	public List<RawMaterialsPerProduct> getrawmaterialperproduct(int productid) {
		String sql = "Select * From rawmaterialperproduct where productid=:productid";

		Map<String, Object> params = new HashMap<>();
		params.put("productid", productid);

		try {
			List<RawMaterialsPerProduct> rawmaterialproducts = namedParameterJdbcTemplate().query(sql, params,
					BeanPropertyRowMapper.newInstance(RawMaterialsPerProduct.class));

			if (rawmaterialproducts != null && !rawmaterialproducts.isEmpty()) {
				for (int i = 0; i < rawmaterialproducts.size(); i++) {
					if (rawmaterialproducts.get(i).getRawmaterialid() > 0) {
						rawmaterialproducts.get(i)
								.setRawmaterial(this.getRawMaterial(rawmaterialproducts.get(i).getRawmaterialid()));
					}
				}
			}
			return rawmaterialproducts;

		} catch (Exception e) {
			return null;
		}
	}

	public RawMaterialsPerProduct getrawmaterialperproductAndRawMaterial(int productid, int rawmaterialid) {
		String sql = "Select * From rawmaterialperproduct where productid=:productid AND rawmaterialid=:rawmaterialid";

		Map<String, Object> params = new HashMap<>();
		params.put("productid", productid);
		params.put("rawmaterialid", rawmaterialid);

		try {
			RawMaterialsPerProduct rawmaterialproduct = namedParameterJdbcTemplate().queryForObject(sql, params,
					BeanPropertyRowMapper.newInstance(RawMaterialsPerProduct.class));

			if (rawmaterialproduct != null) {
				rawmaterialproduct.setRawmaterial(this.getRawMaterial(rawmaterialproduct.getRawmaterialid()));

			}
			return rawmaterialproduct;

		} catch (Exception e) {
			return null;
		}
	}

	public RawMaterial getRawMaterial(int id) {
		String sql = "Select * From rawmaterial where id=:id";

		Map<String, String> params = new HashMap<>();
		params.put("id", Integer.toString(id));

		try {
			RawMaterial rawmaterial = (RawMaterial) namedParameterJdbcTemplate().queryForObject(sql, params,
					BeanPropertyRowMapper.newInstance(RawMaterial.class));

			if (rawmaterial != null) {
				if (rawmaterial.getIdUnitOfMeasure() > 0) {
					rawmaterial.setUnitofmeasure(this.getUnitOfMeasure(rawmaterial.getIdUnitOfMeasure()));

				}
				rawmaterial.setUserCustomFields(this.getRawMaterialCustomField(id));
				return rawmaterial;
			}

			else {
				return null;
			}
		} catch (Exception e) {
			return null;
		}
	}

	public List<RawMaterialCustomField> getRawMaterialCustomField(int rawmaterialid) {
		try {

			Map<String, String> params = new HashMap<>();
			params.put("rawMaterialid", Integer.toString(rawmaterialid));
			List<RawMaterialCustomField> rawmaterialcustomfields = namedParameterJdbcTemplate().query(
					"select * from rawmaterialcustomfields WHERE rawMaterialid=:rawMaterialid", params,
					BeanPropertyRowMapper.newInstance(RawMaterialCustomField.class));
			if (rawmaterialcustomfields == null)
				rawmaterialcustomfields = new ArrayList<>();
			return rawmaterialcustomfields;

		} catch (Exception e) {
			return null;
		}
	}

	public RawMaterialCustomField getNamedRawMaterialCustomField(int rawmaterialid, String name) {
		try {

			Map<String, String> params = new HashMap<>();
			params.put("rawMaterialid", Integer.toString(rawmaterialid));
			params.put("fieldtypeName", name);
			RawMaterialCustomField rawmaterialcustomfield = namedParameterJdbcTemplate().queryForObject(
					"select * from rawmaterialcustomfields WHERE rawMaterialid=:rawMaterialid AND name=:name LIMIT 1",
					params, BeanPropertyRowMapper.newInstance(RawMaterialCustomField.class));
			return rawmaterialcustomfield;

		} catch (Exception e) {
			return null;
		}
	}

	public UnitOfMeasure getUnitOfMeasure(int id) {
		String sql = "Select * From unitofmeasure where id=:id";

		Map<String, String> params = new HashMap<>();
		params.put("id", Integer.toString(id));

		try {
			UnitOfMeasure unitofmeasure = (UnitOfMeasure) namedParameterJdbcTemplate().queryForObject(sql, params,
					BeanPropertyRowMapper.newInstance(UnitOfMeasure.class));

			if (unitofmeasure != null) {
				return unitofmeasure;
			}

			else {
				return null;
			}
		} catch (Exception e) {
			return null;
		}

	}

	public void Addrawmaterialperproduct(RawMaterialsPerProduct rawmaterialproducts) {

		if (getrawmaterialperproductAndRawMaterial(rawmaterialproducts.getProductid(),
				rawmaterialproducts.getRawmaterialid()) == null) {

			SimpleJdbcInsert simpleJdbcInsert = new SimpleJdbcInsert(mysqlDataSource())
					.withTableName("rawmaterialperproduct");

			Map<String, Object> parameters = new HashMap<>();

			parameters.put("productid", rawmaterialproducts.getProductid());
			parameters.put("rawmaterialid", rawmaterialproducts.getRawmaterialid());
			parameters.put("quantity", rawmaterialproducts.getQuantity());
			simpleJdbcInsert.execute(parameters);

		}
		if (rawmaterialproducts.getRawmaterial() != null) {
			this.AddRawMaterial(rawmaterialproducts.getRawmaterial());
		}

		return;

	}

	public void deleteRawMaterial(RawMaterial rawmaterial) {
		if (rawmaterial.getId() > 0) {
			jdbcTemplate().update("DELETE FROM rawmaterial WHERE id=?", rawmaterial.getId());
		}
	}

	public int SaveRawMaterial(RawMaterial rawmaterial) {

		if (rawmaterial.getId() == 0) {
			return this.AddRawMaterial(rawmaterial);
		} else {

			String sql = "UPDATE rawmaterial SET name=?, cost=?, quantity=?, idUnitOfMeasure=? WHERE id=?";
			jdbcTemplate().update(sql, rawmaterial.getName(), rawmaterial.getCost(), rawmaterial.getQuantity(),
					rawmaterial.getIdUnitOfMeasure(), rawmaterial.getId());

			// we are about to save the rawmaterialcustomfields table, but if they are none,
			// it means we want them deleted, but even if there are, we
			// want to update the whole list. Therefore, we will delete the existing ones
			// first, and then save.
			jdbcTemplate().update("DELETE FROM rawmaterialcustomfields WHERE rawmaterialid=?", rawmaterial.getId());
			if (rawmaterial.getUserCustomFields() != null && rawmaterial.getUserCustomFields().size() > 0) {

				for (int i = 0; i < rawmaterial.getUserCustomFields().size(); i++) {

					rawmaterial.getUserCustomFields().get(i).setRawMaterialid(rawmaterial.getId());
					AddRawMaterialCustomField(rawmaterial.getUserCustomFields().get(i));
				}
			}

			return rawmaterial.getId();
		}
	}

	public int AddRawMaterial(RawMaterial rawmaterial) {
		
		if ( rawmaterial.getId() == 0 ) {
			
			// id = 0 insert cause not in db
			
			SimpleJdbcInsert simpleJdbcInsert = new SimpleJdbcInsert(mysqlDataSource()).withTableName("RawMaterial").usingGeneratedKeyColumns("id");
			
			Map<String, Object> parameters = new HashMap<>();
			
			long millis=System.currentTimeMillis();  
		    java.sql.Time time=new java.sql.Time(millis);  
		    parameters.put("addedDate", time );
			parameters.put("name", rawmaterial.getName());
			parameters.put("cost", rawmaterial.getCost());
			parameters.put("quantity", rawmaterial.getQuantity());
			parameters.put("idUnitOfMeasure", rawmaterial.getIdUnitOfMeasure());
			parameters.put("idUser", rawmaterial.getUserID());
			Number id = simpleJdbcInsert.executeAndReturnKey(parameters);
			rawmaterial.setId(id.intValue());
		}
		if ( rawmaterial.getUserCustomFields() != null && rawmaterial.getUserCustomFields().size() > 0 ) {
			
			for(int i=0; i< rawmaterial.getUserCustomFields().size();i++ ) {
				
				rawmaterial.getUserCustomFields().get(i).setRawMaterialid( rawmaterial.getId());
				AddRawMaterialCustomField(rawmaterial.getUserCustomFields().get(i));
			}
		}
		
		return rawmaterial.getId();	
	
		}

	public void AddRawMaterialCustomField(RawMaterialCustomField rawmaterialcustomfield) {

		if (this.getNamedRawMaterialCustomField(rawmaterialcustomfield.getRawMaterialid(),
				rawmaterialcustomfield.getFieldtypeName()) == null) {

			//
			SimpleJdbcInsert simpleJdbcInsert = new SimpleJdbcInsert(mysqlDataSource())
					.withTableName("rawmaterialcustomfields");

			Map<String, Object> parameters = new HashMap<>();

			parameters.put("rawMaterialid", rawmaterialcustomfield.getRawMaterialid());
			parameters.put("fieldtypeName", rawmaterialcustomfield.getFieldtypeName());
			parameters.put("fieldValue", rawmaterialcustomfield.getFieldvalue());
			simpleJdbcInsert.execute(parameters);

		}

	}

	public void AddProductCustomField(ProductCustomFields productcustomfield) {

		if (this.getNamedProductCustomField(productcustomfield.getProductid(),
				productcustomfield.getFieldtypeName()) == null) {

			//
			SimpleJdbcInsert simpleJdbcInsert = new SimpleJdbcInsert(mysqlDataSource())
					.withTableName("productcustomfields");

			Map<String, String> parameters = new HashMap<>();

			parameters.put("productid", Integer.toString(productcustomfield.getProductid()));
			parameters.put("fieldtypename", productcustomfield.getFieldtypeName());
			parameters.put("fieldValue", productcustomfield.getFieldvalue());
			simpleJdbcInsert.execute(parameters);

		}


	}

	public List<Lot> getLotsFromProduct(int productid) {
		try {

			Map<String, String> params = new HashMap<>();
			params.put("productid", Integer.toString(productid));
			List<Lot> lots = namedParameterJdbcTemplate().query("select * from Lot WHERE productid=:productid", params,
					BeanPropertyRowMapper.newInstance(Lot.class));
			return lots;

		} catch (Exception e) {
			return null;
		}
	}

	public double addLot(Product product, double Quantity) {
		try {

			// limit quantity to the available rawmaterial quantity
			if (!product.getRawmaterials().isEmpty()) {
				for (int i = 0; i < product.getRawmaterials().size(); i++) {
					RawMaterialsPerProduct rmp = product.getRawmaterials().get(i);
					if ((rmp.getQuantity() * Quantity) > rmp.getRawmaterial().getQuantity()) {
						Quantity = (int) Math.floor(rmp.getRawmaterial().getQuantity() / rmp.getQuantity());

					}
				}
			}

			SimpleJdbcInsert simpleJdbcInsert = new SimpleJdbcInsert(mysqlDataSource()).withTableName("lot");

			Map<String, Object> parameters = new HashMap<>();

			parameters.put("productid", product.getId());
			parameters.put("availablequantity", Quantity);
			parameters.put("originalquantity", Quantity);
			if (simpleJdbcInsert.execute(parameters) == 1) {
				if (!product.getRawmaterials().isEmpty()) {
					for (int i = 0; i < product.getRawmaterials().size(); i++) {
						RawMaterialsPerProduct rmp = product.getRawmaterials().get(i);
						jdbcTemplate().update("UPDATE rawmaterial SET quantity=quantity-? WHERE id=?",
								(rmp.getQuantity() * Quantity), rmp.getRawmaterialid());
					}

				}
			}
			return Quantity;
		} catch (Exception e) {
			return 0;
		}

	}

	public void deleteProduct(Product product) {
		if (product.getId() > 0) {
			jdbcTemplate().update("DELETE FROM product WHERE id=?", product.getId());
		}
	}

	public int SaveProduct(Product product) {
		if (product.getId() == 0) {
			return this.AddProduct(product);
		}
		String sql = "UPDATE product SET name=?, SKU=?, cost=?, description=?, MSRP=?, idUnitOfMeasure=?, lowQuantityLevel=?, QRCode=? WHERE id=?";
		jdbcTemplate().update(sql, product.getName(), product.getSku(), product.getCost(), product.getDescription(),
				product.getMsrp(), product.getIdUnitOfMeasure(), product.getLowQuantityLevel(), product.getQRcode(),
				product.getId());

		// we are about to save the RawMaterialPerProduct table, but if they are none in
		// the product, it means we want them deleted, but even if there are, we
		// want to update the whole list. Therefore, we will delete the existing ones
		// first, and then save.
		jdbcTemplate().update("DELETE FROM rawmaterialperproduct WHERE productid=?", product.getId());
		if (product.getRawmaterials() != null && product.getRawmaterials().size() > 0) {
			for (int i = 0; i < product.getRawmaterials().size(); i++) {
				product.getRawmaterials().get(i).setProductid(product.getId());
				this.Addrawmaterialperproduct(product.getRawmaterials().get(i));
			}
		}

		// we are about to save the custom fields, if they are none, it means we want
		// them deleted, but even if there are, we
		// want to update the whole list. Therefore, we will delete the existing ones
		// first, and then save.
		jdbcTemplate().update("DELETE FROM productcustomfields WHERE productid=?", product.getId());
		if (product.getUserCustomFields() != null && product.getUserCustomFields().size() > 0) {
			for (int i = 0; i < product.getUserCustomFields().size(); i++) {
				product.getUserCustomFields().get(i).setProductid(product.getId());
				this.AddProductCustomField(product.getUserCustomFields().get(i));
			}
		}

		return product.getId();
	}

	public int AddProduct(Product product) {

		if (product.getId() == 0) {

			//
			SimpleJdbcInsert simpleJdbcInsert = new SimpleJdbcInsert(mysqlDataSource()).withTableName("Product")
					.usingGeneratedKeyColumns("id");

			Map<String, Object> parameters = new HashMap<>();

			long millis=System.currentTimeMillis();  
		    java.sql.Time time=new java.sql.Time(millis);  
		    parameters.put("addedDate", time );
			parameters.put("name", product.getName());
			parameters.put("SKU", product.getSku());
			parameters.put("cost", product.getCost());
			parameters.put("description", product.getDescription());
			parameters.put("MSRP", product.getMsrp());
			parameters.put("idunitofmeasure", product.getIdUnitOfMeasure());
			parameters.put("lowQuantityLevel", product.getLowQuantityLevel());
			parameters.put("QRcode", product.getQRcode());
			parameters.put("userId", product.getUserID());
			Number id = simpleJdbcInsert.executeAndReturnKey(parameters);
			product.setId(id.intValue());
		}
		if (product.getRawmaterials() != null && product.getRawmaterials().size() > 0) {
			for (int i = 0; i < product.getRawmaterials().size(); i++) {
				product.getRawmaterials().get(i).setProductid(product.getId());
				this.Addrawmaterialperproduct(product.getRawmaterials().get(i));
			}
		}
		if (product.getUserCustomFields() != null && product.getUserCustomFields().size() > 0) {
			for (int i = 0; i < product.getUserCustomFields().size(); i++) {
				product.getUserCustomFields().get(i).setProductid(product.getId());
				this.AddProductCustomField(product.getUserCustomFields().get(i));
			}
		}

		return product.getId();

	}

//----------------VUE--------------:
//Check low quantity (Different color)
//Form to create custom field value(servlet (creation de l'objet => passer au dao ou faire get mapping si le switch de page devient un problème)
//hable to show the list of products (one page) and the list of raw materials(another page) =toggle
//Form to create template(servlet => passer au dao ou faire get mapping si le switch de page devient un problème)

}
