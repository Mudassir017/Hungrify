package com.hungrify.DAOImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.hungrify.DAO.RestaurantDAO;
import com.hungrify.model.Restaurant;
import com.hungrify.model.User;
import com.hungrify.utility.DBConnection;

public class RestaurantDAOImpl implements RestaurantDAO {

	private static final String INSERT_QUERY = "INSERT INTO restaurant(name, imageUrl, cuisine, rating, deliveryTime, address)"
			+ "VALUES (?,?,?,?,?,?)";
	private static final String GET_RESTAURANT = "SELECT * FROM restaurants WHERE restaurantId = ?";
	
	private static final String GET_ALL_RESTAURANT = "SELECT * FROM restaurants";
	
	@Override
	public void addRestaurant(Restaurant restaurant) {
		
		
		Connection connection = DBConnection.getConnection();
		
		try {
			PreparedStatement pstmt = connection.prepareStatement(INSERT_QUERY);
			pstmt.setString(1, restaurant.getRestaurantName());
			pstmt.setString(2, restaurant.getImageUrl());
			pstmt.setString(3, restaurant.getCuisine());
			pstmt.setFloat(4, restaurant.getRating());
			pstmt.setString(5, restaurant.getDeliveryTime());
			pstmt.setString(6, restaurant.getAddress());
			
			int i = pstmt.executeUpdate();
			System.out.println(i);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public Restaurant getRestaurant(int restaurantId) {
		Restaurant restaurant = null;
		
		Connection connection = DBConnection.getConnection();
		
		try {
			PreparedStatement pstmt = connection.prepareStatement(GET_RESTAURANT);
			pstmt.setInt(1, restaurantId);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				restaurant = extractResFromResultSet(rs);
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return restaurant;
		
	}

	@Override
	public List<Restaurant> getAllRestaurant() {
		
		ArrayList<Restaurant> list = new ArrayList<Restaurant>();
		Connection connection = DBConnection.getConnection();
		try {
			Statement stmt = connection.createStatement();
			ResultSet rs = stmt.executeQuery(GET_ALL_RESTAURANT);
			
			while(rs.next()) {
				Restaurant restaurant = extractResFromResultSet(rs);
				list.add(restaurant);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public int updateRestaurant(Restaurant restaurant) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteRestaurant(int restaurantId) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	public static Restaurant extractResFromResultSet(ResultSet rs) throws SQLException {
		int id = rs.getInt("restaurantId");
		String name = rs.getString("name");
		String imageUrl = rs.getString("imageUrl");
		String cuisine = rs.getString("cuisine");
		float rating = rs.getFloat("rating");
		String deliveryTime = rs.getString("deliveryTime");
		String address = rs.getString("address");
		
		Restaurant restaurant = new Restaurant(id, name, imageUrl, cuisine, rating, deliveryTime, address);
		
		return restaurant;
	}
}
