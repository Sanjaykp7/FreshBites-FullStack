package com.tap.servlets;

import java.io.IOException;

import com.tap.daoimplementation.UserDAOImplimentation;
import com.tap.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/UserRegister")
public class RegisterServlet extends HttpServlet{
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name = (String) req.getParameter("name");
		String email = (String) req.getParameter("email");
		String password = (String) req.getParameter("password");
		String phone = (String) req.getParameter("phone");
		String address = (String) req.getParameter("address");
		String role = (String) req.getParameter("role");
		
		User user = new User(name, password, email, phone, address, role);
		UserDAOImplimentation userDAOImplimentation = new UserDAOImplimentation();
		userDAOImplimentation.addUser(user);
		
		resp.sendRedirect("Login.jsp");
	}

}
