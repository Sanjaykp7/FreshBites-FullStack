package com.tap.model;

public class Restaurant {
	private int restaurantId;
	private String name;
	private String email;
	private String phone;
	private String address;
	private String city;
	private String pincode;
	private double ratings;
	private Boolean isActive;
	private String deliveryTime;	
	private String cuisine;
	private String image;
	
	//Zero parameterized Constructor
	public Restaurant(){
		
	}
	
	//parameterized Constructor
	public Restaurant(int restaurantId, String name, String email, String phone, String address, String city,
			String pincode, double ratings, Boolean isActive, String deliveryTime, String cuisine, String image) {

		this.restaurantId = restaurantId;
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.address = address;
		this.city = city;
		this.pincode = pincode;
		this.ratings = ratings;
		this.isActive = isActive;
		this.deliveryTime = deliveryTime;
		this.cuisine = cuisine;
		this.image = image;
	}
	public Restaurant(String name, String email, String phone, String address, String city,
			String pincode, double ratings, Boolean isActive, String deliveryTime, String cuisine, String image) {
		
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.address = address;
		this.city = city;
		this.pincode = pincode;
		this.ratings = ratings;
		this.isActive = isActive;
		this.deliveryTime=deliveryTime;
		this.cuisine = cuisine;
		this.image = image;
	}

	public int getRestaruantId() {
		return restaurantId;
	}

	public void setRestaruantId(int restaurantId) {
		this.restaurantId = restaurantId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getPincode() {
		return pincode;
	}

	public void setPincode(String pincode) {
		this.pincode = pincode;
	}

	public double getRatings() {
		return ratings;
	}

	public void setRatings(double ratings) {
		this.ratings = ratings;
	}

	public Boolean getIsActive() {
		return isActive;
	}

	public void setIsActive(Boolean isActive) {
		this.isActive = isActive;
	}
	
	public String getDeliveryTime() {
		return deliveryTime;
	}
	
	public void setDeliveryTime(String deliveryTime) {
		this.deliveryTime = deliveryTime;
	}
	
	public String getCuisine() {
		return cuisine;
	}

	public void setCuisine(String cuisine) {
		this.cuisine = cuisine;
	}
	
	public String getImage() {
		return image;
	}
	
	public void setImage(String image) {
		this.image = image;
	}
	

	
}
