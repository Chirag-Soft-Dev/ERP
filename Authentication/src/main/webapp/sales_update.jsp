<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="model.SalesModel" %>
<%@ page import="dao.SalesDAO" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Update Sales Record</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Mono:wght@400;700&family=Montserrat:wght@300;400;500;600&display=swap" rel="stylesheet">
    <style>
        /* General body styling */
        body {
            font-family: "IBM Plex Mono", monospace;
            background-color: #f8f9fa;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 0;
        }

        /* Form container styling */
        .form-container {
            background: #ffffff;
            border-radius: 8px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
            padding: 2rem;
            max-width: 600px;
            width: 100%;
        }

        /* Heading styling */
        h2 {
            color: #004d4d;
            font-weight: 700;
            margin-bottom: 1rem;
        }

        /* Label styling */
        label {
            font-family: "IBM Plex Mono", monospace;
            font-weight: 700;
            color: #004d4d;
        }

        /* Input fields and select styling */
        input, select {
            font-family: "Montserrat", sans-serif;
            font-weight: 400;
        }

        input:focus, select:focus {
            box-shadow: 0 0 5px rgba(0, 77, 77, 0.5);
            border-color: #004d4d;
        }

        /* Primary button styling */
        .btn-primary-custom {
            background-color: #004d4d;
            color: #ffffff;
            border: none;
            font-weight: 600;
            transition: background 0.3s ease, color 0.3s ease;
        }

        .btn-primary-custom:hover {
            background-color: #003333;
            color: #ffffff;
        }

        /* Cancel button styling */
        .btn-cancel {
            background-color: #f05e16;
            color: #ffffff;
            border: none;
            font-weight: 600;
            transition: background 0.3s ease, color 0.3s ease;
        }

        .btn-cancel:hover {
            background-color: #c04c13;
            color: #ffffff;
        }
    </style>
</head>
<body>
<%
    SalesDAO salesDAO = new SalesDAO();
    SalesModel sale = new SalesModel();
    
    String salesID = request.getParameter("salesID");
    sale = salesDAO.getOne(Integer.parseInt(salesID));
%>

<div class="form-container shadow-lg">
    <h2 class="text-center">Update Sale Record</h2>

    <form action="SalesController" method="post">
        <!-- Hidden field to send salesID for updates -->
        <input type="hidden" name="salesID" value="<%= sale.getSalesID() %>">

        <!-- Sales Person Name -->
        <div class="form-group">
            <label for="salesPersonName">Sales Person Name</label>
            <input type="text" id="salesPersonName" 
                   class="form-control" name="salesPersonName" 
                   value="<%= sale.getSalesPersonName() != null ? sale.getSalesPersonName() : "" %>"
                   maxlength="64" required>
        </div>
        <!-- Target -->
        <div class="form-group">
            <label for="target">Target</label>
            <input type="number" id="target" 
                   class="form-control" name="target" 
                   value="<%= sale.getTarget() %>" required>
        </div>
        <!-- Number of Units -->
        <div class="form-group">
            <label for="numberOfUnits">Number of Units</label>
            <input type="number" id="numberOfUnits" 
                   class="form-control" name="numberOfUnits" 
                   value="<%= sale.getNumberOfUnits() %>" required>
        </div>
        <!-- Number of Units Sold -->
        <div class="form-group">
            <label for="numberOfUnitsSold">Number of Units Sold</label>
            <input type="number" id="numberOfUnitsSold" 
                   class="form-control" name="numberOfUnitsSold" 
                   value="<%= sale.getNumberOfUnitsSold() %>" required>
        </div>
        <!-- Completion Status -->
        <div class="form-group">
            <label for="completionStatus">Completion Status</label>
            <select id="completionStatus" class="form-control" name="completionStatus">
                <option value="Pending" <%= "Pending".equals(sale.getCompletionStatus()) ? "selected" : "" %>>Pending</option>
                <option value="Completed" <%= "Completed".equals(sale.getCompletionStatus()) ? "selected" : "" %>>Completed</option>
            </select>
        </div>

        <!-- Buttons -->
        <div class="text-center mt-4">
            <button type="submit" class="btn btn-primary-custom px-4 rounded-pill">
                Update Sale
            </button>
            <a href="SalesController" class="btn btn-cancel px-4 rounded-pill ml-2">
                Cancel
            </a>
        </div>
    </form>
</div>
</body>
</html>