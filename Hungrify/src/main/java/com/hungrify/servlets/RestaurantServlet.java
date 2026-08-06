package com.hungrify.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import com.hungrify.DAOImpl.RestaurantDAOImpl;
import com.hungrify.model.Restaurant;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/restaurant")
public class RestaurantServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RestaurantDAOImpl restaurantDAOImpl = new RestaurantDAOImpl();
		List<Restaurant> allRestaurants = restaurantDAOImpl.getAllRestaurant();
		
		req.setAttribute("allRestaurants", allRestaurants);
		
		RequestDispatcher rd = req.getRequestDispatcher("restaurant.jsp");
		rd.forward(req, resp);
	}
}
