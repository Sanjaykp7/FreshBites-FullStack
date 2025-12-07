package com.tap.model;

public class OrderItem {
    private int orderItemId;
    private int orderId; // foreign key to Order
    private int menuId;  // foreign key to Menu
    private int quantity;
    private int price; // price * quantity
    
    public OrderItem() {
		// TODO Auto-generated constructor stub
	}

	public OrderItem(int orderItemId, int orderId, int menuId, int quantity, int price) {
		this.orderItemId = orderItemId;
		this.orderId = orderId;
		this.menuId = menuId;
		this.quantity = quantity;
		this.price = price;
	}
	
	public OrderItem(int orderId, int menuId, int quantity, int price) {
		this.orderId = orderId;
		this.menuId = menuId;
		this.quantity = quantity;
		this.price = price;
	}

	public int getOrderItemId() {
		return orderItemId;
	}

	public void setOrderItemId(int orderItemId) {
		this.orderItemId = orderItemId;
	}

	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public int getMenuId() {
		return menuId;
	}

	public void setMenuId(int menuId) {
		this.menuId = menuId;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}
    
    
    
}
