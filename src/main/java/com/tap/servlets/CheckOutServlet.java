package com.tap.servlets;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;

import com.mysql.cj.Session;
import com.tap.daoimplementation.OrderDAOImplimentation;
import com.tap.daoimplementation.OrderItemDAOImplimentation;
import com.tap.model.Cart;
import com.tap.model.CartItem;
import com.tap.model.Order;
import com.tap.model.OrderItem;
import com.tap.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebServlet("/CheckoutServlet")
public class CheckOutServlet extends HttpServlet{

	private OrderDAOImplimentation orderDAOImplimentation;
	User user = new User();
	Cart cart = new Cart();
	@Override
	public void init() throws ServletException {
		orderDAOImplimentation = new OrderDAOImplimentation(); 
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();
		Cart cart = (Cart) session.getAttribute("cart");

		if(cart != null && !cart.getCartItems().isEmpty()) {

			Order order = new Order();
			order.setRestaurantId((int) session.getAttribute("restaurantId"));
			order.setDeliveryAddress((String) req.getParameter("address"));
			order.setPaymentMethod((String) req.getParameter("paymentMethod"));
			order.setStatus("confirmed");
			order.setTotalAmount((int)session.getAttribute("totalAmount"));
			order.setUserId(2);
			order.setOrderDate(new Timestamp(new Date().getTime()));

			int orderId = orderDAOImplimentation.addOrder(order);

			for(CartItem item : cart.getCartItems().values()) {
				int quantity = item.getQuantity();
				int itemId = item.getItemId();
				int price = item.getPrice();

				int totalPrice = price * quantity;

				OrderItem orderItem = new OrderItem(orderId, itemId, quantity, totalPrice);

				OrderItemDAOImplimentation orderItemDAOImplimentation = new OrderItemDAOImplimentation();
				orderItemDAOImplimentation.addOrderItem(orderItem);

			}


			//open one thank u page 
			resp.sendRedirect("orderConfirmation.jsp");
			//then remove the cart from session so all items in cart after placing the order will get deleted
			session.removeAttribute("cart");
		}
		else {
			//if cart is empty then redirect it to the cart page
			resp.sendRedirect("cart.jsp");
		}


	}
}
