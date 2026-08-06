package com.hungrify.DAOImpl;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.hungrify.DAO.OrderDAO;
import com.hungrify.model.Order;
import com.hungrify.utility.DBConnection;


public class OrderDAOImpl implements OrderDAO {

	private static final String INSERT_ORDER =
			"INSERT INTO orders(userId, restaurantId, totalAmount, subTotal, deliveryFee, platformFee, gst, discount, orderStatus, paymentMethod, orderDate) VALUES(?,?,?,?,?,?,?,?,?,?,?)";

    private static final String GET_ORDER =
    	    "SELECT o.*, r.name AS restaurantName " +
    	    "FROM orders o " +
    	    "JOIN restaurants r ON o.restaurantId = r.restaurantId " +
    	    "WHERE o.orderId = ?";

    private static final String GET_USER_ORDERS =
    	    "SELECT o.*, r.name AS restaurantName " +
    	    "FROM orders o " +
    	    "INNER JOIN restaurants r ON o.restaurantId = r.restaurantId " +
    	    "WHERE o.userId = ? " +
    	    "ORDER BY o.orderDate DESC";

    private static final String GET_ALL_ORDERS =
            "SELECT * FROM orders";

    private static final String UPDATE_ORDER =
            "UPDATE orders SET userId=?, restaurantId=?, totalAmount=?, orderStatus=?, paymentMethod=?, orderDate=? WHERE orderId=?";

    private static final String UPDATE_STATUS =
            "UPDATE orders SET orderStatus=? WHERE orderId=?";

    private static final String DELETE_ORDER =
            "DELETE FROM orders WHERE orderId=?";
    
    private static final String GET_ORDERS_BY_RESTAURANT =
            "SELECT * FROM orders WHERE restaurantId = ? ORDER BY orderDate DESC";

    @Override
    public Order addOrder(Order order) {

        try (Connection con = DBConnection.getConnection();
             PreparedStatement pstmt = con.prepareStatement(INSERT_ORDER, Statement.RETURN_GENERATED_KEYS)) {

        	pstmt.setInt(1, order.getUserId());
        	pstmt.setInt(2, order.getRestaurantId());

        	pstmt.setDouble(3, order.getTotalAmount());

        	pstmt.setDouble(4, order.getSubTotal());
        	pstmt.setDouble(5, order.getDeliveryFee());
        	pstmt.setDouble(6, order.getPlatformFee());
        	pstmt.setDouble(7, order.getGst());
        	pstmt.setDouble(8, order.getDiscount());

        	pstmt.setString(9, order.getStatus());
        	pstmt.setString(10, order.getPaymentMethod());
        	pstmt.setDate(11, new Date(order.getOrderDate().getTime()));

            int rows = pstmt.executeUpdate();

            if (rows > 0) {

                ResultSet rs = pstmt.getGeneratedKeys();

                if (rs.next()) {
                    order.setOrderId(rs.getInt(1));
                }

                return order;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    @Override
    public Order getOrderById(int orderId) {

        try (Connection con = DBConnection.getConnection();
             PreparedStatement pstmt = con.prepareStatement(GET_ORDER)) {

            pstmt.setInt(1, orderId);

            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                return extractOrder(rs);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    @Override
    public List<Order> getOrdersByUserId(int userId) {

        List<Order> list = new ArrayList<>();

        try (Connection con = DBConnection.getConnection();
             PreparedStatement pstmt = con.prepareStatement(GET_USER_ORDERS)) {

            pstmt.setInt(1, userId);

            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                list.add(extractOrder(rs));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    @Override
    public List<Order> getAllOrders() {

        List<Order> list = new ArrayList<>();

        try (Connection con = DBConnection.getConnection();
             PreparedStatement pstmt = con.prepareStatement(GET_ALL_ORDERS)) {

            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                list.add(extractOrder(rs));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    @Override
    public boolean updateOrder(Order order) {

        try (Connection con = DBConnection.getConnection();
             PreparedStatement pstmt = con.prepareStatement(UPDATE_ORDER)) {

            pstmt.setInt(1, order.getUserId());
            pstmt.setInt(2, order.getRestaurantId());
            pstmt.setDouble(3, order.getTotalAmount());
            pstmt.setString(4, order.getStatus());
            pstmt.setString(5, order.getPaymentMethod());
            pstmt.setDate(6, new Date(order.getOrderDate().getTime()));
            pstmt.setInt(7, order.getOrderId());

            return pstmt.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    @Override
    public boolean updateOrderStatus(int orderId, String status) {

        try (Connection con = DBConnection.getConnection();
             PreparedStatement pstmt = con.prepareStatement(UPDATE_STATUS)) {

            pstmt.setString(1, status);
            pstmt.setInt(2, orderId);

            return pstmt.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    @Override
    public boolean deleteOrder(int orderId) {

        try (Connection con = DBConnection.getConnection();
             PreparedStatement pstmt = con.prepareStatement(DELETE_ORDER)) {

            pstmt.setInt(1, orderId);

            return pstmt.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    private Order extractOrder(ResultSet rs) throws Exception {

        Order order = new Order();

        order.setOrderId(rs.getInt("orderId"));
        order.setUserId(rs.getInt("userId"));
        order.setRestaurantId(rs.getInt("restaurantId"));
        order.setTotalAmount(rs.getDouble("totalAmount"));
        order.setStatus(rs.getString("orderStatus"));
        order.setPaymentMethod(rs.getString("paymentMethod"));
        order.setOrderDate(rs.getDate("orderDate"));
        order.setRestaurantName(rs.getString("restaurantName"));
        
        order.setSubTotal(rs.getDouble("subTotal"));
        order.setDeliveryFee(rs.getDouble("deliveryFee"));
        order.setPlatformFee(rs.getDouble("platformFee"));
        order.setGst(rs.getDouble("gst"));
        order.setDiscount(rs.getDouble("discount"));

        return order;
    }

    @Override
    public List<Order> getOrdersByRestaurantId(int restaurantId) {

        List<Order> orders = new ArrayList<>();

        try (Connection con = DBConnection.getConnection();
             PreparedStatement pstmt = con.prepareStatement(GET_ORDERS_BY_RESTAURANT)) {

            pstmt.setInt(1, restaurantId);

            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                orders.add(extractOrder(rs));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return orders;
    }
}