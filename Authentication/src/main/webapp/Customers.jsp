<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, config.GetConnection" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Manage Customers</title>
  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
  <!-- Custom CSS -->
  <style>
    body {
      background-color: #f8f9fa;
      font-family: 'Arial', sans-serif;
    }
    .container {
      max-width: 1200px;
    }
    .card {
      border: none;
      box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
      border-radius: 10px;
    }
    .table th, .table td {
      vertical-align: middle;
    }
    .btn-primary, .btn-warning, .btn-danger {
      border: none;
      transition: all 0.3s ease;
    }
    .btn-primary:hover {
      background-color: #0056b3;
    }
    .btn-warning:hover {
      background-color: #e0a800;
    }
    .btn-danger:hover {
      background-color: #c82333;
    }
    .table thead {
      background-color: #343a40;
      color: #ffffff;
    }
    .header-actions {
      display: flex;
      justify-content: space-between;
      align-items: center;
    }
  </style>
</head>
<body>
  <div class="container my-5"> 
      <h2 class="fw-bold text-center">Manage Customer Details</h2> <br>
      <a href="AddCustomer.jsp" class="btn btn-primary shadow">Add New Customer</a> 
       <a href="home.jsp" class="btn btn-primary shadow">Back</a>
      

    <!-- Display Customer Table -->
    <div class="card mt-5">
      <div class="card-body">
        <h4 class="card-title mb-4">Customer List</h4>
        <table class="table table-hover">
          <thead>
            <tr>
              <th>Customer ID</th>
              <th>Customer Name</th>
              <th>Total Lifetime Value</th>
              <th>Average Order Value</th>
              <th>Segment Category</th>
              <th class="text-center">Actions</th>
            </tr>
          </thead>
          <tbody>
            <% 
              Connection conn = null;
              PreparedStatement stmt = null;
              ResultSet rs = null;

              try {
                conn = GetConnection.getConnection();
                String query = "SELECT * FROM customers";
                stmt = conn.prepareStatement(query);
                rs = stmt.executeQuery();

                while (rs.next()) {
                  int customerId = rs.getInt("customer_id");
                  String customerName = rs.getString("customer_name");
                  double totalLifetimeValue = rs.getDouble("total_lifetime_value");
                  double averageOrderValue = rs.getDouble("average_order_value");
                  String segmentCategory = rs.getString("customer_segment_categories");
            %>
            <tr>
              <td><%= customerId %></td>
              <td><%= customerName %></td>
              <td><%= String.format("%.2f", totalLifetimeValue) %></td>
              <td><%= String.format("%.2f", averageOrderValue) %></td>
              <td><%= segmentCategory %></td>
              <td class="text-center">
                <a href="EditCustomer?id=<%= customerId %>" class="btn btn-warning btn-sm me-2">Edit</a>
                <form action="DeleteCustomer" method="post" class="d-inline">
                  <input type="hidden" name="customer_id" value="<%= customerId %>">
                  <button type="submit" class="btn btn-danger btn-sm">Delete</button>
                </form>
              </td>
            </tr>
            <% 
                }
              } catch (Exception e) {
                e.printStackTrace();
              } finally {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
              }
            %>
          </tbody>
        </table>
      </div>
    </div>
  </div>

  <!-- Bootstrap JS -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
