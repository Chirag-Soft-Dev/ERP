<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Add Customer</title>
  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
  <!-- Custom Styles -->
  <style>
    body {
      background-color: #f3f4f6;
      font-family: 'Arial', sans-serif;
    }
    .card {
      border: none;
      box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
      border-radius: 10px;
    }
    .form-label {
      font-weight: 500;
    }
    .btn-primary {
      background-color: #0069d9;
      border: none;
      transition: background-color 0.3s;
    }
    .btn-primary:hover {
      background-color: #0056b3;
    }
    .container {
      max-width: 600px;
      margin-top: 50px;
    }
  </style>
</head>
<body>
  <div class="container">         <a href="Customers.jsp" class="btn btn-primary shadow mb-3">Back</a>
  
    <div class="card p-4 mb-4">
      <h2 class="text-center mb-4">Add New Customer</h2>
      <form action="Customercontroller" method="post">
        <div class="mb-3">
          <label for="customer_name" class="form-label p-2">Customer Name</label>
          <input type="text" id="customer_name" name="customer_name" class="form-control" required placeholder="Enter Customer Name">
        </div>
        <div class="mb-3">
          <label for="total_lifetime_value" class="form-label p-2">Total Lifetime Value</label>
          <input type="number" step="0.01" id="total_lifetime_value" name="total_lifetime_value" class="form-control" required placeholder="Enter Total Lifetime Value">
        </div>
        <div class="mb-3">
          <label for="average_order_value" class="form-label p-2">Average Order Value</label>
          <input type="number" step="0.01" id="average_order_value" name="average_order_value" class="form-control" required placeholder="Enter Average Order Value">
        </div>
        <div class="mb-3">
          <label for="customer_segment_categories" class="form-label p-2">Customer Segment Categories</label>
          <select id="customer_segment_categories" name="customer_segment_categories" class="form-select" required>
            <option value="" disabled selected>Select Customer Segment</option>
            <option value="Loyal">Loyal</option>
            <option value="New">New</option>
            <option value="At-risk">At-risk</option>
          </select>
        </div>
        <div class="d-grid">
          <button type="submit" class="btn btn-primary">Add Customer</button>
        </div>
      </form>
    </div>
  </div>

  <!-- Bootstrap JS -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
