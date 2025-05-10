package com.example.libraryapi.resources;

import com.example.libraryapi.DBUtil;

import java.io.IOException;
import java.sql.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/updatebook")
public class UpdateBookServlet extends HttpServlet {
    @Override
protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

    String id = request.getParameter("id");
    String title = request.getParameter("title");
    String author = request.getParameter("author");
    String published_year = request.getParameter("published_year");

    if (id == null || id.isEmpty()) {
        request.setAttribute("message", "Book ID is required.");
        request.getRequestDispatcher("updatebook.jsp").forward(request, response);
        return;
    }

    StringBuilder sqlBuilder = new StringBuilder("UPDATE books SET ");
    List<Object> parameters = new ArrayList<>();

    if (title != null && !title.trim().isEmpty()) {
        sqlBuilder.append("title = ?, ");
        parameters.add(title);
    }
    if (author != null && !author.trim().isEmpty()) {
        sqlBuilder.append("author = ?, ");
        parameters.add(author);
    }
    if (published_year != null && !published_year.trim().isEmpty()) {
        sqlBuilder.append("published_year = ?, ");
        try {
            parameters.add(Integer.parseInt(published_year));
        } catch (NumberFormatException e) {
            request.setAttribute("message", "Invalid published year.");
            request.getRequestDispatcher("updatebook.jsp").forward(request, response);
            return;
        }
    }

    if (parameters.isEmpty()) {
        request.setAttribute("message", "No fields to update.");
        request.getRequestDispatcher("updatebook.jsp").forward(request, response);
        return;
    }

    sqlBuilder.setLength(sqlBuilder.length() - 2);
    sqlBuilder.append(" WHERE id = ?");
    parameters.add(Integer.parseInt(id));

    try (Connection connection = DBUtil.getConnection();
         PreparedStatement statement = connection.prepareStatement(sqlBuilder.toString())) {

        for (int i = 0; i < parameters.size(); i++) {
            Object param = parameters.get(i);
            if (param instanceof Integer) {
                statement.setInt(i + 1, (Integer) param);
            } else {
                statement.setString(i + 1, (String) param);
            }
        }

        int rowsUpdated = statement.executeUpdate();
        if (rowsUpdated > 0) {
            request.setAttribute("message", "Book updated successfully.");
        } else {
            request.setAttribute("message", "No book found with ID: " + id);
        }

    } catch (Exception e) {
        e.printStackTrace();
        request.setAttribute("message", "Error: " + e.getMessage());
    }

        request.getRequestDispatcher("updatebook.jsp").forward(request, response);
    }
}
