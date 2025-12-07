package com.tap.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import com.tap.daoimplementation.RestaurantDAOImplimentation;
import com.tap.model.Restaurant;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/home")
public class HomeServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		RestaurantDAOImplimentation restaurantDAOImplimentation = new RestaurantDAOImplimentation();
		List<Restaurant> allRestaurant = restaurantDAOImplimentation.getAllRestaurant();
		
		req.setAttribute("restaurants", allRestaurant);
		
		RequestDispatcher requestDispatcher = req.getRequestDispatcher("home.jsp");
		requestDispatcher.forward(req, resp);
	
	}
}
