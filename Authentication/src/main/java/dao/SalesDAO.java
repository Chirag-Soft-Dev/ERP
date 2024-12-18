package dao;

import model.SalesModel;
import config.GetConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class SalesDAO {

    public List<SalesModel> getAllSales() {
        List<SalesModel> salesList = new ArrayList<>();
        try (Connection conn = GetConnection.getConnection();
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM sales")) {
            while (rs.next()) {
                SalesModel sale = new SalesModel(
                    rs.getInt("salesID"),
                    rs.getString("salesPersonName"),
                    rs.getInt("target"),
                    rs.getInt("numberOfUnits"),
                    rs.getInt("numberOfUnitsSold"),
                    rs.getString("completionStatus")
                );
                salesList.add(sale);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return salesList;
    }
    
    public SalesModel getOne(int salesID) {
    	SalesModel sale = null;
    	try {
    		Connection conn = GetConnection.getConnection();
            PreparedStatement stmt = conn.prepareStatement("SELECT * FROM sales WHERE salesID=?");
    		stmt.setInt(1, salesID);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                sale = new SalesModel(
                    rs.getInt("salesID"),
                    rs.getString("salesPersonName"),
                    rs.getInt("target"),
                    rs.getInt("numberOfUnits"),
                    rs.getInt("numberOfUnitsSold"),
                    rs.getString("completionStatus")
                );
            }
        } catch (SQLException e) {
        	System.out.println("Error executing query");
            e.printStackTrace();
        }
    	return sale;
    }

    public void insertSale(SalesModel sale) {
        String sql = "INSERT INTO sales (salesPersonName, target, numberOfUnits, numberOfUnitsSold, completionStatus) VALUES (?, ?, ?, ?, ?)";
        try (Connection conn = GetConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, sale.getSalesPersonName());
            stmt.setInt(2, sale.getTarget());
            stmt.setInt(3, sale.getNumberOfUnits());
            stmt.setInt(4, sale.getNumberOfUnitsSold());
            stmt.setString(5, sale.getCompletionStatus());
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public void updateSale(SalesModel sale) {
        String sql = "UPDATE sales SET salesPersonName=?, target=?, numberOfUnits=?, numberOfUnitsSold=?, completionStatus=? WHERE salesID=?";
        try (Connection conn = GetConnection.getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, sale.getSalesPersonName());
            stmt.setInt(2, sale.getTarget());
            stmt.setInt(3, sale.getNumberOfUnits());
            stmt.setInt(4, sale.getNumberOfUnitsSold());
            stmt.setString(5, sale.getCompletionStatus());
            stmt.setInt(6, sale.getSalesID());
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteSale(int salesID) {
        String sql = "DELETE FROM sales WHERE salesID=?";
        try (Connection conn = GetConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, salesID);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}