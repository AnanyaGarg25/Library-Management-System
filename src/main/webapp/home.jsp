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
    <title>Library Dashboard</title>
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

        .dashboard-container {
            background-color: #fff;
            padding: 40px 35px;
            border-radius: 20px;
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.15);
            width: 400px;
            text-align: center;
        }

        .dashboard-container h1 {
            font-size: 26px;
            margin-bottom: 30px;
            font-weight: 600;
            color: #333;
        }

        .dashboard-container ul {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .dashboard-container ul li {
            margin-bottom: 20px;
        }

        .dashboard-container ul li a {
            display: block;
            text-decoration: none;
            font-size: 16px;
            color: white;
            font-weight: 500;
            background-color: #007bff;
            padding: 12px;
            border-radius: 10px;
            transition: background-color 0.3s ease, transform 0.1s ease;
        }

        .dashboard-container ul li a:hover {
            background-color: #0056b3;
            transform: scale(1.03);
        }

        .logout-btn {
            display: block;
            margin-top: 30px;
            background: #e74c3c;
            color: white;
            padding: 12px;
            border-radius: 10px;
            text-decoration: none;
            font-size: 16px;
            font-weight: 500;
            transition: background-color 0.3s ease, transform 0.1s ease;
        }

        .logout-btn:hover {
            background: #c0392b;
            transform: scale(1.03);
        }
    </style>
</head>
<body>
    <div class="dashboard-container">
        <h1>Library Dashboard</h1>
        <ul>
            <li><a href="addbook.jsp">Add a New Book</a></li>
            <li><a href="updatebook.jsp">Update an Existing Book</a></li>
            <li><a href="index.jsp">Search a Book</a></li>
        </ul>
        <a href="logout.jsp" class="logout-btn">Logout</a>
    </div>
</body>
</html>
