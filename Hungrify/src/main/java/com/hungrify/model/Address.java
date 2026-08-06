package com.hungrify.model;

public class Address {

	private int addressId;
	private int userId;

	private String fullName;
	private String phone;

	private String addressType;

	private String houseNo;
	private String area;
	private String landmark;

	private String city;
	private String state;
	private String pincode;

	private boolean isDefault;

	public Address(int addressId, int userId, String fullName, String phone, String addressType, String houseNo,
			String area, String landmark, String city, String state, String pincode, boolean isDefault) {
		super();
		this.addressId = addressId;
		this.userId = userId;
		this.fullName = fullName;
		this.phone = phone;
		this.addressType = addressType;
		this.houseNo = houseNo;
		this.area = area;
		this.landmark = landmark;
		this.city = city;
		this.state = state;
		this.pincode = pincode;
		this.isDefault = isDefault;
	}

	public Address(int userId, String fullName, String phone, String addressType, String houseNo, String area,
			String landmark, String city, String state, String pincode, boolean isDefault) {
		super();
		this.userId = userId;
		this.fullName = fullName;
		this.phone = phone;
		this.addressType = addressType;
		this.houseNo = houseNo;
		this.area = area;
		this.landmark = landmark;
		this.city = city;
		this.state = state;
		this.pincode = pincode;
		this.isDefault = isDefault;
	}

	public int getAddressId() {
		return addressId;
	}

	public void setAddressId(int addressId) {
		this.addressId = addressId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddressType() {
		return addressType;
	}

	public void setAddressType(String addressType) {
		this.addressType = addressType;
	}

	public String getHouseNo() {
		return houseNo;
	}

	public void setHouseNo(String houseNo) {
		this.houseNo = houseNo;
	}

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public String getLandmark() {
		return landmark;
	}

	public void setLandmark(String landmark) {
		this.landmark = landmark;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getPincode() {
		return pincode;
	}

	public void setPincode(String pincode) {
		this.pincode = pincode;
	}

	public boolean isDefault() {
		return isDefault;
	}

	public void setDefault(boolean isDefault) {
		this.isDefault = isDefault;
	}

	@Override
	public String toString() {
		return "Address [addressId=" + addressId + ", userId=" + userId + ", fullName=" + fullName + ", phone=" + phone
				+ ", addressType=" + addressType + ", houseNo=" + houseNo + ", area=" + area + ", landmark=" + landmark
				+ ", city=" + city + ", state=" + state + ", pincode=" + pincode + ", isDefault=" + isDefault + "]";
	}
	
	
}
