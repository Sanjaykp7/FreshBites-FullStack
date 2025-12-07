package com.tap.servlets;

import java.io.IOException; 
import java.util.List;

import com.tap.daoimplementation.MenuDAOImplimentaion;
import com.tap.model.Menu;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/menu")
public class MenuServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		int restaurantId = Integer.parseInt(req.getParameter("restaurantId"));
		
		HttpSession session = req.getSession();
		session.setAttribute("restaurantName",restaurantId);
	
		MenuDAOImplimentaion menuDAOImplimentaion = new MenuDAOImplimentaion();
		List<Menu> allMenuByRestaurantId = menuDAOImplimentaion.getAllMenuByRestaurantId(restaurantId);
			
		req.setAttribute("menus", allMenuByRestaurantId);
		
		RequestDispatcher requestDispatcher = req.getRequestDispatcher("menu.jsp");
		requestDispatcher.forward(req, resp);
		
	}
}
