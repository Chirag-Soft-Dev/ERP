package model;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import config.GetConnection;

public class ProductModel {
    
    private int productid;
    private String productname;
    private String description;
    private String category;
    private double price;
    private int stocklevel;
    
    // Getters and Setters
    public int getProductid() {
        return productid;
    }
    public void setProductid(int productid) {
        this.productid = productid;
    }
    public String getProductname() {
        return productname;
    }
    public void setProductname(String productname) {
        this.productname = productname;
    }
    public String getDescription() {
        return description;
    }
    public void setDescription(String description) {
        this.description = description;
    }
    public String getCategory() {
        return category;
    }
    public void setCategory(String category) {
        this.category = category;
    }
    public double getPrice() {
        return price;
    }
    public void setPrice(double price) {
        this.price = price;
    }
    public int getStocklevel() {
        return stocklevel;
    }
    public void setStocklevel(int stocklevel) {
        this.stocklevel = stocklevel;
    }

    
    // Method to insert a new product
    public void insertProduct() {
        try {
            PreparedStatement preparedStatement = GetConnection.getConnection().prepareStatement(
                "INSERT INTO products (productname, description, category, price, stocklevel) VALUES (?, ?, ?, ?, ?)"
            );
            preparedStatement.setString(1, productname);
            preparedStatement.setString(2, description);
            preparedStatement.setString(3, category);
            preparedStatement.setDouble(4, price);
            preparedStatement.setInt(5, stocklevel);
            preparedStatement.executeUpdate();
            System.out.println("Product Inserted...");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Method to get a product by ID
//    public static ProductModel getProductById(int id) {
//        ProductModel product = null;
//        try {
//            Connection conn = GetConnection.getConnection();
//            PreparedStatement ps = conn.prepareStatement("SELECT * FROM products WHERE productid = ?");
//            ps.setInt(1, id);
//            ResultSet rs = ps.executeQuery();
//            if (rs.next()) {
//                product = new ProductModel();
//                product.setProductid(rs.getInt("productid"));
//                product.setProductname(rs.getString("productname"));
//                product.setDescription(rs.getString("description"));
//                product.setCategory(rs.getString("category"));
//                product.setPrice(rs.getDouble("price"));
//                product.setStocklevel(rs.getInt("stocklevel"));
//            }
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//        return product;
//    }
//    
    
    public static ProductModel getProductById(int productId) {
        ProductModel product = null;
        try (Connection conn = GetConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement("SELECT * FROM products WHERE productid = ?")) {
            stmt.setInt(1, productId);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    product = new ProductModel();
                    product.setProductid(rs.getInt("productid"));
                    product.setProductname(rs.getString("productname"));
                    product.setDescription(rs.getString("description"));
                    product.setCategory(rs.getString("category"));
                    product.setPrice(rs.getDouble("price"));
                    product.setStocklevel(rs.getInt("stocklevel"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return product;
    }

    
    

    // Method to update product details
    public void updateProduct() {
        try {
            Connection conn = GetConnection.getConnection();
            PreparedStatement ps = conn.prepareStatement(
                "UPDATE products SET productname = ?, description = ?, category = ?, price = ?, stocklevel = ? WHERE productid = ?"
            );
            ps.setString(1, productname);
            ps.setString(2, description);
            ps.setString(3, category);
            ps.setDouble(4, price);
            ps.setInt(5, stocklevel);
            ps.setInt(6, productid);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Method to get all products
    public static List<ProductModel> getAllProducts() {
        List<ProductModel> products = new ArrayList<>();
        try {
            Connection conn = GetConnection.getConnection();
            PreparedStatement ps = conn.prepareStatement("SELECT * FROM products");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ProductModel product = new ProductModel();
                product.setProductid(rs.getInt("productid"));
                product.setProductname(rs.getString("productname"));
                product.setDescription(rs.getString("description"));
                product.setCategory(rs.getString("category"));
                product.setPrice(rs.getDouble("price"));
                product.setStocklevel(rs.getInt("stocklevel"));
                products.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }

    // Method to delete a product by ID
    public static void deleteProduct(int productid) {
        try {
            Connection conn = GetConnection.getConnection();
            PreparedStatement ps = conn.prepareStatement("DELETE FROM products WHERE productid = ?");
            ps.setInt(1, productid);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
