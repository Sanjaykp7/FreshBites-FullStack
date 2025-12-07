package com.tap.model;

public class CartItem {
	private int itemId;
	private	String name;
	private int price;
	private int quantity;
	
	public CartItem() {
		// TODO Auto-generated constructor stub
	}
	
	public CartItem(int itemId, String name, int price, int quantity) {
		this.itemId = itemId;
		this.name = name;
		this.price = price;
		this.quantity = quantity;
	}
	
	

	public int getItemId() {
		return itemId;
	}

	public void setItemId(int itemId) {
		this.itemId = itemId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
	
}
