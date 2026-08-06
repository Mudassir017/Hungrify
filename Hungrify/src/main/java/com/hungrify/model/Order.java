package com.hungrify.model;

import java.util.Date;

public class Order {
	private int orderId;
	private int userId;
	private int restaurantId;
	private Date orderDate;
	private double totalAmount;
	private String status;
	private String paymentMethod;
	
	private String restaurantName;
	private double subTotal;
	private double deliveryFee;
	private double platformFee;
	private double gst;
	private double discount;

	public double getSubTotal() {
		return subTotal;
	}

	public void setSubTotal(double subTotal) {
		this.subTotal = subTotal;
	}

	public double getDeliveryFee() {
		return deliveryFee;
	}

	public void setDeliveryFee(double deliveryFee) {
		this.deliveryFee = deliveryFee;
	}

	public double getPlatformFee() {
		return platformFee;
	}

	public void setPlatformFee(double platformFee) {
		this.platformFee = platformFee;
	}

	public double getGst() {
		return gst;
	}

	public void setGst(double gst) {
		this.gst = gst;
	}

	public double getDiscount() {
		return discount;
	}

	public void setDiscount(double discount) {
		this.discount = discount;
	}

	public Order(
	        int userId,
	        int restaurantId,
	        Date orderDate,
	        double totalAmount,
	        double subTotal,
	        double deliveryFee,
	        double platformFee,
	        double gst,
	        double discount,
	        String status,
	        String paymentMethod) {

	    this.userId = userId;
	    this.restaurantId = restaurantId;
	    this.orderDate = orderDate;
	    this.totalAmount = totalAmount;
	    this.subTotal = subTotal;
	    this.deliveryFee = deliveryFee;
	    this.platformFee = platformFee;
	    this.gst = gst;
	    this.discount = discount;
	    this.status = status;
	    this.paymentMethod = paymentMethod;
	}

	public Order(int orderId, int userId, int restaurantId, Date orderDate, double totalAmount, String status,
			String paymentMethod, String restaurantName, double subTotal, double deliveryFee, double platformFee,
			double gst, double discount) {
		super();
		this.orderId = orderId;
		this.userId = userId;
		this.restaurantId = restaurantId;
		this.orderDate = orderDate;
		this.totalAmount = totalAmount;
		this.status = status;
		this.paymentMethod = paymentMethod;
		this.restaurantName = restaurantName;
		this.subTotal = subTotal;
		this.deliveryFee = deliveryFee;
		this.platformFee = platformFee;
		this.gst = gst;
		this.discount = discount;
	}

	public Order() {
		
	}

	public Order(int orderId, int userId, int restaurantId, Date orderDate, double totalAmount, String status,
			String paymentMethod) {
		super();
		this.orderId = orderId;
		this.userId = userId;
		this.restaurantId = restaurantId;
		this.orderDate = orderDate;
		this.totalAmount = totalAmount;
		this.status = status;
		this.paymentMethod = paymentMethod;
	}

	public Order(int userId, int restaurantId, Date orderDate, double totalAmount, String status,
			String paymentMethod) {
		super();
		this.userId = userId;
		this.restaurantId = restaurantId;
		this.orderDate = orderDate;
		this.totalAmount = totalAmount;
		this.status = status;
		this.paymentMethod = paymentMethod;
	}

	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getRestaurantId() {
		return restaurantId;
	}

	public void setRestaurantId(int restaurantId) {
		this.restaurantId = restaurantId;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public double getTotalAmount() {
		return totalAmount;
	}

	public void setTotalAmount(double totalAmount) {
		this.totalAmount = totalAmount;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getPaymentMethod() {
		return paymentMethod;
	}

	public void setPaymentMethod(String paymentMethod) {
		this.paymentMethod = paymentMethod;
	}
	
	public String getRestaurantName() {
		return restaurantName;
	}

	public void setRestaurantName(String restaurantName) {
		this.restaurantName = restaurantName;
	}

	@Override
	public String toString() {
		return "Order [orderId=" + orderId + ", userId=" + userId + ", restaurantId=" + restaurantId + ", orderDate="
				+ orderDate + ", totalAmount=" + totalAmount + ", status=" + status + ", paymentMethod=" + paymentMethod
				+ "]";
	}
	
	
}
