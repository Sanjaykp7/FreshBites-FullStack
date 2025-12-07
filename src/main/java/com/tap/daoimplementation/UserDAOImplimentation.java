package com.tap.daoimplementation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.tap.dao.UserDAO;
import com.tap.model.User;
import com.tap.util.DataBaseConnection;

public class UserDAOImplimentation implements UserDAO{

	private static final String GET_ALL_USERS_QUERY = "SELECT * FROM `user`";
	private static final String GET_USER_QUERY = "SELECT * FROM `user` WHERE `userId` = ?";
	private static final String INSERT_USER_QUERY = "INSERT INTO `user`(`name`,`password`,`email`,`phone`,`address`,`role`,`createdDate`,`lastLoginDate`)"
			+ " VALUES (?,?,?,?,?,?,?,?)";
	private static final String UPDATE_USER_QUERY = "UPDATE `user` SET `name`=? `password`=? `email`=? `phone`=? `address`=? `role`=? WHERE `userId` = ?";
	private static final String DELETE_USER_QUERY = "DELETE FROM `user` WHERE `userId` = ?";
	private static final String GET_USER_BY_MAIL = "SELECT * FROM `user` WHERE `email`= ?";

	//	GET ALL THE USERS DATA
	@Override
	public List<User> getAllUsers() {

		ArrayList<User> usersList = new ArrayList<User>();

		try(Connection connection = DataBaseConnection.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(GET_ALL_USERS_QUERY)) {
			
			ResultSet resultSet = preparedStatement.executeQuery();

			while(resultSet.next()) {
				User user = extractUser(resultSet);
				usersList.add(user);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return usersList;
	}

	//	GET A SINGLE USER DATA USING userId
	@Override
	public User getUser(int userId) {

		User user = null;

		try(Connection connection = DataBaseConnection.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(GET_USER_QUERY); ){

			preparedStatement.setInt(1, userId);
			ResultSet resultSet = preparedStatement.executeQuery();
			
			if(resultSet.next()) {
				user = extractUser(resultSet);				
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return user;
	}
	
	
	@Override
	public User getUserByEmail(String email) {
		User user = null;
		
		try(Connection connection = DataBaseConnection.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(GET_USER_BY_MAIL)) {
			
			preparedStatement.setString(1, email);
			
			ResultSet resultSet = preparedStatement.executeQuery();
			
			if(resultSet.next()) {
				user = extractUser(resultSet);				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return user;
	}
	
	
	

	// ADDING USER DATA
	@Override
	public void addUser(User user) {

		try (Connection connection = DataBaseConnection.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USER_QUERY)){

			preparedStatement.setString(1,user.getName());
			preparedStatement.setString(2,user.getPassword());
			preparedStatement.setString(3,user.getEmail());
			preparedStatement.setString(4,user.getPhone());
			preparedStatement.setString(5,user.getAddress());
			preparedStatement.setString(6,user.getRole());
			preparedStatement.setTimestamp(7, new Timestamp(System.currentTimeMillis()));
			preparedStatement.setTimestamp(8, new Timestamp(System.currentTimeMillis()));
			
			int executeUpdate = preparedStatement.executeUpdate();
			System.out.println(executeUpdate);

		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	//	UPDATE THE USER DATA
	@Override
	public void updateUser(User user) {

		try(Connection connection = DataBaseConnection.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_USER_QUERY);) {

			preparedStatement.setString(1,user.getName());
			preparedStatement.setString(2,user.getPassword());
			preparedStatement.setString(3,user.getEmail());
			preparedStatement.setString(4,user.getPhone());
			preparedStatement.setString(5,user.getAddress());
			preparedStatement.setString(6,user.getRole());
			preparedStatement.setInt(7,user.getUserId());

			int executeUpdate = preparedStatement.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	//	DELETE the USER using userId
	@Override
	public void deleteUser(int userId) {


		try(Connection connection = DataBaseConnection.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(DELETE_USER_QUERY);) {

			preparedStatement.setInt(1, userId);
			int executeUpdate = preparedStatement.executeUpdate();


		} catch (SQLException e) {
			e.printStackTrace();
		}


	}


	User extractUser(ResultSet resultSet) throws SQLException{
		
		int userId = resultSet.getInt("userId");
		String name = resultSet.getString("name");
		String password = resultSet.getString("password");
		String email = resultSet.getString("email");
		String phone = resultSet.getString("phone");
		String address = resultSet.getString("address");
		String role = resultSet.getString("role");

		User user = new User(userId, name, password, email, phone, address, role, null, null);

		return user;
	}





}
