# 📚 Library Management System (Java-based)

A simple and efficient Library Management System built using **Java**, **MySQL**, and **NetBeans**. The system allows users to register, log in, and manage books — including adding, searching, and updating book records.

---

## 🚀 Features

- ✅ **User Registration & Login**  
  Secure and simple authentication system for users.

- 📘 **Book Management**  
  Easily add new books, search for books by keywords, and update book information.

- 🗃️ **Database Integration**  
  Uses **MySQL** to store and retrieve user and book data efficiently.

- 💻 **User Interface**  
  Intuitive and user-friendly GUI built with NetBeans for smooth library operations.

---

## 🛠️ Technologies Used

- **Java** (Core Logic & Backend)
- **NetBeans** (IDE)
- **MySQL** (Relational Database)
- **JDBC** (Java Database Connectivity)

---

## ⚙️ Setup Instructions

1. **Clone the repository:**
   ```bash
   git clone https://github.com/AnanyaGarg25/Library-Management-System.git
   cd Library-Management-System
   
2. **Set up the MySQL Database:**
   - Open MySQL Workbench (or any client) and run the provided SQL script librarydb.sql to            create the database and tables
3. **Configure the Database Connection:**
   - Open the project in NetBeans (Preferably "target\LibraryAPI-1.0-SNAPSHOT.war").
   - Locate your JDBC connection code (typically in a class like DBConnection.java)
   - Update the database URL, username, and password to match your MySQL configuration:
     String url = "jdbc:mysql://localhost:3306/librarydb";
     String user = "root";
     String password = "your_password";
4. **Build & Run the Project:**
   - In NetBeans: Right-click the project > Clean and Build
   - Run the application by clicking Run Project or pressing Shift + F6

---

## 🧑‍💻 Author
Ananya Garg
GitHub: @AnanyaGarg25






