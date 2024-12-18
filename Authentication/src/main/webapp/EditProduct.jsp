<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    model.ProductModel product = (model.ProductModel) request.getAttribute("product");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Product</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            color: #fff;
        }

        .form-container {
            background: #ffffff;
            padding: 2rem;
            border-radius: 16px;
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.5);
            max-width: 600px;
            margin: auto;
            color: #333;
        }

        h2 {
            text-align: center;
            margin-bottom: 1.5rem;
            font-weight: 700;
            color: #6a11cb;
        }

        .form-label {
            font-weight: 600;
            display: flex;
            align-items: center;
        }

        .form-label i {
            margin-right: 0.5rem;
            color: #2575fc;
        }

        .form-control:focus {
            border-color: #6a11cb;
            box-shadow: 0 0 0 0.2rem rgba(106, 17, 203, 0.25);
        }

        .btn-success {
            background: linear-gradient(135deg, #2575fc, #6a11cb);
            border: none;
            color: #fff;
            transition: all 0.3s ease-in-out;
        }

        .btn-success:hover {
            background: linear-gradient(135deg, #6a11cb, #2575fc);
            transform: scale(1.05);
        }

        .d-grid button {
            font-size: 1.2rem;
            padding: 0.8rem;
        }

        textarea {
            resize: none;
            
        }

        .tooltip {
            font-size: 0.85rem;
            margin-top: 0.25rem;
            color: #6c757d;
        }

        .form-select {
            background-image: linear-gradient(135deg, #f8f9fa, #e9ecef);
        }
    </style>
</head>
<body>

    <div class="container py-5">
    
        <div class="form-container">  <a href="Product.jsp" class="btn btn-info btn-sm shadow">Back</a>
       
        
            <h2></i> Edit Product</h2>  
            <form action="EditProduct" method="post">
                <input type="hidden" name="product_id" value="<%= product.getProductid() %>">
                <div class="mb-4">
                    <label for="productname" class="form-label">Product Name</label>
                    <input type="text" id="productname" name="productname" class="form-control" required value="<%= product.getProductname() %>">
                    <div class="tooltip">Enter the product's name as it appears in the catalog.</div>
                </div>
                <div class="mb-4">
                    <label for="description" class="form-label">Description</label>
                    <textarea id="description" name="description" class="form-control" required rows="4"><%= product.getDescription() %></textarea>
                    <div class="tooltip">Provide a detailed description of the product.</div>
                </div>
                <div class="mb-4">
                    <label for="category" class="form-label">Category</label>
                    <select id="category" name="category" class="form-select" required>
                        <option value="Electronics" <%= "Electronics".equals(product.getCategory()) ? "selected" : "" %>>Electronics</option>
                        <option value="Clothing" <%= "Clothing".equals(product.getCategory()) ? "selected" : "" %>>Clothing</option>
                        <option value="Furniture" <%= "Furniture".equals(product.getCategory()) ? "selected" : "" %>>Furniture</option>
                        <option value="Books" <%= "Books".equals(product.getCategory()) ? "selected" : "" %>>Books</option>
                        <option value="Food" <%= "Food".equals(product.getCategory()) ? "selected" : "" %>>Food</option>
                    </select>
                    <div class="tooltip">Choose the appropriate category for the product.</div>
                </div>
                <div class="mb-4">
                    <label for="price" class="form-label">Price</label>
                    <input type="number" id="price" name="price" class="form-control" required value="<%= product.getPrice() %>" step="0.01">
                    <div class="tooltip">Set the product price in your currency.</div>
                </div>
                <div class="mb-4">
                    <label for="stocklevel" class="form-label">Stock Level</label>
                    <input type="number" id="stocklevel" name="stocklevel" class="form-control" required value="<%= product.getStocklevel() %>" min="0">
                    <div class="tooltip">Enter the quantity available in stock.</div>
                </div>
                <div class="d-grid">
                    <button type="submit" class="btn btn-success">Update Product</button>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
