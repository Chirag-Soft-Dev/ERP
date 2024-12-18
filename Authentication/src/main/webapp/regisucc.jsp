<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Success - ERP System</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
    <!-- Custom CSS -->
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background: linear-gradient(135deg, #007bff, #6610f2);
            color: #fff;
        }
        .success-container {
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .success-card {
            background-color: #fff;
            color: #333;
            border-radius: 15px;
            padding: 40px;
            text-align: center;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.3);
            max-width: 500px;
            width: 100%;
        }
        .success-card h3 {
            font-size: 2rem;
            color: #28a745;
            font-weight: 700;
            margin-bottom: 20px;
        }
        .success-card p {
            font-size: 1.1rem;
            margin-bottom: 30px;
        }
        .btn-success {
            background: linear-gradient(90deg, #28a745, #218838);
            border: none;
            font-size: 1rem;
            padding: 10px 20px;
            border-radius: 30px;
            transition: all 0.3s;
        }
        .btn-success:hover {
            background: #3ba18a;
            box-shadow: 0 4px 10px rgba(67, 206, 162, 0.5);
        }
        .footer {
            text-align: center;
            margin-top: 40px;
            font-size: 0.85rem;
            color: #ddd;
        }
        
    </style>
</head>
<body>
    <!-- Success Section -->
    <div class="success-container">
        <div class="success-card">
            <h3>Registration Successful!</h3>
            <p>Congratulations, your account has been created successfully. You can now log in to access the ERP System.</p>
            <a href="login.jsp" class="btn btn-success">Go To Login</a>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
