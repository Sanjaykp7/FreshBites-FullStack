package com.tap.dao;

import java.util.List;
import com.tap.model.Restaurant;
import com.tap.model.User;

public interface RestaurantDAO {
	void addRestaurant(Restaurant restaurant);
	void updateRestaurant(Restaurant restaurant);
	void deleteRestaurant(int restaurantId);
	Restaurant getRestaurant(int restaurantId);
	List<Restaurant> getAllRestaurant();
	
	
	
	
	
}