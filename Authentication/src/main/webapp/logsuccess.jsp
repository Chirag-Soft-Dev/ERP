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
            background: linear-gradient(135deg, #6a11cb, #2575fc);
            color: #fff;
            margin: 0;
        }
        .success-container {
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }
        .success-card {
            background-color: #fff;
            color: #333;
            border-radius: 15px;
            padding: 40px;
            text-align: center;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.3);
            max-width: 500px;
            width: 100%;
        }
        .success-card h3 {
            font-size: 2rem;
            color: #28a745;
            font-weight: 700;
            margin-bottom: 15px;
        }
        .success-card p {
            font-size: 1.1rem;
            margin-bottom: 25px;
        }
        .btn-success {
            background: linear-gradient(90deg, #28a745, #218838);
            border: none;
            color: #fff;
            font-size: 1rem;
            padding: 10px 20px;
            border-radius: 30px;
            transition: all 0.3s;
        }
        .btn-success:hover {
            background: linear-gradient(90deg, #218838, #1e7e34);
            box-shadow: 0 5px 15px rgba(40, 167, 69, 0.4);
        }
        
        @media (max-width: 576px) {
            .success-card {
                padding: 20px;
            }
            .success-card h3 {
                font-size: 1.8rem;
            }
            .success-card p {
                font-size: 1rem;
            }
        }
    </style>
</head>
<body>
    <!-- Success Section -->
    <div class="success-container">
        <div class="success-card">
            <h3>Login Successful!</h3>
            <p>Welcome back, Admin! You can now access the Dashboard.</p>
            <a href="home.jsp" class="btn btn-success">Go To Dashboard</a>
        </div>
    </div>

    

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
