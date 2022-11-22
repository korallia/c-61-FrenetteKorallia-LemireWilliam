package com.TrocQc.Entity;

class Module {
	
	private String name;
	private String description;
	protected User user;
	
	public Module(String name, String description, User user) {
		super();
		this.name = name;
		this.description = description;
		this.user = user;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	
	
}