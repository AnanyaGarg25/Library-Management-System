<%
    if (session.getAttribute("user") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add New Book</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }

        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #89f7fe, #66a6ff);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            color: #333;
        }

        .container {
            background-color: #fff;
            padding: 30px 40px;
            border-radius: 16px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.15);
            width: 100%;
            max-width: 450px;
        }

        h1 {
            text-align: center;
            margin-bottom: 25px;
            font-size: 24px;
            color: #333;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            font-weight: 600;
            margin-bottom: 6px;
            display: block;
            font-size: 14px;
        }

        input[type="text"],
        input[type="number"] {
            width: 100%;
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 14px;
        }

        input[type="submit"] {
            width: 100%;
            margin-top: 10px;
            padding: 12px;
            background-color: #007bff;
            color: white;
            font-size: 16px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }

        .logout-btn {
            position: absolute;
            top: 20px;
            right: 30px;
            background-color: #ff4d4d;
            color: #fff;
            border: none;
            padding: 10px 16px;
            border-radius: 6px;
            font-size: 14px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .logout-btn:hover {
            background-color: #e60000;
        }

        .back-link {
            display: block;
            margin-top: 20px;
            text-align: center;
            font-size: 14px;
            color: #007bff;
            text-decoration: none;
        }

        .back-link:hover {
            text-decoration: underline;
        }

        .message {
            color: #007bff;
            text-align: center;
            margin-bottom: 15px;
            font-size: 14px;
        }
    </style>
</head>
<body>
    <form action="logout.jsp" method="post">
        <button class="logout-btn" type="submit">Logout</button>
    </form>

    <div class="container">
        <h1>Add a New Book</h1>
        
        <%
            String message = (String) request.getAttribute("message");
            if (message != null) {
        %>
            <div class="message"><%= message %></div>
        <%
            }
        %>

        <form method="post" action="addbook">
            <div class="form-group">
                <label>Title:</label>
                <input type="text" name="title" required>
            </div>

            <div class="form-group">
                <label>Author:</label>
                <input type="text" name="author" required>
            </div>

            <div class="form-group">
                <label>Published Year:</label>
                <input type="number" name="published_year" required>
            </div>

            <input type="submit" value="Add Book">
        </form>
        <a href="home.jsp" class="back-link">&#8592; Back to Home</a>
    </div>
</body>
</html>
