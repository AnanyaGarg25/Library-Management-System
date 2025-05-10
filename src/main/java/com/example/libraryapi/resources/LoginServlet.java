package com.example.libraryapi.resources;

import com.example.libraryapi.DBUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        boolean isAuthenticated = false;

        try (Connection conn = DBUtil.getConnection()) {
            String sql = "SELECT * FROM users WHERE username = ? AND password = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, username);
            stmt.setString(2, password);

            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                isAuthenticated = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        if (isAuthenticated) {
            HttpSession session = request.getSession();
            session.setAttribute("user", username);
            response.sendRedirect("home.jsp");
        } else {
            //response.setContentType("text/html");
            //PrintWriter out = response.getWriter();
            //out.println("<h3 style='color:red;text-align:center;'>Invalid username or password</h3>");
            
            request.setAttribute("error", "An error occurred. Please try again.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            //response.sendRedirect("login.jsp");
        }
    }
}
