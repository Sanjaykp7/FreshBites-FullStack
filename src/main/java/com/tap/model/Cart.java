package com.tap.model;

import java.util.HashMap;

public class Cart {

	HashMap<Integer,CartItem> cartItems = new HashMap<Integer,CartItem>();

	// Adding items to the cart
	public void addCartItems(CartItem cartItem) {
		int itemId = cartItem.getItemId();

		if(!cartItems.containsKey(itemId)) {
			cartItems.put(itemId,cartItem);			
		}
		else {
			CartItem existingItem = cartItems.get(itemId);
			existingItem.setQuantity(existingItem.getQuantity() + 1);

			cartItems.put(itemId,existingItem);						
		}
	}

	// Updating Quantity of an item 
	public void updateCartItems(int itemId, int newQuantity) {

		if(cartItems.containsKey(itemId)) {
			if(newQuantity <= 0) {
				cartItems.remove(itemId);
			}
			else {
				cartItems.get(itemId).setQuantity(newQuantity);
//				CartItem existingItem = cartItems.get(itemId);
//				existingItem.setQuantity(newQuantity);
//				cartItems.put(itemId, existingItem);				
			}
		}
	}

	// Deleting the item
	public void deleteCartItems(int itemId) {
		
		if(cartItems.containsKey(itemId)) {
			cartItems.remove(itemId);
		}
	}

	public HashMap<Integer, CartItem> getCartItems() {
	    return cartItems;
	}
	
	
	
}
