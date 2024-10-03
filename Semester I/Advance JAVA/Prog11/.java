package clan;

import java.sql.*;
import java.util.Scanner;

public class LibrarySystem {

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        try {
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/testdb", "root", "clan1234");
            System.out.println("Connected to the database.");

            createTable(conn);

            while (true) {
                System.out.println("\nLibrary System Menu:");
                System.out.println("1. Insert a new book");
                System.out.println("2. Retrieve all books");
                System.out.println("3. Update book details");
                System.out.println("4. Delete a book");
                System.out.println("5. Exit");
                System.out.print("Choose an option: ");
                int choice = scanner.nextInt();
                scanner.nextLine();  

                switch (choice) {
                    case 1:
                        insertBook(conn, scanner);
                        break;
                    case 2:
                        retrieveBooks(conn);
                        break;
                    case 3:
                        updateBook(conn, scanner);
                        break;
                    case 4:
                        deleteBook(conn, scanner);
                        break;
                    case 5:
                        System.out.println("Exiting...");
                        return;
                    default:
                        System.out.println("Invalid option. Try again.");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (conn != null) conn.close();
                scanner.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    
    private static void createTable(Connection conn) throws SQLException {
        try (Statement stmt = conn.createStatement()) {
            stmt.executeUpdate("CREATE TABLE IF NOT EXISTS books ("
                + "book_id INT AUTO_INCREMENT PRIMARY KEY, "
                + "title TEXT, "
                + "author TEXT, "
                + "published_year INT)");
            System.out.println("Table 'books' created successfully.");
        }
    }

    
    private static void insertBook(Connection conn, Scanner scanner) throws SQLException {
        try (PreparedStatement pstmt = conn.prepareStatement("INSERT INTO books (title, author, published_year) VALUES (?, ?, ?)")) {
            System.out.print("Enter book title: ");
            String title = scanner.nextLine();
            System.out.print("Enter book author: ");
            String author = scanner.nextLine();
            System.out.print("Enter published year: ");
            int year = scanner.nextInt();
            scanner.nextLine();  

            pstmt.setString(1, title);
            pstmt.setString(2, author);
            pstmt.setInt(3, year);

            int rowsInserted = pstmt.executeUpdate();
            if (rowsInserted > 0) {
                System.out.println("Book inserted successfully.");
            }
        }
    }

    
    private static void retrieveBooks(Connection conn) throws SQLException {
        try (Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery("SELECT * FROM books")) {

            System.out.println("Books in the library:");
            while (rs.next()) {
                int bookId = rs.getInt("book_id");
                String title = rs.getString("title");
                String author = rs.getString("author");
                int year = rs.getInt("published_year");

                System.out.printf("ID: %d, Title: %s, Author: %s, Year: %d%n", bookId, title, author, year);
            }
        }
    }

    
    private static void updateBook(Connection conn, Scanner scanner) throws SQLException {
        System.out.print("Enter the book ID to update: ");
        int bookId = scanner.nextInt();
        scanner.nextLine();  

        String updateSQL = "UPDATE books SET title = ?, author = ?, published_year = ? WHERE book_id = ?";
        try (PreparedStatement pstmt = conn.prepareStatement(updateSQL)) {
            System.out.print("Enter new title: ");
            String newTitle = scanner.nextLine();
            System.out.print("Enter new author: ");
            String newAuthor = scanner.nextLine();
            System.out.print("Enter new published year: ");
            int newYear = scanner.nextInt();
            scanner.nextLine();  

            pstmt.setString(1, newTitle);
            pstmt.setString(2, newAuthor);
            pstmt.setInt(3, newYear);
            pstmt.setInt(4, bookId);

            int rowsUpdated = pstmt.executeUpdate();
            if (rowsUpdated > 0) {
                System.out.println("Book details updated successfully.");
            } else {
                System.out.println("Book not found.");
            }
        }
    }

    
    private static void deleteBook(Connection conn, Scanner scanner) throws SQLException {
        System.out.print("Enter the book ID to delete: ");
        int bookId = scanner.nextInt();
        scanner.nextLine();  

        String deleteSQL = "DELETE FROM books WHERE book_id = ?";
        try (PreparedStatement pstmt = conn.prepareStatement(deleteSQL)) {
            pstmt.setInt(1, bookId);

            int rowsDeleted = pstmt.executeUpdate();
            if (rowsDeleted > 0) {
                System.out.println("Book deleted successfully.");
            } else {
                System.out.println("Book not found.");
            }
        }
    }
}
