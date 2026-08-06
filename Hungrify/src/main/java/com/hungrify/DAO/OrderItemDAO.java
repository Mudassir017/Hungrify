package com.hungrify.DAO;

import java.util.List;

import com.hungrify.model.OrderItem;

public interface OrderItemDAO {

	// Add a new order item
	OrderItem addOrderItem(OrderItem orderItem);

	// Get order item by ID
	OrderItem getOrderItemById(int orderItemId);

	// Get all items of a particular order
	List<OrderItem> getOrderItemsByOrderId(int orderId);

	// Update order item
	boolean updateOrderItem(OrderItem orderItem);

	// Delete order item
	boolean deleteOrderItem(int orderItemId);

	// Get all order items
	List<OrderItem> getAllOrderItems();
}