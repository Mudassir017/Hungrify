package com.hungrify.DAOImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.hungrify.DAO.UserDAO;
import com.hungrify.model.User;
import com.hungrify.utility.DBConnection;

public class UserDAOImpl implements UserDAO {
	
	String INSERT_QUERY = "INSERT INTO users(userName, email, password, address, role, createdDate, lastLoginDate)"
			+ "VALUES (?,?,?,?,?,?,?)";

	@Override
	public int addUser(User user) {
		Connection connection = DBConnection.getConnection();
		
		try {
			PreparedStatement pstmt = connection.prepareStatement(INSERT_QUERY);
			pstmt.setString(1, user.getUserName());
			pstmt.setString(2, user.getEmail());
			pstmt.setString(3, user.getPassword());
			pstmt.setString(4, user.getAddress());
			pstmt.setString(5, user.getRole());
			pstmt.setTimestamp(6, new Timestamp(System.currentTimeMillis()));
			pstmt.setTimestamp(7, new Timestamp(System.currentTimeMillis()));
			
			return pstmt.executeUpdate();
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
		
	}

	@Override
	public User getUser(int userId) {
		User user = null;
		String GET_USER 	= "SELECT * FROM users where userId = ?";
		Connection connection = DBConnection.getConnection();
		
		try {
			PreparedStatement pstmt = connection.prepareStatement(GET_USER);
			pstmt.setInt(1, userId);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {		
				user = extractUserFromResultSet(rs);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return user;
	}

	@Override
	public List<User> getAllUser() {
		String GET_ALL_USER = "SELECT * FROM users";
		ArrayList<User> list = new ArrayList<User>();
		Connection connection = DBConnection.getConnection();
		try {
			Statement stmt = connection.createStatement();
			ResultSet rs = stmt.executeQuery(GET_ALL_USER);
			
			while(rs.next()) {
				User user = extractUserFromResultSet(rs);
				list.add(user);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}
	
	@Override
	public User getUserByEmail(String email) {

	    String GET_USER_BY_EMAIL = "SELECT * FROM users WHERE email = ?";
	    Connection connection = DBConnection.getConnection();

	    try {
	        PreparedStatement pstmt = connection.prepareStatement(GET_USER_BY_EMAIL);
	        pstmt.setString(1, email);

	        ResultSet rs = pstmt.executeQuery();

	        if (rs.next()) {
	            return extractUserFromResultSet(rs);
	        }

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return null;
	}
	
	@Override
	public User getUserByUsername(String userName) {

	    String GET_USER_BY_USERNAME = "SELECT * FROM users WHERE userName = ?";
	    Connection connection = DBConnection.getConnection();

	    try {
	        PreparedStatement pstmt = connection.prepareStatement(GET_USER_BY_USERNAME);
	        pstmt.setString(1, userName);

	        ResultSet rs = pstmt.executeQuery();

	        if (rs.next()) {
	            return extractUserFromResultSet(rs);
	        }

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return null;
	}
	
	
	
	@Override
	public boolean updateUser(User user) {

	    String UPDATE_USER = """
	            UPDATE users
	            SET userName = ?, email = ?, password = ?, address = ?, role = ?, lastLoginDate = ?
	            WHERE userId = ?
	            """;

	    Connection connection = DBConnection.getConnection();

	    try {
	        PreparedStatement pstmt = connection.prepareStatement(UPDATE_USER);

	        pstmt.setString(1, user.getUserName());
	        pstmt.setString(2, user.getEmail());
	        pstmt.setString(3, user.getPassword());
	        pstmt.setString(4, user.getAddress());
	        pstmt.setString(5, user.getRole());
	        pstmt.setTimestamp(6, new Timestamp(System.currentTimeMillis()));
	        pstmt.setInt(7, user.getUserId());

	        return pstmt.executeUpdate() > 0;
	        
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return false;
	}

	@Override
	public void deleteUser(int userId) {

	    String DELETE_USER = "DELETE FROM users WHERE userId = ?";

	    Connection connection = DBConnection.getConnection();

	    try {
	        PreparedStatement pstmt = connection.prepareStatement(DELETE_USER);

	        pstmt.setInt(1, userId);

	        pstmt.executeUpdate();

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	}
	
	
	@Override
	public boolean updatePassword(int userId, String password) {

		String UPDATE_PASSWORD = "UPDATE users SET password = ? WHERE userId = ?";
		
	    try (Connection con = DBConnection.getConnection();
	         PreparedStatement pstmt = con.prepareStatement(UPDATE_PASSWORD)) {

	        pstmt.setString(1, password);
	        pstmt.setInt(2, userId);

	        return pstmt.executeUpdate() > 0;

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return false;
	}
	
	
	public static User extractUserFromResultSet(ResultSet rs) throws SQLException {
		int id = rs.getInt("userId");
		String name = rs.getString("userName");
		String email = rs.getString("email");
		String password = rs.getString("password");
		String address = rs.getString("address");
		String role = rs.getString("role");
		Timestamp createdDate = rs.getTimestamp("createdDate");
		Timestamp lastLoginDate = rs.getTimestamp("lastLoginDate");
		
		User user = new User(id, name, email, password, address, role, createdDate, lastLoginDate);
		return user;
	}


}
