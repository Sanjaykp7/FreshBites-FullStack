package com.tap.daoimplementation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.tap.dao.MenuDAO;
import com.tap.model.Menu;
import com.tap.util.DataBaseConnection;

public class MenuDAOImplimentaion implements MenuDAO {

	private static final String INSERT_MENU_QUERY = "INSERT INTO `menu` (`itemName`,`description`,`price`,`category`,`isAvailable`,`restaruantId`,`ratings`,`image`)"
			+ "VALUES(?,?,?,?,?,?)";
	private static final String UPDATE_MENU_QUERY = "UPDATE `menu` SET `itemName`= ?, `description` = ?, `price` = ?, `isAvailable` = ?, `restaruantId` = ?, `ratings` = ?, `image` = ? WHERE `menuId` = ?";
	private static final String DELETE_MENU_QUERY = "DELETE FROM `menu` WHERE `menuId` = ?";
	private static final String GET_MENU_QUERY = "SELECT * FROM `menu` WHERE `menuId` = ?";
	private static final String GET_ALL_MENUS_QUERY = "SELECT * FROM `menu`";
	private static final String GET_MENU_BY_RESTAURANT_ID_QUERY = "SELECT * FROM `menu` WHERE `restaruantId` = ?";
	

	@Override
	public void addMenu(Menu menu) {
		
		try(Connection connection = DataBaseConnection.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(INSERT_MENU_QUERY )) {
			
			preparedStatement.setString(1, menu.getItemName());
			preparedStatement.setString(2,menu.getDescription());
			preparedStatement.setInt(3,menu.getPrice());
			preparedStatement.setString(4,menu.getCategory());
			preparedStatement.setBoolean(5,menu.getIsAvailable());
			preparedStatement.setInt(6,menu.getRestaurantId());
			preparedStatement.setDouble(7,menu.getRatings());
			preparedStatement.setString(8,menu.getImage());
			
			
			int executeUpdate = preparedStatement.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void updateMenu(Menu menu) {
		
		try(Connection connection = DataBaseConnection.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_MENU_QUERY) ) {
			
			
			preparedStatement.setString(1, menu.getItemName());
			preparedStatement.setString(2,menu.getDescription());
			preparedStatement.setInt(3,menu.getPrice());
			preparedStatement.setBoolean(4,menu.getIsAvailable());
			preparedStatement.setInt(5,menu.getRestaurantId());
			preparedStatement.setInt(6,menu.getMenuId());
			preparedStatement.setDouble(7,menu.getRatings());
			preparedStatement.setString(8,menu.getImage());
			
			int executeUpdate = preparedStatement.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void deleteMenu(int menuId) {
		
		try(Connection connection = DataBaseConnection.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(DELETE_MENU_QUERY)) {
			
			preparedStatement.setInt(1, menuId);
			
			int executeUpdate = preparedStatement.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public Menu getMenu(int menuId) {
		
		Menu menu = null;
		try(Connection connection = DataBaseConnection.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(GET_MENU_QUERY)) {
		
			preparedStatement.setInt(1, menuId);
			
			ResultSet resultSet = preparedStatement.executeQuery();
			
			if (resultSet.next()) {
			    menu = extractMenu(resultSet);
			}	
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return menu;
	}

	@Override
	public List<Menu> getAllMenu() {
		
		Menu menu = null;
		ArrayList<Menu> arrayList = new ArrayList<>();
		try(Connection connection = DataBaseConnection.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(GET_ALL_MENUS_QUERY)) {
			
			
			ResultSet resultSet = preparedStatement.executeQuery();
			
			while(resultSet.next()) {
				menu = extractMenu(resultSet);
				arrayList.add(menu);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return arrayList;
	}
	
	@Override
	public List<Menu> getAllMenuByRestaurantId(int restaurantId) {
		
		Menu menu = null;
		ArrayList<Menu> arrayList = new ArrayList<>();
		try(Connection connection = DataBaseConnection.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(GET_MENU_BY_RESTAURANT_ID_QUERY)) {
			
			preparedStatement.setInt(1, restaurantId );
			
			ResultSet resultSet = preparedStatement.executeQuery();
			
			while(resultSet.next()) {
				menu = extractMenu(resultSet);
				arrayList.add(menu);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return arrayList;
	}
	
	
	
	Menu extractMenu(ResultSet resultSet) throws SQLException {
	
		int menuId = resultSet.getInt("menuId");
		String itemName = resultSet.getString("itemName");
		String description = resultSet.getString("description");
		int price = resultSet.getInt("price");
		String category = resultSet.getString("category");
		boolean isAvailable = resultSet.getBoolean("isAvailable");
		int restaruantId = resultSet.getInt("restaruantId");
		double ratings = resultSet.getDouble("ratings");
		String image = resultSet.getString("image");
		
		Menu menu = new Menu(menuId, itemName, description, price, category, isAvailable, restaruantId, ratings, image);
		
		return menu;
	}
	
	

}
