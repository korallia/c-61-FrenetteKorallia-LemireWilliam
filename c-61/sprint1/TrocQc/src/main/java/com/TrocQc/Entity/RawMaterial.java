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
@Table(name="rawmaterial")
public class RawMaterial {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id")
	private int id;
	
	@Column(name="name")
	private String name;
	
	@Column(name="cost")
	private double cost;
	
	
	@Column(name="addedDate")
	private Timestamp addedDate;
	
	@Column(name="idUnitOfmeasure")
	private int idUnitOfMeasure;
	
	private UnitOfMeasure unitofmeasure;

	
	@Column(name="quantity")
	private double quantity;
	
	
	@Column(name="userID")
	private int userID;
	
	private List<RawMaterialCustomField> UserCustomFields;
	
	
	public RawMaterial() {
	
	}
	
	private RawMaterial(RawMaterialBuilder builder) {
		this.name = builder.name;
		this.cost = builder.cost;
		this.addedDate = builder.addedDate;
		this.idUnitOfMeasure = builder.idUnitOfMeasure;
		this.quantity = builder.quantity;
		this.userID = builder.userID;
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


	public double getQuantity() {
		return quantity;
	}

	public void setQuantity(double quantity) {
		this.quantity = quantity;
	}

	public int getUserID() {
		return userID;
	}

	public void setUserID(int userID) {
		this.userID = userID;
	}

	public List<RawMaterialCustomField> getUserCustomFields() {
		return UserCustomFields;
	}


	public void setUserCustomFields(List<RawMaterialCustomField> userCustomFields) {
		UserCustomFields = userCustomFields;
	}

/*
	public static class RawMaterialBuilder {

		private String name;
		private double cost;
		private Timestamp addedDate;
		private int idUnitOfMeasure;
		private double quantity;
		private int userID;
		
		
		public RawMaterialBuilder(String name) {
			this.name = name;
		}
	

		public RawMaterialBuilder Cost(double cost) {
			this.cost = cost;
			return this;
		}

		public RawMaterialBuilder AddedDate(Timestamp addedDate) {
			this.addedDate = addedDate;
			return this;
		}

		public RawMaterialBuilder IdUnitOfMeasure(int idUnitOfMeasure) {
			this.idUnitOfMeasure = idUnitOfMeasure;
			return this;
		}


		public RawMaterialBuilder Quantity(double quantity) {
			this.quantity = quantity;
			return this;
		}


		public RawMaterialBuilder UserID(int userID) {
			this.userID = userID;
			return this;
		}
		public RawMaterial build() {
			RawMaterial rawmaterial = new RawMaterial(this);
			return rawmaterial;
		}
		
		
	}
*/
	public RawMaterial(int id, String name, double cost, Timestamp addedDate, UnitOfMeasure unitofmeasure,
			double quantity, int userID, List<RawMaterialCustomField> userCustomFields) {
		super();
		this.id = id;
		this.name = name;
		this.cost = cost;
		this.addedDate = addedDate;
		this.unitofmeasure = unitofmeasure;
		this.quantity = quantity;
		this.userID = userID;
		this.UserCustomFields = userCustomFields;
		this.idUnitOfMeasure = unitofmeasure.getId();
	}
	
	

		
}
