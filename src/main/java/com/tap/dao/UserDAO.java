package com.tap.dao;

import com.tap.model.User;
import java.util.*;


public interface UserDAO {
	 List<User> getAllUsers();
	 User getUser(int userId);
	 void addUser(User user);
	 void updateUser(User user);
	 void deleteUser(int userId);
	 User getUserByEmail(String email);
	 
}
