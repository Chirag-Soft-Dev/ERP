package model;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import config.GetConnection;

public class Inventorymodel {

    private int itemid;
    private String itemname;
    private int quantity;
    private int availablequantity;
    private int daysofsupply;
    private double recentsalestrend;
    private int minimumstocklevel;

    // Getters and Setters
    public int getItemid() {
        return itemid;
    }

    public void setItemid(int itemid) {
        this.itemid = itemid;
    }

    public String getItemname() {
        return itemname;
    }

    public void setItemname(String itemname) {
        this.itemname = itemname;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getAvailablequantity() {
        return availablequantity;
    }

    public void setAvailablequantity(int availablequantity) {
        this.availablequantity = availablequantity;
    }

    public int getDaysofsupply() {
        return daysofsupply;
    }

    public void setDaysofsupply(int daysofsupply) {
        this.daysofsupply = daysofsupply;
    }

    public double getRecentsalestrend() {
        return recentsalestrend;
    }

    public void setRecentsalestrend(double recentsalestrend) {
        this.recentsalestrend = recentsalestrend;
    }

    public int getMinimumstocklevel() {
        return minimumstocklevel;
    }

    public void setMinimumstocklevel(int minimumstocklevel) {
        this.minimumstocklevel = minimumstocklevel;
    }

    // Insert Inventory
    public void insertInventory() {
        try {
            Connection conn = GetConnection.getConnection();
            PreparedStatement ps = conn.prepareStatement(
                "INSERT INTO inventory (itemid, itemname, quantity, availablequantity, daysofsupply, recentsalestrend, minimumstocklevel) VALUES (?, ?, ?, ?, ?, ?, ?)"
            );
            ps.setInt(1, itemid);
            ps.setString(2, itemname);
            ps.setInt(3, quantity);
            ps.setInt(4, availablequantity);
            ps.setInt(5, daysofsupply);
            ps.setDouble(6, recentsalestrend);
            ps.setInt(7, minimumstocklevel);
            ps.executeUpdate();
            System.out.println("Inventory inserted successfully!");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Get Inventory by ID
    public static Inventorymodel getInventoryById(int id) {
        Inventorymodel inventory = null;
        try {
            Connection conn = GetConnection.getConnection();
            PreparedStatement ps = conn.prepareStatement("SELECT * FROM inventory WHERE itemid = ?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                inventory = new Inventorymodel();
                inventory.setItemid(rs.getInt("itemid"));
                inventory.setItemname(rs.getString("itemname"));
                inventory.setQuantity(rs.getInt("quantity"));
                inventory.setAvailablequantity(rs.getInt("availablequantity"));
                inventory.setDaysofsupply(rs.getInt("daysofsupply"));
                inventory.setRecentsalestrend(rs.getDouble("recentsalestrend"));
                inventory.setMinimumstocklevel(rs.getInt("minimumstocklevel"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return inventory;
    }

    // Update Inventory
    public void updateInventory() {
        try {
            Connection conn = GetConnection.getConnection();
            PreparedStatement ps = conn.prepareStatement(
                "UPDATE inventory SET itemname = ?, quantity = ?, availablequantity = ?, daysofsupply = ?, recentsalestrend = ?, minimumstocklevel = ? WHERE itemid = ?"
            );
            ps.setString(1, itemname);
            ps.setInt(2, quantity);
            ps.setInt(3, availablequantity);
            ps.setInt(4, daysofsupply);
            ps.setDouble(5, recentsalestrend);
            ps.setInt(6, minimumstocklevel);
            ps.setInt(7, itemid);
            ps.executeUpdate();
            System.out.println("Inventory updated successfully!");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Delete Inventory
    public static void deleteInventory(int itemId) {
        try {
            Connection conn = GetConnection.getConnection();
            PreparedStatement ps = conn.prepareStatement("DELETE FROM inventory WHERE itemid = ?");
            ps.setInt(1, itemId);
            ps.executeUpdate();
            System.out.println("Inventory deleted successfully!");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Get All Inventory
    public static List<Inventorymodel> getAllInventory() {
        List<Inventorymodel> inventoryList = new ArrayList<>();
        try {
            Connection conn = GetConnection.getConnection();
            PreparedStatement ps = conn.prepareStatement("SELECT * FROM inventory");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Inventorymodel inventory = new Inventorymodel();
                inventory.setItemid(rs.getInt("itemid"));
                inventory.setItemname(rs.getString("itemname"));
                inventory.setQuantity(rs.getInt("quantity"));
                inventory.setAvailablequantity(rs.getInt("availablequantity"));
                inventory.setDaysofsupply(rs.getInt("daysofsupply"));
                inventory.setRecentsalestrend(rs.getDouble("recentsalestrend"));
                inventory.setMinimumstocklevel(rs.getInt("minimumstocklevel"));
                inventoryList.add(inventory);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return inventoryList;
    }
}
