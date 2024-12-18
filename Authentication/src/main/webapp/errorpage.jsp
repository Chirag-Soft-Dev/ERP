<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Error - ERP System</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
    <!-- Custom CSS -->
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background: linear-gradient(135deg, #ff6a6a, #ff4757);
            color: #fff;
            margin: 0;
        }
        .error-container {
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }
        .error-card {
            background-color: #fff;
            color: #333;
            border-radius: 15px;
            padding: 40px;
            text-align: center;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.3);
            max-width: 500px;
            width: 100%;
            animation: fadeIn 0.8s ease-out;
        }
        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(-20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
        .error-card h3 {
            font-size: 2rem;
            color: #dc3545;
            font-weight: 700;
            margin-bottom: 15px;
        }
        .error-card p {
            font-size: 1.1rem;
            margin-bottom: 25px;
        }
        .btn-danger {
            background: linear-gradient(90deg, #dc3545, #c82333);
            border: none;
            color: #fff;
            font-size: 1rem;
            padding: 10px 20px;
            border-radius: 30px;
            transition: all 0.3s;
        }
        .btn-danger:hover {
            background: linear-gradient(90deg, #c82333, #bd2130);
            box-shadow: 0 5px 15px rgba(220, 53, 69, 0.4);
        }
        
        @media (max-width: 576px) {
            .error-card {
                padding: 20px;
            }
            .error-card h3 {
                font-size: 1.8rem;
            }
            .error-card p {
                font-size: 1rem;
            }
        }
    </style>
</head>
<body>
    <!-- Error Section -->
    <div class="error-container">
        <div class="error-card">
            <h3>Error:Username or Password is Incorrect..</h3>
            <p>Oops! We encountered an issue. Please try again.</p>
            <a href="login.jsp" class="btn btn-danger">Retry Login</a>
        </div>
    </div>

    

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
