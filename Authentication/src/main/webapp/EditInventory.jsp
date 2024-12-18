<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    model.Inventorymodel inventory = (model.Inventorymodel) request.getAttribute("inventory");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Inventory</title>
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
        .btn-success {
            background-color: #28a745;
            border: none;
            transition: background-color 0.3s;
        }
        .btn-success:hover {
            background-color: #218838;
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
                <a href="Inventory.jsp" class="btn btn-info btn-sm ">Back</a>
    
        <div class="card">
            <h3>Edit Inventory Item</h3>
            <form action="EditInventory" method="post">
                <input type="hidden" name="itemid" value="<%= inventory.getItemid() %>">
                <div class="mb-3">
                    <label for="itemname" class="form-label">Item Name</label>
                    <input type="text" id="itemname" name="itemname" class="form-control" required value="<%= inventory.getItemname() %>">
                </div>
                <div class="mb-3">
                    <label for="quantity" class="form-label">Quantity</label>
                    <input type="number" id="quantity" name="quantity" class="form-control" required value="<%= inventory.getQuantity() %>">
                </div>
                <div class="mb-3">
                    <label for="availablequantity" class="form-label">Available Quantity</label>
                    <input type="number" id="availablequantity" name="availablequantity" class="form-control" required value="<%= inventory.getAvailablequantity() %>">
                </div>
                <div class="mb-3">
                    <label for="daysofsupply" class="form-label">Days of Supply</label>
                    <input type="number" id="daysofsupply" name="daysofsupply" class="form-control" required value="<%= inventory.getDaysofsupply() %>">
                </div>
                <div class="mb-3">
                    <label for="recentsalestrend" class="form-label">Recent Sales Trend</label>
                    <input type="text" id="recentsalestrend" name="recentsalestrend" class="form-control" required value="<%= inventory.getRecentsalestrend() %>">
                </div>
                <div class="mb-3">
                    <label for="minimumstocklevel" class="form-label">Minimum Stock Level</label>
                    <input type="number" id="minimumstocklevel" name="minimumstocklevel" class="form-control" required value="<%= inventory.getMinimumstocklevel() %>">
                </div>
                <div class="d-grid">
                    <button type="submit" class="btn btn-info">Update Inventory</button>
                </div>
            </form>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
