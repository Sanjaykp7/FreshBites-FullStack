package com.tap.daoimplementation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.tap.dao.OrderDAO;
import com.tap.model.Order;
import com.tap.util.DataBaseConnection;

public class OrderDAOImplimentation implements OrderDAO{

	private static final String ADD_ORDER_QUERY = "INSERT INTO `order`(`userId`,`restaurantId`,`orderDate`,`totalAmount`,`status`,`paymentMethod`,`deliveryAddress`)"
			+ "VALUES(?,?,?,?,?,?,?)";
	private static final String UPDATE_ORDER_QUERY = "UPDATE `order` SET `userId` = ?,`restaurantId` = ?,`orderDate` = ?,`totalAmount` = ?,`status` = ?,`paymentMethod` = ?,`deliveryAddress` = ?"
			+ "WHERE `orderId` = ?";
	private static final String DELETE_ORDER_QUERY = "DELETE FROM `order` WHERE `orderId` = ? ";
	private static final String GET_ORDER_QUERY = "SELECT * FROM `order` WHERE `orderId` = ?";
	private static final String GET_ALL_ORDER_QUERY = "SELECT * FROM `order`";
	
	int orderId;

	@Override
	public int addOrder(Order order) {
		
		try(Connection connection = DataBaseConnection.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(ADD_ORDER_QUERY, PreparedStatement.RETURN_GENERATED_KEYS)) {
			
			preparedStatement.setInt(1, order.getUserId());
			preparedStatement.setInt(2, order.getRestaurantId());
			preparedStatement.setTimestamp(3, new Timestamp(System.currentTimeMillis()));
			preparedStatement.setInt(4, order.getTotalAmount());
			preparedStatement.setString(5, order.getStatus());
			preparedStatement.setString(6, order.getPaymentMethod());
			preparedStatement.setString(7, order.getDeliveryAddress());
			
			int executeUpdate = preparedStatement.executeUpdate();
			
			ResultSet generatedKeys = preparedStatement.getGeneratedKeys();
			
			if(generatedKeys.next()) {
				orderId = generatedKeys.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return orderId;
	}

	@Override
	public void updateOrder(Order order) {
		
		
		try(Connection connection = DataBaseConnection.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_ORDER_QUERY)) {
			
			preparedStatement.setInt(1, order.getUserId());
			preparedStatement.setInt(2, order.getRestaurantId());
			preparedStatement.setTimestamp(3, new Timestamp(System.currentTimeMillis()));
			preparedStatement.setInt(4, order.getTotalAmount());
			preparedStatement.setString(5, order.getStatus());
			preparedStatement.setString(6, order.getPaymentMethod());
			preparedStatement.setString(7, order.getDeliveryAddress());
			
			int executeUpdate = preparedStatement.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void deleteOrder(int orderId) {
		
		try(Connection connection = DataBaseConnection.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(DELETE_ORDER_QUERY)) {
			
			preparedStatement.setInt(1, orderId);
			
			int executeUpdate = preparedStatement.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	@Override
	public Order getOrder(int orderId) {
		Order order = null;
		
		try(Connection connection = DataBaseConnection.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(GET_ORDER_QUERY )){
			
			preparedStatement.setInt(1, orderId);
			
			ResultSet resultSet = preparedStatement.executeQuery();
			order = extractOrder(resultSet);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return order;
	}

	@Override
	public List<Order> getAllOrder() {
		Order order = null;
		ArrayList<Order> arrayList = new ArrayList<>();
		
		Connection connection = DataBaseConnection.getConnection();
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(GET_ALL_ORDER_QUERY);
			
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				order = extractOrder(resultSet);
				arrayList.add(order);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return arrayList;
	}
	
	Order extractOrder(ResultSet resultSet) throws SQLException {
		
		int orderId = resultSet.getInt("orderId");
		int userId = resultSet.getInt("userId");
		int restaurantId = resultSet.getInt("restaurantId");
		Timestamp orderDate = resultSet.getTimestamp("orderDate");
		int totalAmount = resultSet.getInt("totalAmount");
		String status = resultSet.getString("status");
		String paymentMethod = resultSet.getString("paymentMethod");
		String deliveryAddress = resultSet.getString("deliveryAddress");
		
		Order order = new Order(orderId, userId, restaurantId, orderDate, totalAmount, status, paymentMethod, deliveryAddress);
		
		return order;
	}

}
