<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Library Login</title>
   <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #667eea, #764ba2);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            color: #333;
        }

        .login-container {
            background-color: #fff;
            padding: 40px 35px;
            border-radius: 20px;
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.2);
            width: 360px;
            transition: transform 0.3s ease;
        }

        .login-container:hover {
            transform: translateY(-5px);
        }

        h2 {
            text-align: center;
            margin-bottom: 30px;
            color: #333;
        }

        .form-group {
            position: relative;
            margin-bottom: 25px;
        }

        .form-group input {
            width: 100%;
            padding: 14px 12px 14px 12px;
            font-size: 15px;
            font-weight: 500;
            border: 1px solid #ccc;
            border-radius: 10px;
            outline: none;
            background-color: #fff;
            color: #333;
        }

        .form-group label {
            position: absolute;
            left: 12px;
            top: 12px;
            background: white;
            padding: 0 4px;
            color: #555;
            font-size: 14px;
            font-weight: 600;
            transition: 0.2s ease all;
            pointer-events: none;
        }

        .form-group input:focus + label,
        .form-group input:not(:placeholder-shown) + label {
            top: -10px;
            left: 8px;
            font-size: 12px;
            color: #007bff;
        }

        input[type="submit"] {
            width: 100%;
            padding: 12px;
            background-color: #007bff;
            color: white;
            font-size: 16px;
            border: none;
            border-radius: 10px;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.1s ease;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
            transform: scale(1.03);
        }

        .error,
        .success-message {
            text-align: center;
            font-size: 14px;
            margin-bottom: 20px;
            padding: 10px;
            border-radius: 8px;
        }

        .error {
            background-color: #fdecea;
            color: #b02a37;
            border: 1px solid #f5c2c7;
        }

        .success-message {
            background-color: #e6f4ea;
            color: #2d7a41;
            border: 1px solid #badbcc;
            animation: fadeOut 3s forwards;
        }

        @keyframes fadeOut {
            0%, 80% { opacity: 1; }
            100% { opacity: 0; visibility: hidden; }
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h2>Library Login</h2>
        <% if (request.getAttribute("error") != null) { %>
            <div class="error"><%= request.getAttribute("error") %></div>
        <% } else if (request.getAttribute("success") != null) { %>
            <div class="success-message"><%= request.getAttribute("success") %></div>
        <% } %>

        <form method="post" action="login">
            <div class="form-group">
                <input type="text" name="username" id="username" placeholder=" " required>
                <label for="username">User:</label>
            </div>
            <div class="form-group">
                <input type="password" name="password" id="password" placeholder=" " required>
                <label for="password">Password:</label>            
            </div>
            <input type="submit" value="Login">
        </form>
        <p style="text-align:center; margin-top: 15px;">
            Don't have an account? 
            <a href="register.jsp" style="color: #007bff; text-decoration: none;">Register here</a>
        </p>
    </div>
</body>
</html>
