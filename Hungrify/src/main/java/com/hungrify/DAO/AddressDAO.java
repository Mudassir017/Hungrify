package com.hungrify.DAO;
import java.util.List;
import com.hungrify.model.Address;

public interface AddressDAO {

    Address addAddress(Address address);
    Address getAddressByUserId(int userId);
    List<Address> getAllAddresses(int userId);
    boolean updateAddress(Address address);
    boolean deleteAddress(int addressId);
    boolean setDefaultAddress(int addressId, int userId);
    Address getDefaultAddress(int userId);
}
