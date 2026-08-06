package com.hungrify.DAO;

import java.util.List;

import com.hungrify.model.Menu;

public interface MenuDAO {
	int addMenu(Menu menu);
	Menu getMenuById(int menuId);
	List<Menu> getAllMenuItems();
	List<Menu> getMenuByRestaurantId(int restaurantId);
	List<Menu> getMenuByCategoryId(int categoryId);
	List<Menu> searchMenu(String keyword);
	int updateMenu(Menu menu);
	int deleteMenu(int menuId);
	List<Menu> getRecommendedMenus(int restaurantId);
}
