package com.tap.daoimplementation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.tap.dao.OrderItemDAO;
import com.tap.model.OrderItem;
import com.tap.util.DataBaseConnection;

public class OrderItemDAOImplimentation implements OrderItemDAO {

	private static final String INSERT_ORDER_ITEM = "INSERT INTO `orderitem` (`orderId`, `menuId`, `quantity`, `price`) "
			+ "VALUES(?,?,?,?)";

	@Override
	public void addOrderItem(OrderItem orderItem) {

		try(Connection connection = DataBaseConnection.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(INSERT_ORDER_ITEM)) {

			preparedStatement.setInt(1, orderItem.getOrderId());
			preparedStatement.setInt(2, orderItem.getMenuId());
			preparedStatement.setInt(3, orderItem.getQuantity());
			preparedStatement.setInt(4, orderItem.getPrice());

			int executeUpdate = preparedStatement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

}
