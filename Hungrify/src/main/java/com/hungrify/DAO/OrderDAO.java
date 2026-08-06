package com.hungrify.DAO;

import java.util.List;

import com.hungrify.model.Order;

public interface OrderDAO {

	// Add new order
	Order addOrder(Order order);

	// Get order by Order ID
	Order getOrderById(int orderId);

	// Get all orders of a user
	List<Order> getOrdersByUserId(int userId);

	// Get all orders of a restaurant
	List<Order> getOrdersByRestaurantId(int restaurantId);

	// Update order details
	boolean updateOrder(Order order);

	// Update only order status
	boolean updateOrderStatus(int orderId, String status);

	// Delete order
	boolean deleteOrder(int orderId);

	// Get all orders
	List<Order> getAllOrders();
}