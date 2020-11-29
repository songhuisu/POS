package com.andamiro.pos.model;

public class SessionDTO {
	private String id;
	private String name;
	private ShopDTO selectedShop;
	
	public ShopDTO getSelectedShop() {
		return selectedShop;
	}
	public void setSelectedShop(ShopDTO selectedShop) {
		this.selectedShop = selectedShop;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
}
