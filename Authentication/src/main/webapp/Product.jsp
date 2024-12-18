<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, config.GetConnection" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Manage Products</title>
  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
  <!-- Custom CSS -->
  <style>
    body {
      background-color: #f4f6f9;
      font-family: 'Roboto', sans-serif;
      color: #495057;
    }
    .container {
      max-width: 1200px;
    }
    .btn-info {
      background-color: #0d6efd;
      color: #fff;
      border: none;
      transition: background-color 0.3s ease;
    }
    .btn-info:hover {
      background-color: #0b5ed7;
    }
    .card {
      border: none;
      box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }
    .card-title {
      font-weight: 600;
      color: #212529;
    }
    .table {
      margin-bottom: 0;
    }
    .table th {
      background-color: #0d6efd;
      color: #fff;
      text-align: center;
    }
    .table td {
      text-align: center;
      vertical-align: middle;
    }
    .btn-sm {
      font-size: 0.875rem;
    }
    .btn-warning {
      background-color: #ffc107;
      border: none;
      transition: background-color 0.3s ease;
    }
    .btn-warning:hover {
      background-color: #e0a800;
    }
    .btn-danger {
      background-color: #dc3545;
      border: none;
      transition: background-color 0.3s ease;
    }
    .btn-danger:hover {
      background-color: #bb2d3b;
    }
    .table-striped tbody tr:nth-of-type(odd) {
      background-color: #f8f9fa;
    }
    @media (max-width: 768px) {
      .btn {
        margin-bottom: 10px;
        width: 100%;
      }
    }
  </style>
</head>
<body>
  <div class="container my-5">
    <h2 class="text-center mb-4">Manage Product Details</h2>

    <div class="d-flex justify-content-between align-items-center mb-4">
      <a href="AddProduct.jsp" class="btn btn-info btn-lg shadow">Add Product</a>
            <a href="home.jsp" class="btn btn-info btn-lg shadow">Back</a>
      
    </div>

    <!-- Display Product Table -->
    <div class="card shadow-lg rounded-3">
      <div class="card-body">
        <h4 class="card-title mb-4 text-center">Product List</h4>
        <div class="table-responsive">
          <table class="table table-bordered table-striped">
            <thead>
              <tr>
                <th>Product ID</th>
                <th>Product Name</th>
                <th>Description</th>
                <th>Category</th>
                <th>Price</th>
                <th>Stock Level</th>
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
                  String query = "SELECT * FROM products";
                  stmt = conn.prepareStatement(query);
                  rs = stmt.executeQuery();

                  while (rs.next()) {
                    int productId = rs.getInt("productid");
                    String productName = rs.getString("productname");
                    String description = rs.getString("description");
                    String category = rs.getString("category");
                    double price = rs.getDouble("price");
                    int stockLevel = rs.getInt("stocklevel");
              %>
              <tr>
                <td><%= productId %></td>
                <td><%= productName %></td>
                <td><%= description %></td>
                <td><%= category %></td>
                <td><%= price %></td>
                <td><%= stockLevel %></td>
                <td>
                  <a href="EditProduct?id=<%= productId %>" class="btn btn-sm btn-warning">Edit</a>
                  <form action="DeleteProduct" method="post" class="d-inline">
                    <input type="hidden" name="productid" value="<%= productId %>">
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