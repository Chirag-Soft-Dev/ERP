package model;

import java.sql.PreparedStatement;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import java.sql.SQLException;

import config.GetConnection;

public class Customermodel {
 
	  	private int customerId;
	    private String customer_name;
	    private double total_lifetime_value;
	    private double average_order_value;
	    private String customer_segment_categories;
	    
	    
		public int getCustomerId() {
			return customerId;
		}
		public void setCustomerId(int customerId) {
			this.customerId = customerId;
		}
		public String getCustomer_name() {
			return customer_name;
		}
		public void setCustomer_name(String customer_name) {
			this.customer_name = customer_name;
		}
		public double getTotal_lifetime_value() {
			return total_lifetime_value;
		}
		public void setTotal_lifetime_value(double total_lifetime_value) {
			this.total_lifetime_value = total_lifetime_value;
		}
		public double getAverage_order_value() {
			return average_order_value;
		}
		public void setAverage_order_value(double average_order_value) {
			this.average_order_value = average_order_value;
		}
		public String getCustomer_segment_categories() {
			return customer_segment_categories;
		}
		public void setCustomer_segment_categories(String customer_segment_categories) {
			this.customer_segment_categories = customer_segment_categories;
		}
	    
	    
	    public void insertCustomer() {
	    	
	    	PreparedStatement preparedStatement;
			try {
				preparedStatement = GetConnection.getConnection().prepareStatement("insert into customers values(?,?,?,?,?)");
				preparedStatement.setInt(1, customerId);
		    	preparedStatement.setString(2, customer_name);
		    	preparedStatement.setDouble(3, total_lifetime_value);
		    	preparedStatement.setDouble(4, average_order_value);
		    	preparedStatement.setString(5, customer_segment_categories);
		    	preparedStatement.executeUpdate();
		    	System.out.println("Inserted....");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	    	
	    }
	    
	    
	    
	    public static Customermodel getCustomerById(int id) {
	        Customermodel customer = null;
	        try {
	            Connection conn = GetConnection.getConnection();
	            PreparedStatement ps = conn.prepareStatement("SELECT * FROM customers WHERE customer_id = ?");
	            ps.setInt(1, id);
	            ResultSet rs = ps.executeQuery();
	            if (rs.next()) {
	                customer = new Customermodel();
	                customer.setCustomerId(rs.getInt("customer_id"));
	                customer.setCustomer_name(rs.getString("customer_name"));
	                customer.setTotal_lifetime_value(rs.getDouble("total_lifetime_value"));
	                customer.setAverage_order_value(rs.getDouble("average_order_value"));
	                customer.setCustomer_segment_categories(rs.getString("customer_segment_categories"));
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return customer;
	    }
	    
	    
	    
	    public void updateCustomer() {
	        try {
	            Connection conn = GetConnection.getConnection();
	            PreparedStatement ps = conn.prepareStatement(
	                "UPDATE customers SET customer_name = ?, total_lifetime_value = ?, average_order_value = ?, customer_segment_categories = ? WHERE customer_id = ?");
	            ps.setString(1, customer_name);
	            ps.setDouble(2, total_lifetime_value);
	            ps.setDouble(3, average_order_value);
	            ps.setString(4, customer_segment_categories);
	            ps.setInt(5, customerId);
	            ps.executeUpdate();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }

	   
	    
	    
	    
	       
	    public static List<Customermodel> getAllCustomers() {
	        List<Customermodel> customers = new ArrayList<>();
	        try {
	            Connection conn = GetConnection.getConnection();
	            PreparedStatement ps = conn.prepareStatement("SELECT * FROM customers");
	            ResultSet rs = ps.executeQuery();
	            while (rs.next()) {
	                Customermodel customer = new Customermodel();
	                customer.setCustomerId(rs.getInt("customerId"));
	                customer.setCustomer_name(rs.getString("customer_name"));
	                customer.setTotal_lifetime_value(rs.getDouble("total_lifetime_value"));
	                customer.setAverage_order_value(rs.getDouble("average_order_value"));
	                customer.setCustomer_segment_categories(rs.getString("customer_segment_categories"));
	                customers.add(customer);
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return customers;
	    }
		public static void deleteCustomer(int customerId2) {
			 try {
			        Connection conn = GetConnection.getConnection();
			        PreparedStatement ps = conn.prepareStatement("DELETE FROM customers WHERE customer_id = ?");
			        ps.setInt(1, customerId2);
			        ps.executeUpdate();
			    } catch (SQLException e) {
			        e.printStackTrace();
			    }
		}
	
}