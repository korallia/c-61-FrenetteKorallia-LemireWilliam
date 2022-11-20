package com.TrocQc.Entity;

import java.sql.Timestamp;
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
	
	@Column(name="isTemplate")
	private boolean isTemplate;
	
	@Column(name="idUnitOfmeasure")
	private int idUnitOfMeasure;
	
	private UnitOfMeasure unitofmeasure;
	
	
	@Column(name="quantity")
	private double quantity;
	
	@Column(name="lowQuantityLevel")
	private double lowQuantityLevel;
	
	@Column(name="userID")
	private int userID;
	
	@Column(name="SKU")
	private String sku;
	
	@Column(name="QRcode")
	private String QRcode;
	
	private List<ProductCustomFields> UserCustomFields;
	
	private List<RawMaterialProducts> rawmaterials;
	
	public Product() {
	
	}
	
	private Product(ProductBuilder builder) {
		this.name = builder.name;
		this.cost = builder.cost;
		this.description = builder.description;
		this.msrp = builder.msrp;
		this.addedDate = builder.addedDate;
		this.isTemplate = builder.isTemplate;
		this.idUnitOfMeasure = builder.idUnitOfMeasure;
		this.quantity = builder.quantity;
		this.lowQuantityLevel = builder.lowQuantityLevel;
		this.userID = builder.userID;
		this.sku = builder.sku;
		this.QRcode = builder.QRcode;
		this.UserCustomFields = builder.UserCustomFields;
		
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



	public boolean isTemplate() {
		return isTemplate;
	}



	public void setTemplate(boolean isTemplate) {
		this.isTemplate = isTemplate;
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



	public double getQuantity() {
		return quantity;
	}



	public void setQuantity(double quantity) {
		this.quantity = quantity;
	}



	public double getLowQuantityLevel() {
		return lowQuantityLevel;
	}



	public void setLowQuantityLevel(double lowQuantityLevel) {
		this.lowQuantityLevel = lowQuantityLevel;
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



	public List<RawMaterialProducts> getRawmaterials() {
		return rawmaterials;
	}

	public void setRawmaterials(List<RawMaterialProducts> rawmaterials) {
		this.rawmaterials = rawmaterials;
	}



	public class ProductBuilder {

		private String name;
		private double cost;
		private String description;
		private double msrp;
		private Timestamp addedDate;
		private boolean isTemplate;
		private int idUnitOfMeasure;
		private double quantity;
		private double lowQuantityLevel;
		private int userID;
		private String sku;
		private String QRcode;
		private List<ProductCustomFields> UserCustomFields;
	
	
		public ProductBuilder(String name, double cost, double quantity, String sku) {
			this.name = name;
			this.cost = cost;
			this.quantity = quantity;
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
		public ProductBuilder isTemplate(boolean isTemplate){
			this.isTemplate = isTemplate;
			return this;
		}
		public ProductBuilder idUnitOfMeasure(int idUnitOfMeasure){
			this.idUnitOfMeasure = idUnitOfMeasure;
			return this;
		}
				public ProductBuilder lowQuantityLevel(double lowQuantityLevel){
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
