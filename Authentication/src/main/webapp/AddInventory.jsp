<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Add Inventory</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body {
      background-color: #f3f4f6;
      font-family: 'Arial', sans-serif;
    }
    .container {
      max-width: 600px;
      margin-top: 50px;
    }
    .card {
      border: none;
      box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
      border-radius: 10px;
      padding: 20px;
      background: #fff;
    }
    .form-label {
      font-weight: 500;
    }
    .btn-primary {
      background-color: #007bff;
      border: none;
      transition: background-color 0.3s;
    }
    .btn-primary:hover {
      background-color: #0056b3;
    }
    h3 {
      text-align: center;
      color: #333;
      margin-bottom: 20px;
    }
  </style>
</head>
<body>
  <div class="container">
            <a href="Inventory.jsp" class="btn btn-info btn-sm">Back</a>
    <div class="card">
                  
      <h3>Add New Inventory</h3>
      
      <form action="InventoryController" method="post">
        
        <div class="mb-3">
          <label for="itemname" class="form-label">Item Name</label>
          <input type="text" id="itemname" name="itemname" class="form-control" required placeholder="Enter Item Name">
        </div>
        
        <div class="mb-3">
          <label for="quantity" class="form-label">Quantity</label>
          <input type="number" id="quantity" name="quantity" class="form-control" required placeholder="Enter Quantity">
        </div>
        
        <div class="mb-3">
          <label for="availablequantity" class="form-label">Available Quantity</label>
          <input type="number" id="availablequantity" name="availablequantity" class="form-control" required placeholder="Enter Available Quantity">
        </div>
        
        <div class="mb-3">
          <label for="daysofsupply" class="form-label">Days of Supply</label>
          <input type="number" id="daysofsupply" name="daysofsupply" class="form-control" required placeholder="Enter Days of Supply">
        </div>
        
        <div class="mb-3">
          <label for="recentsalestrend" class="form-label">Recent Sales Trend</label>
          <input type="text" id="recentsalestrend" name="recentsalestrend" class="form-control" required placeholder="Enter Recent Sales Trend">
        </div>
        
        <div class="mb-3">
          <label for="minimumstocklevel" class="form-label">Minimum Stock Level</label>
          <input type="number" id="minimumstocklevel" name="minimumstocklevel" class="form-control" required placeholder="Enter Minimum Stock Level">
        </div>
        
        <div class="d-grid">
          <input class="btn btn-primary" type="submit" name="insert" value="Add Inventory">
        </div>
      </form>
    </div>
  </div>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
