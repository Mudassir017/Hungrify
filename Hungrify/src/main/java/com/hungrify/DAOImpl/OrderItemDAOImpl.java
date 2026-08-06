package com.hungrify.DAOImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.hungrify.DAO.OrderItemDAO;
import com.hungrify.model.OrderItem;
import com.hungrify.utility.DBConnection;

public class OrderItemDAOImpl implements OrderItemDAO {

	private static final String INSERT_ORDER_ITEM =
			"INSERT INTO orderitems(orderId, menuId, quantity, itemTotal) VALUES(?,?,?,?)";

	private static final String GET_ORDER_ITEM =
			"SELECT * FROM orderitems WHERE orderItemId=?";

	private static final String GET_ORDER_ITEMS_BY_ORDER =
	        "SELECT oi.*, m.itemName, m.imageUrl " +
	        "FROM orderitems oi " +
	        "JOIN menu m ON oi.menuId = m.menuId " +
	        "WHERE oi.orderId = ?";

	private static final String GET_ALL_ORDER_ITEMS =
			"SELECT * FROM orderitems";

	private static final String UPDATE_ORDER_ITEM =
			"UPDATE orderitems SET orderId=?, menuId=?, quantity=?, itemTotal=? WHERE orderItemId=?";

	private static final String DELETE_ORDER_ITEM =
			"DELETE FROM orderitems WHERE orderItemId=?";

	@Override
	public OrderItem addOrderItem(OrderItem orderItem) {

		try (Connection con = DBConnection.getConnection();
			 PreparedStatement pstmt = con.prepareStatement(INSERT_ORDER_ITEM, Statement.RETURN_GENERATED_KEYS)) {

			pstmt.setInt(1, orderItem.getOrderId());
			pstmt.setInt(2, orderItem.getMenuId());
			pstmt.setInt(3, orderItem.getQuantity());
			pstmt.setDouble(4, orderItem.getItemTotal());

			int rows = pstmt.executeUpdate();

			if (rows > 0) {

				ResultSet rs = pstmt.getGeneratedKeys();

				if (rs.next()) {
					orderItem.setOrderItemId(rs.getInt(1));
				}

				return orderItem;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

	@Override
	public OrderItem getOrderItemById(int orderItemId) {

		try (Connection con = DBConnection.getConnection();
			 PreparedStatement pstmt = con.prepareStatement(GET_ORDER_ITEM)) {

			pstmt.setInt(1, orderItemId);

			ResultSet rs = pstmt.executeQuery();

			if (rs.next()) {
				return extractOrderItem(rs);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

	@Override
	public List<OrderItem> getOrderItemsByOrderId(int orderId) {

		List<OrderItem> orderItems = new ArrayList<>();

		try (Connection con = DBConnection.getConnection();
			 PreparedStatement pstmt = con.prepareStatement(GET_ORDER_ITEMS_BY_ORDER)) {

			pstmt.setInt(1, orderId);

			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				orderItems.add(extractOrderItem(rs));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return orderItems;
	}

	@Override
	public boolean updateOrderItem(OrderItem orderItem) {

		try (Connection con = DBConnection.getConnection();
			 PreparedStatement pstmt = con.prepareStatement(UPDATE_ORDER_ITEM)) {

			pstmt.setInt(1, orderItem.getOrderId());
			pstmt.setInt(2, orderItem.getMenuId());
			pstmt.setInt(3, orderItem.getQuantity());
			pstmt.setDouble(4, orderItem.getItemTotal());
			pstmt.setInt(5, orderItem.getOrderItemId());

			return pstmt.executeUpdate() > 0;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return false;
	}

	@Override
	public boolean deleteOrderItem(int orderItemId) {

		try (Connection con = DBConnection.getConnection();
			 PreparedStatement pstmt = con.prepareStatement(DELETE_ORDER_ITEM)) {

			pstmt.setInt(1, orderItemId);

			return pstmt.executeUpdate() > 0;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return false;
	}

	@Override
	public List<OrderItem> getAllOrderItems() {

		List<OrderItem> orderItems = new ArrayList<>();

		try (Connection con = DBConnection.getConnection();
			 PreparedStatement pstmt = con.prepareStatement(GET_ALL_ORDER_ITEMS)) {

			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				orderItems.add(extractOrderItem(rs));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return orderItems;
	}

	private OrderItem extractOrderItem(ResultSet rs) throws Exception {

		OrderItem orderItem = new OrderItem();

		orderItem.setOrderItemId(rs.getInt("orderItemId"));
		orderItem.setOrderId(rs.getInt("orderId"));
		orderItem.setMenuId(rs.getInt("menuId"));
		orderItem.setQuantity(rs.getInt("quantity"));
		orderItem.setItemTotal(rs.getDouble("itemTotal"));
		orderItem.setItemName(rs.getString("itemName"));
		orderItem.setImageUrl(rs.getString("imageUrl"));

		return orderItem;
	}
}