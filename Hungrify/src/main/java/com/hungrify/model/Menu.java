package com.hungrify.model;

public class Menu {

    private int menuId;
    private int restaurantId;
    private int categoryId;
    private String itemName;
    private String description;
    private double price;
    private String imageUrl;
    private boolean isAvailable;

    // Default Constructor
    public Menu() {
    }

    // Constructor for Insert
    public Menu(int restaurantId, int categoryId, String itemName,
            String description, double price, String imageUrl,
            boolean isAvailable) {

        this.restaurantId = restaurantId;
        this.categoryId = categoryId;
        this.itemName = itemName;
        this.description = description;
        this.price = price;
        this.imageUrl = imageUrl;
        this.isAvailable = isAvailable;
    }

    // Constructor for Fetch/Update
    public Menu(int menuId, int restaurantId, int categoryId,
            String itemName, String description, double price,
            String imageUrl, boolean isAvailable) {

        this.menuId = menuId;
        this.restaurantId = restaurantId;
        this.categoryId = categoryId;
        this.itemName = itemName;
        this.description = description;
        this.price = price;
        this.imageUrl = imageUrl;
        this.isAvailable = isAvailable;
    }

    public int getMenuId() {
        return menuId;
    }

    public void setMenuId(int menuId) {
        this.menuId = menuId;
    }

    public int getRestaurantId() {
        return restaurantId;
    }

    public void setRestaurantId(int restaurantId) {
        this.restaurantId = restaurantId;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public String getItemName() {
        return itemName;
    }

    public void setItemName(String itemName) {
        this.itemName = itemName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public boolean isAvailable() {
        return isAvailable;
    }

    public void setAvailable(boolean available) {
        isAvailable = available;
    }

    @Override
    public String toString() {
        return "Menu [menuId=" + menuId +
                ", restaurantId=" + restaurantId +
                ", categoryId=" + categoryId +
                ", itemName=" + itemName +
                ", description=" + description +
                ", price=" + price +
                ", imageUrl=" + imageUrl +
                ", isAvailable=" + isAvailable + "]";
    }
}