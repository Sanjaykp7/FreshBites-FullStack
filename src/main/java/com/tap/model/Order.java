package com.tap.model;

import java.sql.Timestamp;

public class Order {
    private int orderId;
    private int userId; // foreign key to User
    private int restaurantId; // foreign key to Restaurant
    private Timestamp orderDate;
    private int totalAmount;
    private String status; // e.g., "PLACED", "CONFIRMED", "DELIVERED", "CANCELLED"
    private String paymentMethod; // e.g., "COD", "UPI", "Card"
    private String deliveryAddress;
    
    public Order() {
		// TODO Auto-generated constructor stub
	}

	public Order(int orderId, int userId, int restaurantId, Timestamp orderDate, int totalAmount, String status,
			String paymentMethod, String deliveryAddress) {
		this.orderId = orderId;
		this.userId = userId;
		this.restaurantId = restaurantId;
		this.orderDate = orderDate;
		this.totalAmount = totalAmount;
		this.status = status;
		this.paymentMethod = paymentMethod;
		this.deliveryAddress = deliveryAddress;
	}
	public Order(int userId, int restaurantId,int totalAmount, String status,String paymentMethod, String deliveryAddress) {

		this.userId = userId;
		this.restaurantId = restaurantId;
		this.totalAmount = totalAmount;
		this.status = status;
		this.paymentMethod = paymentMethod;
		this.deliveryAddress = deliveryAddress;
	}

	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getRestaurantId() {
		return restaurantId;
	}

	public void setRestaurantId(int restaurantId) {
		this.restaurantId = restaurantId;
	}

	public Timestamp getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Timestamp orderDate) {
		this.orderDate = orderDate;
	}

	public int getTotalAmount() {
		return totalAmount;
	}

	public void setTotalAmount(int totalAmount) {
		this.totalAmount = totalAmount;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getPaymentMethod() {
		return paymentMethod;
	}

	public void setPaymentMethod(String paymentMethod) {
		this.paymentMethod = paymentMethod;
	}

	public String getDeliveryAddress() {
		return deliveryAddress;
	}

	public void setDeliveryAddress(String deliveryAddress) {
		this.deliveryAddress = deliveryAddress;
	}
    
    
    
}
