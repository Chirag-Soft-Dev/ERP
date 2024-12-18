<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    model.Customermodel customer = (model.Customermodel) request.getAttribute("customer");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Customer</title>
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
        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <div class="container">  <a href="Customers.jsp" class="btn btn-primary shadow mb-3">Back</a>
  
        <div class="card">
            <h2>Edit Customer</h2>
            <form action="EditCustomer" method="post">
                <input type="hidden" name="customer_id" value="<%= customer.getCustomerId() %>">
                <div class="mb-3">
                    <label for="customer_name" class="form-label p-2">Customer Name</label>
                    <input type="text" id="customer_name" name="customer_name" class="form-control" required value="<%= customer.getCustomer_name() %>">
                </div>
                <div class="mb-3">
                    <label for="total_lifetime_value" class="form-label p-2">Total Lifetime Value</label>
                    <input type="number" step="0.01" id="total_lifetime_value" name="total_lifetime_value" class="form-control" required value="<%= customer.getTotal_lifetime_value() %>">
                </div>
                <div class="mb-3">
                    <label for="average_order_value" class="form-label p-2">Average Order Value</label>
                    <input type="number" step="0.01" id="average_order_value" name="average_order_value" class="form-control" required value="<%= customer.getAverage_order_value() %>">
                </div>
                <div class="mb-3">
                    <label for="customer_segment_categories" class="form-label p-2">Customer Segment Categories</label>
                    <select id="customer_segment_categories" name="customer_segment_categories" class="form-select" required>
                        <option value="Loyal" <%= "Loyal".equals(customer.getCustomer_segment_categories()) ? "selected" : "" %>>Loyal</option>
                        <option value="New" <%= "New".equals(customer.getCustomer_segment_categories()) ? "selected" : "" %>>New</option>
                        <option value="At-risk" <%= "At-risk".equals(customer.getCustomer_segment_categories()) ? "selected" : "" %>>At-risk</option>
                    </select>
                </div>
                <div class="d-grid">
                    <button type="submit" class="btn btn-primary">Update Customer</button>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
