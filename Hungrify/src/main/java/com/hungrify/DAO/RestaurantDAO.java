package com.hungrify.DAO;

import java.util.List;

import com.hungrify.model.Restaurant;

public interface RestaurantDAO {
	void addRestaurant(Restaurant restaurant);
	Restaurant getRestaurant(int restaurantId);
	List<Restaurant> getAllRestaurant();
	int updateRestaurant(Restaurant restaurant);
	int deleteRestaurant(int restaurantId);
}
