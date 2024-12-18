<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Add Product</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
      body {
          font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      }

      .form-container {
          background: #ffffff;
          padding: 1rem;
          border-radius: 12px;
          box-shadow: 0 4px 6px rgba(0, 0, 0, 0.5);
          max-width: 500px;
          margin: auto;
      }

      h2 {
          text-align: center;
          margin-bottom: 1rem;
          font-weight: 2px;
          color: #343a40;
      }

      .form-label {
          font-weight: 500;
      }

      .form-control:focus {
          border-color: #28a745;
          box-shadow: 0 0 0 0.2rem rgba(40, 167, 69, 0.25);
      }

      .btn-success {
          background: linear-gradient(135deg, #28a745, #218838);
          border: none;
      }

      .btn-success:hover {
          background: linear-gradient(135deg, #218838, #1e7e34);
      }

      .d-grid button {
          font-size: 1.2rem;
          padding: 0.75rem;
      }

      textarea {
          resize: none;
      }

      .tooltip {
          font-size: 0.85rem;
          margin-top: 0.25rem;
          color: #6c757d;
      }
  </style>
</head>
<body>
  <div class="container py-5">  
    <div class="form-container">         <a href="Product.jsp" class="btn btn-info btn-sm shadow">Back</a>
       
      <h2>Add Product</h2>
      <form action="ProductController" method="post">
        <div class="mb-4">
          <label for="productname" class="form-label">Product Name</label>
          <input type="text" id="productname" name="productname" class="form-control" required placeholder="Enter Product Name">
          <div class="tooltip">Enter the product's name as it should appear in the catalog.</div>
        </div>
        <div class="mb-4">
          <label for="description" class="form-label">Description</label>
          <textarea id="description" name="description" class="form-control" required rows="4" placeholder="Enter Product Description"></textarea>
          <div class="tooltip">Provide a detailed description of the product.</div>
        </div>
        <div class="mb-4">
          <label for="category" class="form-label">Category</label>
          <select id="category" name="category" class="form-select" required>
            <option value="" disabled selected>Select Product Category</option>
            <option value="Electronics">Electronics</option>
            <option value="Clothing">Clothing</option>
            <option value="Furniture">Furniture</option>
            <option value="Books">Books</option>
            <option value="Food">Food</option>
          </select>
          <div class="tooltip">Choose the appropriate category for the product.</div>
        </div>
        <div class="mb-4">
          <label for="price" class="form-label">Price</label>
          <input type="number" id="price" name="price" class="form-control" required placeholder="Enter Product Price" step="0.01">
          <div class="tooltip">Set the product price in your currency.</div>
        </div>
        <div class="mb-4">
          <label for="stocklevel" class="form-label">Stock Level</label>
          <input type="number" id="stocklevel" name="stocklevel" class="form-control" required placeholder="Enter Stock Level" min="0">
          <div class="tooltip">Enter the quantity available in stock.</div>
        </div>
        <div class="d-grid">
          <button type="submit" class="btn btn-info">Add Product</button>
        </div>
      </form>
    </div>
  </div>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
