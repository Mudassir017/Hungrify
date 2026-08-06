package com.hungrify.DAOImpl;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.hungrify.DAO.AddressDAO;
import com.hungrify.model.Address;
import com.hungrify.utility.DBConnection;

public class AddressDAOImpl implements AddressDAO {

    private Connection con;
    private PreparedStatement pstmt;
    private ResultSet res;

    private static final String INSERT_ADDRESS =
            "INSERT INTO addresses(userId,fullName,phone,addressType,houseNo,area,landmark,city,state,pincode,isDefault) VALUES(?,?,?,?,?,?,?,?,?,?,?)";

    private static final String GET_ALL_ADDRESSES =
            "SELECT * FROM addresses WHERE userId=?";

    private static final String UPDATE_ADDRESS =
            "UPDATE addresses SET fullName=?, phone=?, addressType=?, houseNo=?, area=?, landmark=?, city=?, state=?, pincode=? WHERE addressId=?";

    private static final String DELETE_ADDRESS =
            "DELETE FROM addresses WHERE addressId=?";

    private static final String REMOVE_DEFAULT =
            "UPDATE addresses SET isDefault=0 WHERE userId=?";

    private static final String SET_DEFAULT =
            "UPDATE addresses SET isDefault=1 WHERE addressId=?";
    
    private static final String GET_DEFAULT_ADDRESS =
            "SELECT * FROM addresses WHERE userId=? AND isDefault=1 LIMIT 1";

    public AddressDAOImpl() {
        con = DBConnection.getConnection();
    }

    @Override
    public Address addAddress(Address address) {

        try {

            if(address.isDefault()) {

                pstmt = con.prepareStatement(REMOVE_DEFAULT);
                pstmt.setInt(1, address.getUserId());
                pstmt.executeUpdate();
            }

            pstmt = con.prepareStatement(INSERT_ADDRESS);

            pstmt.setInt(1, address.getUserId());
            pstmt.setString(2, address.getFullName());
            pstmt.setString(3, address.getPhone());
            pstmt.setString(4, address.getAddressType());
            pstmt.setString(5, address.getHouseNo());
            pstmt.setString(6, address.getArea());
            pstmt.setString(7, address.getLandmark());
            pstmt.setString(8, address.getCity());
            pstmt.setString(9, address.getState());
            pstmt.setString(10, address.getPincode());
            pstmt.setBoolean(11, address.isDefault());

            int rows = pstmt.executeUpdate();

            if(rows > 0) {
                return address;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }

    @Override
    public Address getAddressByUserId(int userId) {

        try {

            pstmt = con.prepareStatement(GET_DEFAULT_ADDRESS);
            pstmt.setInt(1, userId);

            res = pstmt.executeQuery();

            if(res.next()) {
                return extractAddress(res);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }

    @Override
    public List<Address> getAllAddresses(int userId) {

        List<Address> list = new ArrayList<>();

        try {

            pstmt = con.prepareStatement(GET_ALL_ADDRESSES);
            pstmt.setInt(1, userId);

            res = pstmt.executeQuery();

            while(res.next()) {
                list.add(extractAddress(res));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    @Override
    public boolean updateAddress(Address address) {

        try {

            pstmt = con.prepareStatement(UPDATE_ADDRESS);

            pstmt.setString(1, address.getFullName());
            pstmt.setString(2, address.getPhone());
            pstmt.setString(3, address.getAddressType());
            pstmt.setString(4, address.getHouseNo());
            pstmt.setString(5, address.getArea());
            pstmt.setString(6, address.getLandmark());
            pstmt.setString(7, address.getCity());
            pstmt.setString(8, address.getState());
            pstmt.setString(9, address.getPincode());
            pstmt.setInt(10, address.getAddressId());

            return pstmt.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    @Override
    public boolean deleteAddress(int addressId) {

        try {

            pstmt = con.prepareStatement(DELETE_ADDRESS);
            pstmt.setInt(1, addressId);

            return pstmt.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    @Override
    public boolean setDefaultAddress(int addressId, int userId) {

        try {

            pstmt = con.prepareStatement(REMOVE_DEFAULT);
            pstmt.setInt(1, userId);
            pstmt.executeUpdate();

            pstmt = con.prepareStatement(SET_DEFAULT);
            pstmt.setInt(1, addressId);

            return pstmt.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    private Address extractAddress(ResultSet rs) throws SQLException {

        return new Address(

                rs.getInt("addressId"),
                rs.getInt("userId"),
                rs.getString("fullName"),
                rs.getString("phone"),
                rs.getString("addressType"),
                rs.getString("houseNo"),
                rs.getString("area"),
                rs.getString("landmark"),
                rs.getString("city"),
                rs.getString("state"),
                rs.getString("pincode"),
                rs.getBoolean("isDefault")

        );
    }
    
    @Override
    public Address getDefaultAddress(int userId) {

        try (Connection con = DBConnection.getConnection();
             PreparedStatement pstmt = con.prepareStatement(GET_DEFAULT_ADDRESS)) {

            pstmt.setInt(1, userId);

            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {

                return new Address(

                        rs.getInt("addressId"),
                        rs.getInt("userId"),

                        rs.getString("fullName"),
                        rs.getString("phone"),

                        rs.getString("addressType"),

                        rs.getString("houseNo"),
                        rs.getString("area"),
                        rs.getString("landmark"),

                        rs.getString("city"),
                        rs.getString("state"),
                        rs.getString("pincode"),

                        rs.getBoolean("isDefault")

                );
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

}