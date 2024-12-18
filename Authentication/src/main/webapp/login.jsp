<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - ERP System</title>
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
        }
        .login-container {
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .login-card {
            background-color: #fff;
            color: #333;
            border-radius: 15px;
            padding: 40px;
            width: 100%;
            max-width: 400px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.3);
        }
        .login-card h3 {
            font-weight: 700;
            color: #6a11cb;
            text-align: center;
            margin-bottom: 30px;
        }
        .form-label {
            font-weight: 500;
        }
        .form-control:focus {
            border-color: #6a11cb;
            box-shadow: 0 0 8px rgba(106, 17, 203, 0.3);
        }
        .form-check-label {
            font-size: 0.9rem;
        }
        .btn-primary {
            background-color: #6a11cb;
            border-color: #6a11cb;
            transition: all 0.3s;
        }
        .btn-primary:hover {
            background-color: #5011a8;
            border-color: #5011a8;
        }
        .text-center a {
            color: #6a11cb;
            font-weight: 500;
        }
        .text-center a:hover {
            text-decoration: underline;
        }
        
    </style>
</head>
<body>
    <!-- Login Section -->
    <div class="login-container">
        <div class="login-card">
            <h3>Welcome Back</h3>
            <form action="LoginController" method="post" id="loginForm">
                <div class="mb-3">
                    <label for="username" class="form-label">Username</label>
                    <input type="text" class="form-control" id="username" name="username" placeholder="Enter your username" required>
                </div>
                <div class="mb-3">
                    <label for="password" class="form-label">Password</label>
                    <input type="password" class="form-control" id="password" name="pass" placeholder="Enter your password" required>
                </div>
                
                <div class="d-grid">
                    <button type="submit" class="btn btn-primary btn-lg">Login</button>
                </div>
                <div class="text-center mt-3">
                    <small>Don't have an account? <a href="register.jsp">Register here</a></small>
                </div>
            </form>
        </div>
    </div>

    

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>

    <!-- JavaScript for Form Validation -->
    <script>
        document.getElementById("loginForm").addEventListener("submit", function (e) {
            const username = document.getElementById("username").value.trim();
            const password = document.getElementById("password").value.trim();

            if (username === "" || password === "") {
                e.preventDefault();
                alert("Both fields are required.");
            }
        });
    </script>
</body>
</html>
