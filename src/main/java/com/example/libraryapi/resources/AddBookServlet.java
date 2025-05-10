package com.example.libraryapi.resources;

import com.example.libraryapi.DBUtil;

import java.io.IOException;
import java.sql.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/addbook")
public class AddBookServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String author = request.getParameter("author");
        String title = request.getParameter("title");
        String published_year = request.getParameter("published_year");
        
        String sql = "INSERT INTO books (title, author,published_year) VALUES (?, ?, ?)";

        try (Connection connection = DBUtil.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setString(1, title);
            statement.setString(2, author);
            statement.setInt(3, Integer.parseInt(published_year));
            int rowsInserted = statement.executeUpdate();
            
            if (rowsInserted > 0) {
                request.setAttribute("message", "Book added successfully!");
            } else {
                request.setAttribute("message", "Failed to add the book. Please try again.");
            }
            
            request.getRequestDispatcher("addbook.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("message", "❌ Error: " + e.getMessage());
            request.getRequestDispatcher("addbook.jsp").forward(request, response);
        }
    }
}
