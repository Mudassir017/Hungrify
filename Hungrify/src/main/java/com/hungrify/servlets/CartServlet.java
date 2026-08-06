package com.hungrify.servlets;

import java.io.IOException;

import com.hungrify.DAOImpl.MenuDAOImpl;
import com.hungrify.DAOImpl.RestaurantDAOImpl;
import com.hungrify.model.Cart;
import com.hungrify.model.CartItems;
import com.hungrify.model.Menu;
import com.hungrify.model.Restaurant;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/cartServlet")
public class CartServlet extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		Cart cart = (Cart)session.getAttribute("cart");
		
		int newRestaurantId = Integer.parseInt(req.getParameter("restaurantId"));
		
		Integer restaurantId = (Integer) session.getAttribute("restaurantId");
		
		RestaurantDAOImpl restaurantDAO = new RestaurantDAOImpl();
		Restaurant restaurant = restaurantDAO.getRestaurant(newRestaurantId);
		
		session.setAttribute("restaurantName", restaurant.getRestaurantName());

		if(cart == null || restaurantId != newRestaurantId){
		    cart = new Cart();
		    session.setAttribute("cart", cart);
		    session.setAttribute("restaurantId", newRestaurantId);
		}
		
		String action = req.getParameter("action");
		
		if(action.equals("add")) {
			addItemToCart(req, cart);
		}
		else if(action.equals("update")) {
			updateCartItem(req, cart);
		}
		else if(action.equals("remove")) {
			removeItemFromCart(req, cart);
		}
		
		RequestDispatcher rd = req.getRequestDispatcher("cart.jsp");
		rd.forward(req, resp);
		
//		resp.sendRedirect("menu?restaurantId=" + newRestaurantId);
		
	}

	private void addItemToCart(HttpServletRequest req, Cart cart) {
		int menuId = Integer.parseInt(req.getParameter("menuId"));
		int qty = Integer.parseInt(req.getParameter("quantity"));
		
		MenuDAOImpl menuDAOImpl = new MenuDAOImpl();
		Menu menu = menuDAOImpl.getMenuById(menuId);
		
		HttpSession session = req.getSession();
		session.setAttribute("restaurantId", menu.getRestaurantId());
		
		CartItems cartItems = new CartItems(menu.getMenuId(), menu.getRestaurantId(), menu.getItemName(), menu.getPrice(), qty);
		
		cart.addItem(cartItems);
	}
	
	private void updateCartItem(HttpServletRequest req, Cart cart) {
		int menuId = Integer.parseInt(req.getParameter("menuId"));
		int quantity = Integer.parseInt(req.getParameter("quantity"));
		
		cart.updateItem(menuId, quantity);
		
	}
	
	private void removeItemFromCart(HttpServletRequest req, Cart cart) {
		int menuId = Integer.parseInt(req.getParameter("menuId"));
		cart.remove(menuId);
	}


	
}
