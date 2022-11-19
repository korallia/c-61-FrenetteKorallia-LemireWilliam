package com.TrocQc.Entity;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="unitofmeasure")
public class UnitOfMeasure {
	//
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id")
	private int id;
	
	@Column(name="name")
	private String name;
	
	@Column(name="abbreviation")
	private String abbreviation;
	
	
	@Column(name="parent")
	private int parent;
	
	@Column(name="ratio")
	private float ratio;

	public UnitOfMeasure(int id, String name, String abbreviation, int parent, float ratio) {
		this.id = id;
		this.name = name;
		this.abbreviation = abbreviation;
		this.parent = parent;
		this.ratio = ratio;
	}

}
