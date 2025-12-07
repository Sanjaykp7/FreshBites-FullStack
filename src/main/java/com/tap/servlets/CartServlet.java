package com.tap.servlets;

import java.io.IOException;

import com.tap.daoimplementation.MenuDAOImplimentaion;
import com.tap.model.Cart;
import com.tap.model.CartItem;
import com.tap.model.Menu;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/cart")
public class CartServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    		
        HttpSession session = req.getSession();
       
        Cart cart = (Cart) session.getAttribute("cart");

        int newRestaurantId = Integer.parseInt(req.getParameter("restaurantId"));

        // Fix: safely get current restaurantId
        Integer currentRestaurantId = (Integer) session.getAttribute("restaurantId");

        // If cart does not exist OR restaurant changed → reset cart
        if(cart == null || currentRestaurantId == null || newRestaurantId != currentRestaurantId) {
            cart = new Cart();
            session.setAttribute("cart", cart);
            session.setAttribute("restaurantId", newRestaurantId);
        }

        String action = req.getParameter("action");

        if("addToCart".equals(action)) {

            int itemId = Integer.parseInt(req.getParameter("itemId"));
            int quantity = Integer.parseInt(req.getParameter("quantity"));

            MenuDAOImplimentaion menuDAOImplimentaion = new MenuDAOImplimentaion();
            Menu menuItem = menuDAOImplimentaion.getMenu(itemId);

            String itemName = menuItem.getItemName();
            int price = menuItem.getPrice();

            CartItem cartItem = new CartItem(itemId, itemName, price, quantity);

            cart.addCartItems(cartItem);
        }
        else if("updateCart".equals(action)) {

            int itemId = Integer.parseInt(req.getParameter("itemId"));
            int quantity = Integer.parseInt(req.getParameter("quantity"));

            cart.updateCartItems(itemId, quantity);
        }
        else if("removeFromCart".equals(action)) {

            int itemId = Integer.parseInt(req.getParameter("itemId"));

            cart.deleteCartItems(itemId);
        }
        
        if("addToCart".equals(action)) {
        		resp.sendRedirect("menu?restaurantId="+ newRestaurantId);
        }
        else {
        		resp.sendRedirect("cart.jsp");
        }
        
    }
}

