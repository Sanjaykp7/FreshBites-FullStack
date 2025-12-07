package com.tap.daoimplementation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.tap.dao.RestaurantDAO;
import com.tap.model.Restaurant;
import com.tap.util.DataBaseConnection;

public class RestaurantDAOImplimentation implements RestaurantDAO {

	private static final String INSRT_RESTARUANT_QUERY = "INSERT INTO `restaurant` (`name`, `email`, `phone`, `address`, `city`, `pincode`, `ratings`, `isActive`, `deliveryTime`, `cuisine`, `image`) "
			+ "VALUES (?,?,?,?,?,?,?,?,?,?)";
	private static final String DELETE_RESTARUANT_QUERY = "DELETE from `restaurant` WHERE `restaurantId` = ? ";
	private static final String GET_RESTARUANT_QUERY = "SELECT * FROM `restaurant` WHERE `restaurantId` = ? ";
	private static final String GET_ALL_RESTARUANTS_QUERY = "SELECT * FROM `restaurant`";
	private static final String UPDATE_RESTARUANT_QUERY = "UPDATE `restaurant` SET `name` = ? `email` = ? `phone` = ? `address` = ? `city` = ? `pincode` = ? `ratings` = ? `isActive` = ? `deliveryTime` = ? `cuisine` = ? `image` = ? WHERE `restaurantId` = ?";



	@Override
	public void addRestaurant(Restaurant restaurant) {

		try(Connection connection = DataBaseConnection.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(INSRT_RESTARUANT_QUERY )) {

			preparedStatement.setString(1,restaurant.getName());
			preparedStatement.setString(2,restaurant.getEmail());
			preparedStatement.setString(3,restaurant.getPhone());
			preparedStatement.setString(4,restaurant.getAddress());
			preparedStatement.setString(5,restaurant.getCity());
			preparedStatement.setString(6,restaurant.getPincode());
			preparedStatement.setDouble(7,restaurant.getRatings());
			preparedStatement.setBoolean(8,restaurant.getIsActive());
			preparedStatement.setString(9,restaurant.getDeliveryTime());
			preparedStatement.setString(10,restaurant.getCuisine());
			preparedStatement.setString(11,restaurant.getImage());

			int executeUpdate = preparedStatement.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void updateRestaurant(Restaurant restaurant) {



		try(Connection connection = DataBaseConnection.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_RESTARUANT_QUERY)) {

			preparedStatement.setString(1,restaurant.getName());
			preparedStatement.setString(2,restaurant.getEmail());
			preparedStatement.setString(3,restaurant.getPhone());
			preparedStatement.setString(4,restaurant.getAddress());
			preparedStatement.setString(5,restaurant.getCity());
			preparedStatement.setString(6,restaurant.getPincode());
			preparedStatement.setDouble(7,restaurant.getRatings());
			preparedStatement.setBoolean(8,restaurant.getIsActive());
			preparedStatement.setInt(9, restaurant.getRestaruantId());
			preparedStatement.setString(10,restaurant.getDeliveryTime());
			preparedStatement.setString(11,restaurant.getCuisine());
			preparedStatement.setString(11,restaurant.getImage());

			int executeUpdate = preparedStatement.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void deleteRestaurant(int restaurantId) {

		try(Connection connection = DataBaseConnection.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(DELETE_RESTARUANT_QUERY)) {

			preparedStatement.setInt(1, restaurantId);
			int executeUpdate = preparedStatement.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	@Override
	public Restaurant getRestaurant(int restaurantId) {
		Restaurant restaurant = null;

		try(Connection connection = DataBaseConnection.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(GET_RESTARUANT_QUERY)) {

			preparedStatement.setInt(1, restaurantId);

			ResultSet resultSet = preparedStatement.executeQuery();
			if(resultSet.next()) {
				restaurant = extractRestaurant(resultSet);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return restaurant;
	}

	@Override
	public List<Restaurant> getAllRestaurant() {

		ArrayList<Restaurant> restaurantList = new ArrayList<Restaurant>();

		try(Connection connection = DataBaseConnection.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(GET_ALL_RESTARUANTS_QUERY)) {

			ResultSet resultSet = preparedStatement.executeQuery();

			while(resultSet.next()) {

				Restaurant restaurant = extractRestaurant(resultSet);
				restaurantList.add(restaurant);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return restaurantList;
	}


	Restaurant extractRestaurant(ResultSet resultSet) throws SQLException{
		int restaurantId = resultSet.getInt("restaurantId");
		String Name = resultSet.getString("name");
		String email = resultSet.getString("email");
		String phone = resultSet.getString("phone");
		String address = resultSet.getString("address");
		String city = resultSet.getString("city");
		String pincode = resultSet.getString("pincode");
		double  ratings = resultSet.getDouble("ratings");
		Boolean isActive = resultSet.getBoolean("isActive");
		String deliveryTime = resultSet.getString("deliveryTime");
		String cuisine = resultSet.getString("cuisine");
		String image = resultSet.getString("image");


		Restaurant restaurant = new Restaurant(restaurantId, Name, email, phone, address, city, pincode, ratings, isActive, deliveryTime, cuisine, image);

		return restaurant;
	}

}
