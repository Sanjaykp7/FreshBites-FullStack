package com.tap.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import com.tap.daoimplementation.UserDAOImplimentation;
import com.tap.model.User;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/loginPage")
public class LoginServlet extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		UserDAOImplimentation userDAOImplimentation = new UserDAOImplimentation();
		
		String email = (String) req.getParameter("email");
		String password = (String) req.getParameter("password");
		
		User userByEmail = userDAOImplimentation.getUserByEmail(email);
		String orgPassword = userByEmail.getPassword();
		
		if(orgPassword.equals(password)) {
			HttpSession session = req.getSession();
			session.setAttribute("user",userByEmail);
			
			resp.sendRedirect("home");
		}
		else {
			//login failed
			 resp.sendRedirect("Login.jsp");
		}
		

	}
}
