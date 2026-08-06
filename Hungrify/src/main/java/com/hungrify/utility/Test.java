package com.hungrify.utility;

import java.util.List;

import com.hungrify.DAOImpl.UserDAOImpl;
import com.hungrify.model.User;

public class Test {
	public static void main(String[] args) {
		
//		User user = new User("Mudassir", "md.@gmail.com", "mudassir123", "Lalbagh", "Admin");
		
		UserDAOImpl userDAOImpl = new UserDAOImpl();
//		userDAOImpl.addUser(user);
		
//		User user = userDAOImpl.getUser(1);
//		System.out.println(user);
		
		
		
		try {
			List<User> allUser = userDAOImpl.getAllUser();
			for(User user : allUser) {
				System.out.println(user);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
