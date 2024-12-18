<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, config.GetConnection" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Manage Inventory</title>
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
    }
    .table thead {
      background-color: #343a40;
      color: #fff;
    }
    .btn-info {
      background-color: #007bff;
      color: #fff;
    }
    .btn-info:hover {
      background-color: #0056b3;
    }
    .btn-warning {
      color: #fff;
    }
    .btn-danger {
      background-color: #e3342f;
    }
    .btn-danger:hover {
      background-color: #cc1f1a;
    }
    .custom-actions form {
      display: inline;
    }
    .custom-actions .btn {
      margin-right: 5px;
    }
  </style>
</head>
<body>
  <div class="container my-5">
    <div class="text-center mb-4">
      <h2 class="fw-bold">Manage Inventory Items</h2>
      <p class="text-muted">Track, update, and analyze your inventory with ease.</p>
    </div>
    
    <div class="d-flex justify-content-between align-items-center mb-4">
      <a href="AddInventory.jsp" class="btn btn-info btn-lg shadow">Add Inventory Item</a>
           <a href="home.jsp" class="btn btn-info btn-lg shadow">Back</a>
     
    </div>

    <!-- Display Inventory Table -->
    <div class="card shadow-lg rounded-3">
      <div class="card-body">
        <h4 class="card-title text-center mb-4">Inventory List</h4>
        <div class="table-responsive">
          <table class="table table-bordered table-hover align-middle">
            <thead>
              <tr>
                <th>Item ID</th>
                <th>Item Name</th>
                <th>Quantity</th>
                <th>Available Quantity</th>
                <th>Days of Supply</th>
                <th>Recent Sales Trend</th>
                <th>Minimum Stock Level</th>
                <th>Actions</th>
              </tr>
            </thead>
            <tbody>
              <%
                Connection conn = null;
                PreparedStatement stmt = null;
                ResultSet rs = null;

                try {
                  conn = GetConnection.getConnection();
                  String query = "SELECT * FROM inventory";
                  stmt = conn.prepareStatement(query);
                  rs = stmt.executeQuery();

                  while (rs.next()) {
                    String itemId = rs.getString("itemid");
                    String itemName = rs.getString("itemname");
                    int quantity = rs.getInt("quantity");
                    int availableQuantity = rs.getInt("availablequantity");
                    int daysOfSupply = rs.getInt("daysofsupply");
                    String recentSalesTrend = rs.getString("recentsalestrend");
                    int minimumStockLevel = rs.getInt("minimumstocklevel");
              %>
              <tr>
                <td><%= itemId %></td>
                <td><%= itemName %></td>
                <td><%= quantity %></td>
                <td><%= availableQuantity %></td>
                <td><%= daysOfSupply %></td>
                <td><%= recentSalesTrend %></td>
                <td><%= minimumStockLevel %></td>
                <td class="custom-actions">
                  <a href="EditInventory?id=<%= itemId %>" class="btn btn-sm btn-warning">Edit</a>
                  <form action="DeleteInventory" method="post">
                    <input type="hidden" name="itemid" value="<%= itemId %>">
                    <button type="submit" class="btn btn-sm btn-danger">Delete</button>
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
  </div>

  <!-- Bootstrap JS -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
