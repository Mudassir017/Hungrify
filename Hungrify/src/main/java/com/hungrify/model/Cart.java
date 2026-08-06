package com.hungrify.model;

import java.util.HashMap;
import java.util.Map;

public class Cart {
	Map<Integer, CartItems> items;
	
	public Cart() {
		items = new HashMap<Integer, CartItems>();
	}
	
	public Map<Integer, CartItems> getItems() {
	    return items;
	}

	public void addItem(CartItems cartItems) {
		int menuId = cartItems.getMenuId();
		
		if(items.containsKey(menuId)) {
			CartItems existingCartItem = items.get(menuId);
			existingCartItem.setQuantity(existingCartItem.getQuantity()+1);
		}
		else {
			items.put(menuId, cartItems);
		}
	}
	
	public int getTotalItems() {

	    int total = 0;

	    for(CartItems item : items.values()) {

	        total += item.getQuantity();

	    }

	    return total;
	}

	public void updateItem(int menuId, int quantity) {
		if(items.containsKey(menuId)) {
			CartItems cartItems = items.get(menuId);
			if(quantity < 1) {
				items.remove(menuId);
			}
			else {
				cartItems.setQuantity(quantity);
				items.put(menuId, cartItems);
			}
		}
		
	}
	
	public double getTotalPrice() {

	    double total = 0;

	    for (CartItems item : items.values()) {
	        total += item.getTotalPrice();   
	    }

	    return total;
	}

	public void remove(int menuId) {
		items.remove(menuId);
	}
}
