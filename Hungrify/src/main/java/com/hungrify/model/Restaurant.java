package com.hungrify.model;

public class Restaurant {
	private int restaurantId;
	private String restaurantName;
	private String imageUrl;
	private String cuisine;
	private float rating;
	private String deliveryTime;
	private String address;
	
	
	public Restaurant() {
		
	}
	
	public Restaurant(String restaurantName, String imageUrl, String cuisine, float rating, String deliveryTime,
			String address) {
		super();
		this.restaurantName = restaurantName;
		this.imageUrl = imageUrl;
		this.cuisine = cuisine;
		this.rating = rating;
		this.deliveryTime = deliveryTime;
		this.address = address;
	}

	public int getRestaurantId() {
		return restaurantId;
	}

	public void setRestaurantId(int restaurantId) {
		this.restaurantId = restaurantId;
	}

	public String getRestaurantName() {
		return restaurantName;
	}

	public void setRestaurantName(String restaurantName) {
		this.restaurantName = restaurantName;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	public String getCuisine() {
		return cuisine;
	}

	public void setCuisine(String cuisine) {
		this.cuisine = cuisine;
	}

	public float getRating() {
		return rating;
	}

	public void setRating(float rating) {
		this.rating = rating;
	}

	public String getDeliveryTime() {
		return deliveryTime;
	}

	public void setDeliveryTime(String deliveryTime) {
		this.deliveryTime = deliveryTime;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Restaurant(int restaurantId, String restaurantName, String imageUrl, String cuisine, float rating,
			String deliveryTime, String address) {
		super();
		this.restaurantId = restaurantId;
		this.restaurantName = restaurantName;
		this.imageUrl = imageUrl;
		this.cuisine = cuisine;
		this.rating = rating;
		this.deliveryTime = deliveryTime;
		this.address = address;
	}

	@Override
	public String toString() {
		return "Restaurant [restaurantId=" + restaurantId + ", restaurantName=" + restaurantName + ", imageUrl="
				+ imageUrl + ", cuisine=" + cuisine + ", rating=" + rating + ", deliveryTime=" + deliveryTime
				+ ", address=" + address + "]";
	}
	
	
}
