package com.hungrify.DAO;

import java.util.List;

import com.hungrify.model.User;

public interface UserDAO {
	int addUser(User user);
	User getUser(int userId);
	boolean updateUser(User user);
	void deleteUser(int userId);
	User getUserByEmail(String email);
	User getUserByUsername(String userName);
	List<User> getAllUser();
	boolean updatePassword(int userId, String password);
}
