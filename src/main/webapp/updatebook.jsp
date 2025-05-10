<%
    if (session.getAttribute("user") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Update Book</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

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

        input[type="text"] {
            width: 100%;
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 14px;
        }

        button {
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

        button:hover {
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

        .message {
            color: #007bff;
            text-align: center;
            margin-bottom: 15px;
            font-size: 14px;
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
    </style>
</head>
<body>
    <form action="logout.jsp" method="post">
        <button class="logout-btn" type="submit">Logout</button>
    </form>

    <div class="container">
        <h1>Update Book</h1>

        <%
            String message = (String) request.getAttribute("message");
            if (message != null) {
        %>
            <div class="message"><%= message %></div>
        <%
            }
            String bookId = request.getParameter("id");
        %>

        <form method="post" action="updatebook">
            <div class="form-group">
                <label for="id">Book ID (required):</label>
                <input type="text" id="id" name="id" value="<%= (bookId != null ? bookId : "") %>" required>
            </div>

            <div class="form-group">
                <label for="title">New Title (optional):</label>
                <input type="text" id="title" name="title">
            </div>

            <div class="form-group">
                <label for="author">New Author (optional):</label>
                <input type="text" id="author" name="author">
            </div>

            <div class="form-group">
                <label for="published_year">New Published Year (optional):</label>
                <input type="text" id="published_year" name="published_year">
            </div>

            <button type="submit">Update Book</button>
        </form>
        <a href="home.jsp" class="back-link">&#8592; Back to Home</a>
    </div>
</body>
</html>
