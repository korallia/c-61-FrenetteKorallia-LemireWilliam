package com.TrocQc.Entity;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="product")
public class Product {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id")
	private int id;
	
	@Column(name="name")
	private String name;
	
	@Column(name="cost")
	private double cost;
	
	@Column(name="description")
	private String description;
	
	@Column(name="MSRP")
	private double msrp;
	
	@Column(name="addedDate")
	private Timestamp addedDate;
	
	
	
	@Column(name="idUnitOfmeasure")
	private int idUnitOfMeasure;
	
	private UnitOfMeasure unitofmeasure;
	
	
	@Column(name="lowQuantityLevel")
	private int lowQuantityLevel;
	
	
	
	@Column(name="userID")
	private int userID;
	
	@Column(name="SKU")
	private String sku;
	
	@Column(name="QRcode")
	private String QRcode;
	
	private List<ProductCustomFields> UserCustomFields;
	
	private List<RawMaterialsPerProduct> rawmaterials;
	
	private List<Lot> lots;
	
	public Product() {
		this.lots = new ArrayList<Lot>();
		this.rawmaterials = new ArrayList<RawMaterialsPerProduct>();
		this.UserCustomFields = new ArrayList<ProductCustomFields>();
	
	}
	
	
	
	
	private Product(ProductBuilder builder) {
		this.name = builder.name;
		this.cost = builder.cost;
		this.description = builder.description;
		this.msrp = builder.msrp;
		this.addedDate = builder.addedDate;
		this.idUnitOfMeasure = builder.idUnitOfMeasure;
		this.lowQuantityLevel = builder.lowQuantityLevel;
		this.userID = builder.userID;
		this.sku = builder.sku;
		this.QRcode = builder.QRcode;
		this.UserCustomFields = builder.UserCustomFields;
		
	}
	
	public Boolean reduceInventory(int Quantity  ) {
		
		if ( Quantity <= this.getAvailableQuantity()) {
			for( int i = 0; i < lots.size(); i++) {
				if ( lots.get(i).getAvailablequantity() < Quantity ) {
					Quantity -=  lots.get(i).getAvailablequantity();
					lots.get(i).setAvailablequantity(0);
					
				}
				else {
					int remaining = lots.get(i).getAvailablequantity()- Quantity;
					lots.get(i).setAvailablequantity(remaining );
					Quantity = 0;
					break;
					
				}
			}
		}
		return Quantity == 0;
		
	}

	
	
	public int getId() {
		return id;
	}



	public void setId(int id) {
		this.id = id;
	}



	public String getName() {
		return name;
	}



	public void setName(String name) {
		this.name = name;
	}



	public double getCost() {
		return cost;
	}



	public void setCost(double cost) {
		this.cost = cost;
	}



	public String getDescription() {
		return description;
	}



	public void setDescription(String description) {
		this.description = description;
	}



	public double getMsrp() {
		return msrp;
	}



	public void setMsrp(double msrp) {
		this.msrp = msrp;
	}



	public Timestamp getAddedDate() {
		return addedDate;
	}



	public void setAddedDate(Timestamp addedDate) {
		this.addedDate = addedDate;
	}



	public int getIdUnitOfMeasure() {
		return idUnitOfMeasure;
	}



	public void setIdUnitOfMeasure(int idUnitOfMeasure) {
		this.idUnitOfMeasure = idUnitOfMeasure;
	}



	public UnitOfMeasure getUnitofmeasure() {
		return unitofmeasure;
	}



	public void setUnitofmeasure(UnitOfMeasure unitofmeasure) {
		if ( unitofmeasure.getId() > 0 ) {
			this.setIdUnitOfMeasure(unitofmeasure.getId());
		}
		this.unitofmeasure = unitofmeasure;
	}

	public int getLowQuantityLevel() {
		return lowQuantityLevel;
	}



	public void setLowQuantityLevel(int lowQuantityLevel) {
		this.lowQuantityLevel = lowQuantityLevel;
	}



	public int getAvailableQuantity() {
		int availableQuantity = 0;
	
		for( int i = 0; i < lots.size(); i++) {
			 availableQuantity += lots.get(i).getAvailablequantity();
		}
		return availableQuantity;
	}

	
	public int getUserID() {
		return userID;
	}



	public void setUserID(int userID) {
		this.userID = userID;
	}



	public String getSku() {
		return sku;
	}



	public void setSku(String sku) {
		this.sku = sku;
	}



	public String getQRcode() {
		return QRcode;
	}



	public void setQRcode(String qRcode) {
		QRcode = qRcode;
	}



	public List<ProductCustomFields> getUserCustomFields() {
		return UserCustomFields;
	}



	public void setUserCustomFields(List<ProductCustomFields> userCustomFields) {
		UserCustomFields = userCustomFields;
	}



	public List<RawMaterialsPerProduct> getRawmaterials() {
		return rawmaterials;
	}

	public void setRawmaterials(List<RawMaterialsPerProduct> rawmaterials) {
		this.rawmaterials = rawmaterials;
	}



	public List<Lot> getLots() {
		return lots;
	}

	public void setLots(List<Lot> lots) {
		this.lots = lots;
	}



	public class ProductBuilder {

		private String name;
		private double cost;
		private String description;
		private double msrp;
		private Timestamp addedDate;
		private int idUnitOfMeasure;
		private int lowQuantityLevel;
		private int userID;
		private String sku;
		private String QRcode;
		private List<ProductCustomFields> UserCustomFields;
	
	
		public ProductBuilder(String name, double cost, String sku) {
			this.name = name;
			this.cost = cost;
			this.sku = sku;
			
		}
		
			
		
		public Product build() {
			Product product = new Product(this);
			return product;
		}

		public ProductBuilder description(String description){
			this.description = description;
			return this;
		}
		public ProductBuilder msrp(double msrp){
			this.msrp = msrp;
			return this;
		}
		public ProductBuilder addedDate(Timestamp addedDate){
			this.addedDate = addedDate;
			return this;
		}
		public ProductBuilder idUnitOfMeasure(int idUnitOfMeasure){
			this.idUnitOfMeasure = idUnitOfMeasure;
			return this;
		}
				public ProductBuilder lowQuantityLevel(int lowQuantityLevel){
			this.lowQuantityLevel = lowQuantityLevel;
			return this;
		}
		public ProductBuilder userID(int userID){
			this.userID = userID;
			return this;
		}
		public ProductBuilder QRcode(String QRcode){
			this.QRcode = QRcode;
			return this;
		}
		public ProductBuilder UserCustomFields(List<ProductCustomFields> UserCustomFields){
			this.UserCustomFields = UserCustomFields;
			return this;
		}
		
}
}
