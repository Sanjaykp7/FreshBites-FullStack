package com.tap.model;

public class Menu {
	
	private int menuId;
    private String itemName;
    private String description;
    private int price;
    private String category; // e.g., "Pizza", "Drinks", "Dessert"
    private boolean isAvailable;
    private int restaruantId; // foreign key to Restaurant
    private double ratings;
    private String image;
    
    public Menu() {
		// TODO Auto-generated constructor stub
	}

	public Menu(int menuId, String itemName, String description, int price, String category, Boolean isAvailable,
			int restaruantId, double ratings, String image) {
		super();
		this.menuId = menuId;
		this.itemName = itemName;
		this.description = description;
		this.price = price;
		this.category = category;
		this.isAvailable = isAvailable;
		this.restaruantId = restaruantId;
		this.ratings=ratings;
		this.image=image;
	}
	public Menu(String itemName, String description, int price, String category, boolean isAvailable,
			int restaruantId, double ratings, String image) {
		
		this.itemName = itemName;
		this.description = description;
		this.price = price;
		this.category = category;
		this.isAvailable = isAvailable;
		this.restaruantId = restaruantId;
		this.ratings=ratings;
		this.image=image;
	}

	public int getMenuId() {
		return menuId;
	}

	public void setMenuId(int menuId) {
		this.menuId = menuId;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public Boolean getIsAvailable() {
		return isAvailable;
	}

	public void setIsAvailable(Boolean isAvailable) {
		this.isAvailable = isAvailable;
	}

	public int getRestaurantId() {
		return restaruantId;
	}

	public void setRestaurantId(int restaruantId) {
		this.restaruantId = restaruantId;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public double getRatings() {
		return ratings;
	}

	public void setRatings(double ratings) {
		this.ratings = ratings;
	}
    
    
    
}
