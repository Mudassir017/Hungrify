package com.hungrify.model;

public class OrderItem {

	private int orderItemId;
	private int orderId;
	private int menuId;
	private int quantity;
	private double itemTotal;
	
	private String itemName;
	private String imageUrl;
	
	public OrderItem(int orderItemId, int orderId, int menuId, int quantity, double itemTotal, String itemName,
			String imageUrl) {
		super();
		this.orderItemId = orderItemId;
		this.orderId = orderId;
		this.menuId = menuId;
		this.quantity = quantity;
		this.itemTotal = itemTotal;
		this.itemName = itemName;
		this.imageUrl = imageUrl;
	}
	
	

	public String getItemName() {
		return itemName;
	}



	public void setItemName(String itemName) {
		this.itemName = itemName;
	}



	public String getImageUrl() {
		return imageUrl;
	}



	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}



	public OrderItem(int orderId, int menuId, int quantity, double itemTotal, String itemName, String imageUrl) {
		super();
		this.orderId = orderId;
		this.menuId = menuId;
		this.quantity = quantity;
		this.itemTotal = itemTotal;
		this.itemName = itemName;
		this.imageUrl = imageUrl;
	}



	public OrderItem() {
		
	}
	
	public OrderItem(int orderItemId, int orderId, int menuId, int quantity, double itemTotal) {
		super();
		this.orderItemId = orderItemId;
		this.orderId = orderId;
		this.menuId = menuId;
		this.quantity = quantity;
		this.itemTotal = itemTotal;
	}

	public OrderItem(int orderId, int menuId, int quantity, double itemTotal) {
		super();
		this.orderId = orderId;
		this.menuId = menuId;
		this.quantity = quantity;
		this.itemTotal = itemTotal;
	}

	public int getOrderItemId() {
		return orderItemId;
	}

	public void setOrderItemId(int orderItemId) {
		this.orderItemId = orderItemId;
	}

	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public int getMenuId() {
		return menuId;
	}

	public void setMenuId(int menuId) {
		this.menuId = menuId;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public double getItemTotal() {
		return itemTotal;
	}

	public void setItemTotal(double itemTotal) {
		this.itemTotal = itemTotal;
	}

	@Override
	public String toString() {
		return "OrderItem [orderItemId=" + orderItemId + ", orderId=" + orderId + ", menuId=" + menuId + ", quantity="
				+ quantity + ", itemTotal=" + itemTotal + ", itemName=" + itemName + ", imageUrl=" + imageUrl + "]";
	}

}
