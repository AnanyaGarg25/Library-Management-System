package com.example.libraryapi.resources;

import com.example.libraryapi.DBUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/book")
public class BookServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String author = request.getParameter("author");
        String title = request.getParameter("title");
        String searchType = request.getParameter("searchType");

        id = (id != null) ? id.trim() : "";
        author = (author != null) ? author.trim() : "";
        title = (title != null) ? title.trim() : "";

        boolean hasValidCriteria = !id.isEmpty() || !author.isEmpty() || !title.isEmpty();
        
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        out.println("<!DOCTYPE html><html lang='en'>");
        out.println("<head>");
        out.println("<meta charset='UTF-8'>");
        out.println("<meta name='viewport' content='width=device-width, initial-scale=1.0'>");
        out.println("<title>Book Search Results</title>");
        out.println("<link href='https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap' rel='stylesheet'>");
        out.println("<style>");
        out.println("body { margin: 0; font-family: 'Poppins', sans-serif; background: linear-gradient(135deg, #89f7fe 0%, #a0e9ff 30%, #b5dfff 60%, #66a6ff 100%); background-attachment: fixed; background-size: cover; color: #333; }");
        out.println(".container { max-width: 900px; margin: 50px auto; background: #fff; padding: 30px 40px; border-radius: 16px; box-shadow: 0 10px 25px rgba(0, 0, 0, 0.15); }");
        out.println("h2 { text-align: center; color: #333; margin-bottom: 25px; }");
        out.println("table { width: 100%; border-collapse: collapse; margin-top: 20px; }");
        out.println("th, td { padding: 14px 18px; text-align: left; border-bottom: 1px solid #ccc; font-size: 15px; }");
        out.println("th { background-color: #007bff; color: white; font-weight: 600; }");
        out.println("tr:hover { background-color: #f1f1f1; }");
        out.println(".message { text-align: center; font-size: 18px; color: #cc0000; margin-top: 20px; }");
        out.println(".back-btn { display: inline-block; margin-top: 30px; background: #007bff; color: #fff; padding: 12px 20px; border-radius: 8px; text-decoration: none; font-size: 14px; transition: 0.3s; }");
        out.println(".back-btn:hover { background: #0056b3; }");
        out.println(".btn-wrapper { text-align: center; }");
        out.println("body { ... background-size: 300% 300%; animation: gradientFade 15s ease infinite; }");
        out.println("@keyframes gradientFade { 0% { background-position: 0% 50%; } 50% { background-position: 100% 50%; } 100% { background-position: 0% 50%; } }");
        out.println("</style>");
        out.println("</head>");
        out.println("<body>");
        out.println("<div class='container'>");

        
        if (!hasValidCriteria) {
            out.println("<h2>⚠️ Please provide at least one valid search criterion (ID, Title, or Author).</h2>");
            out.println("<div class='btn-wrapper'><a class='back-btn' href='index.jsp'>← Back to Search</a></div>");
            out.println("</div></body></html>");
            return;
        }

        String sql = "SELECT * FROM books WHERE 1=1";
        if (id != null && !id.isEmpty()) sql += " AND id = ?";
        if (author != null && !author.isEmpty()) sql += " AND author LIKE ?";
        if (title != null && !title.isEmpty()) sql += " AND title LIKE ?";
        

        try (Connection connection = DBUtil.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            int index = 1;
            if (id != null && !id.isEmpty()) statement.setInt(index++, Integer.parseInt(id));
            
            if (author != null && !author.isEmpty()) {
                if ("startsWith".equals(searchType)) {
                    statement.setString(index++, author + "%");
                } else if ("endsWith".equals(searchType)) {
                    statement.setString(index++, "%" + author);
                } else {
                    statement.setString(index++, "%" + author + "%");
                }
            }          
            
            if (title != null && !title.isEmpty()) {
                if ("startsWith".equals(searchType)) {
                    statement.setString(index++, title + "%");
                } else if ("endsWith".equals(searchType)) {
                    statement.setString(index++, "%" + title);
                } else {
                    statement.setString(index++, "%" + title + "%");
                }
            }

            ResultSet rs = statement.executeQuery();
            boolean found = false;
            
            out.println("<h2>Book Search Results</h2>");
            out.println("<table>");
            out.println("<tr><th>ID</th><th>Title</th><th>Author</th><th>Published Year</th><th>Actions</th></tr>");

            while (rs.next()) {
                found = true;
                int bookId = rs.getInt("id");
                String bookTitle = rs.getString("title");
                String bookAuthor = rs.getString("author");
                int bookYear = rs.getInt("published_year");

                out.println("<tr>");
                out.println("<td>" + bookId + "</td>");
                out.println("<td>" + bookTitle + "</td>");
                out.println("<td>" + bookAuthor + "</td>");
                out.println("<td>" + bookYear + "</td>");
                out.println("<td>");
                out.println("<form method='get' action='updatebook.jsp'>");
                out.println("<input type='hidden' name='id' value='" + bookId + "'>");
                out.println("<input type='hidden' name='title' value='" + bookTitle + "'>");
                out.println("<input type='hidden' name='author' value='" + bookAuthor + "'>");
                out.println("<input type='hidden' name='published_year' value='" + bookYear + "'>");
                out.println("<input type='submit' value='Update'>");
                out.println("</form>");
                out.println("</td>");
                out.println("</tr>");
            }

            out.println("</table>");

            if (!found) {
                response.getWriter().println("<h2>No book found with the given criteria.</h2>");
            }

            out.println("<div class='btn-wrapper'><a class='back-btn' href='index.jsp'>← Back to Search</a></div>");

        } catch (SQLException e) {
            e.printStackTrace();
            out.println("<div class='message'>⚠️ Database error occurred. Please try again later.</div>");
            out.println("<div class='btn-wrapper'><a class='back-btn' href='index.jsp'>← Back to Search</a></div>");
        }
    }
}
