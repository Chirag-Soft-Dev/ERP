<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f8f9fa;
        }

        .sidebar {
            height: 100vh;
            width: 280px;
            background: #212529;
            color: #ffffff;
            position: fixed;
            padding: 20px;
        }

        .sidebar h4 {
            text-align: center;
            margin-bottom: 20px;
            font-weight: bold;
        }

        .sidebar a {
            color: #adb5bd;
            text-decoration: none;
            padding: 10px 15px;
            display: block;
            border-radius: 5px;
            margin-bottom: 10px;
        }

        .sidebar a:hover, .sidebar a.active {
            background: #495057;
            color: #ffffff;
        }

        .content {
            margin-left: 300px;
            padding: 20px;
        }

        .register-card {
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
            background-color: #fff;
        }

        .register-card h3 {
            margin-bottom: 20px;
            text-align: center;
        }

        .form-control:focus {
            box-shadow: 0 0 5px rgba(13, 110, 253, 0.5);
        }
    </style>
</head>
<body>
    <!-- Sidebar -->
    <div class="sidebar">
        <h4>ERP Admin</h4>
        <button class="btn btn-secondary mb-3" id="toggleSidebar">Toggle</button>
        <a href="home.jsp">Dashboard</a>
        <a href="Inventory.jsp">Inventory</a>
        <a href="sales_list.jsp">Sales</a>
        <a href="Product.jsp">Products</a>
        <a href="Customers.jsp">Customers</a>
        <a href="reports.jsp" class="active">Reports</a>
        <a href="logout.jsp" class="btn btn-danger btn-sm mt-auto" role="button">Logout</a>
    </div>

    <!-- Main Content -->
     <div class="content">
        <div class="container">
            <h2>Reports Management</h2>
            <p>Generate, view, and analyze reports for various aspects of your ERP system.</p>
            
            <div class="row mt-4">
                <div class="col-md-4">
                    <div class="card p-3">
                        <h5 class="card-title">Sales Report</h5>
                        <p class="card-text">View detailed sales reports, including revenue, targets, and sales trends.</p>
                        <a href="salesReport.jsp" class="btn btn-primary">View Report</a>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card p-3">
                        <h5 class="card-title">Inventory Report</h5>
                        <p class="card-text">Analyze current stock levels and product movement history.</p>
                        <a href="inventoryReport.jsp" class="btn btn-primary">View Report</a>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card p-3">
                        <h5 class="card-title">Customer Insights</h5>
                        <p class="card-text">Generate reports on customer activity, purchases, and feedback.</p>
                        <a href="customerInsights.jsp" class="btn btn-primary">View Report</a>
                    </div>
                </div>
            </div>

            <h3 class="mt-5">Recent Reports</h3>            
            <table class="table table-striped mt-3">
                <thead>
                    <tr>
                        <th>Report ID</th>
                        <th>Type</th>
                        <th>Date Generated</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>RPT-101</td>
                        <td>Sales</td>
                        <td>2024-12-01</td>
                        <td>
                            <button class="btn btn-primary btn-sm">View</button>
                            <button class="btn btn-danger btn-sm">Delete</button>
                        </td>
                    </tr>
                    <tr>
                        <td>RPT-102</td>
                        <td>Inventory</td>
                        <td>2024-12-03</td>
                        <td>
                            <button class="btn btn-primary btn-sm">View</button>
                            <button class="btn btn-danger btn-sm">Delete</button>
                        </td>
                    </tr>
                    <tr>
                        <td>RPT-101</td>
                        <td>Sales</td>
                        <td>2024-12-01</td>
                        <td>
                            <button class="btn btn-primary btn-sm">View</button>
                            <button class="btn btn-danger btn-sm">Delete</button>
                        </td>
                    </tr>
                    <tr>
                        <td>RPT-102</td>
                        <td>Inventory</td>
                        <td>2024-12-03</td>
                        <td>
                            <button class="btn btn-primary btn-sm">View</button>
                            <button class="btn btn-danger btn-sm">Delete</button>
                        </td>
                    </tr>
                    <tr>
                        <td>RPT-101</td>
                        <td>Sales</td>
                        <td>2024-12-01</td>
                        <td>
                            <button class="btn btn-primary btn-sm">View</button>
                            <button class="btn btn-danger btn-sm">Delete</button>
                        </td>
                    </tr>
                    <tr>
                        <td>RPT-102</td>
                        <td>Inventory</td>
                        <td>2024-12-03</td>
                        <td>
                            <button class="btn btn-primary btn-sm">View</button>
                            <button class="btn btn-danger btn-sm">Delete</button>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>
