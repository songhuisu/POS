package com.andamiro.pos.model;

public class CategoryDTO {
	private int id, shop_id;
	private String name, coodinates;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getShop_id() {
		return shop_id;
	}
	public void setShop_id(int shop_id) {
		this.shop_id = shop_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCoodinates() {
		return coodinates;
	}
	public void setCoodinates(String coodinates) {
		this.coodinates = coodinates;
	}
}
