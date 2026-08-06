package com.hungrify.DAOImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.hungrify.DAO.MenuDAO;
import com.hungrify.model.Menu;
import com.hungrify.utility.DBConnection;

public class MenuDAOImpl implements MenuDAO{
	
	private static final String INSERT_QUERY =
	        "INSERT INTO menu(restaurantId, categoryId, itemName, description, price, imageUrl, isAvailable) VALUES (?,?,?,?,?,?,?)";

	private static final String GET_ALL_MENU =
	        "SELECT * FROM menu";

	private static final String GET_MENU_BY_ID =
	        "SELECT * FROM menu WHERE menuId = ?";

	private static final String GET_MENU_BY_RESTAURANT_ID =
	        "SELECT * FROM menu WHERE restaurantId = ?";

	private static final String GET_MENU_BY_CATEGORY_ID =
	        "SELECT * FROM menu WHERE categoryId = ?";

	private static final String SEARCH_MENU =
	        "SELECT * FROM menu WHERE itemName LIKE ?";

	private static final String UPDATE_MENU =
	        "UPDATE menu SET restaurantId=?, categoryId=?, itemName=?, description=?, price=?, imageUrl=?, isAvailable=? WHERE menuId=?";

	private static final String DELETE_MENU =
	        "DELETE FROM menu WHERE menuId=?";
	
	private static final String GET_RECOMMENDED_MENU =
	        "SELECT * FROM menu WHERE restaurantId = ? AND isAvailable = 1 LIMIT 4";

	@Override
	public int addMenu(Menu menu) {

	    try (
	        Connection connection = DBConnection.getConnection();
	        PreparedStatement pstmt = connection.prepareStatement(INSERT_QUERY);
	    ) {

	        pstmt.setInt(1, menu.getRestaurantId());
	        pstmt.setInt(2, menu.getCategoryId());
	        pstmt.setString(3, menu.getItemName());
	        pstmt.setString(4, menu.getDescription());
	        pstmt.setDouble(5, menu.getPrice());
	        pstmt.setString(6, menu.getImageUrl());
	        pstmt.setBoolean(7, menu.isAvailable());

	        return pstmt.executeUpdate();

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return 0;
	}

	@Override
	public List<Menu> getAllMenuItems() {

	    List<Menu> menuList = new ArrayList<>();

	    try (
	        Connection connection = DBConnection.getConnection();
	        PreparedStatement pstmt = connection.prepareStatement(GET_ALL_MENU);
	    ) {

	        ResultSet rs = pstmt.executeQuery();

	        while (rs.next()) {
	            menuList.add(extractMenuFromResultSet(rs));
	        }

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return menuList;
	}
	
	@Override
	public Menu getMenuById(int menuId) {

	    try (
	        Connection connection = DBConnection.getConnection();
	        PreparedStatement pstmt = connection.prepareStatement(GET_MENU_BY_ID);
	    ) {

	        pstmt.setInt(1, menuId);

	        ResultSet rs = pstmt.executeQuery();

	        if (rs.next()) {
	            return extractMenuFromResultSet(rs);
	        }

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return null;
	}

	@Override
	public List<Menu> getMenuByRestaurantId(int restaurantId) {
		ArrayList<Menu> menuList = new ArrayList<Menu>();
		Connection connection = DBConnection.getConnection();
		try {
			PreparedStatement pstmt = connection.prepareStatement(GET_MENU_BY_RESTAURANT_ID);
			pstmt.setInt(1, restaurantId);
			
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				Menu menuFromResultSet = extractMenuFromResultSet(rs);
				menuList.add(menuFromResultSet);
			}
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return menuList;
	}

	@Override
	public List<Menu> getMenuByCategoryId(int categoryId) {

	    List<Menu> menuList = new ArrayList<>();

	    try (
	        Connection connection = DBConnection.getConnection();
	        PreparedStatement pstmt = connection.prepareStatement(GET_MENU_BY_CATEGORY_ID);
	    ) {

	        pstmt.setInt(1, categoryId);

	        ResultSet rs = pstmt.executeQuery();

	        while (rs.next()) {
	            menuList.add(extractMenuFromResultSet(rs));
	        }

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return menuList;
	}

	@Override
	public List<Menu> searchMenu(String keyword) {

	    List<Menu> menuList = new ArrayList<>();

	    try (
	        Connection connection = DBConnection.getConnection();
	        PreparedStatement pstmt = connection.prepareStatement(SEARCH_MENU);
	    ) {

	        pstmt.setString(1, "%" + keyword + "%");

	        ResultSet rs = pstmt.executeQuery();

	        while (rs.next()) {
	            menuList.add(extractMenuFromResultSet(rs));
	        }

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return menuList;
	}

	@Override
	public int updateMenu(Menu menu) {

	    try (
	        Connection connection = DBConnection.getConnection();
	        PreparedStatement pstmt = connection.prepareStatement(UPDATE_MENU);
	    ) {

	        pstmt.setInt(1, menu.getRestaurantId());
	        pstmt.setInt(2, menu.getCategoryId());
	        pstmt.setString(3, menu.getItemName());
	        pstmt.setString(4, menu.getDescription());
	        pstmt.setDouble(5, menu.getPrice());
	        pstmt.setString(6, menu.getImageUrl());
	        pstmt.setBoolean(7, menu.isAvailable());

	        pstmt.setInt(8, menu.getMenuId());

	        return pstmt.executeUpdate();

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return 0;
	}

	@Override
	public int deleteMenu(int menuId) {

	    try (
	        Connection connection = DBConnection.getConnection();
	        PreparedStatement pstmt = connection.prepareStatement(DELETE_MENU);
	    ) {

	        pstmt.setInt(1, menuId);

	        return pstmt.executeUpdate();

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return 0;
	}
	
	@Override
	public List<Menu> getRecommendedMenus(int restaurantId) {

	    List<Menu> recommendedMenus = new ArrayList<>();

	    try (Connection con = DBConnection.getConnection();
	         PreparedStatement pstmt = con.prepareStatement(GET_RECOMMENDED_MENU)) {

	        pstmt.setInt(1, restaurantId);

	        ResultSet rs = pstmt.executeQuery();

	        while (rs.next()) {

	            recommendedMenus.add(extractMenuFromResultSet(rs));

	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return recommendedMenus;
	}
	
	
	public static Menu extractMenuFromResultSet(ResultSet rs) throws SQLException {
		int menuId = rs.getInt("menuId");
		int restaurantId = rs.getInt("restaurantId");
		int categoryId = rs.getInt("categoryId");
		String itemName = rs.getString("itemName");
		String description = rs.getString("description");
		double price = rs.getDouble("price");
		String imageUrl = rs.getString("imageUrl");
		boolean isAvailable = rs.getBoolean("isAvailable");
		
		Menu menu = new Menu(menuId, restaurantId, categoryId, itemName, description, price, imageUrl, isAvailable);
		
		return menu;
	}

}
