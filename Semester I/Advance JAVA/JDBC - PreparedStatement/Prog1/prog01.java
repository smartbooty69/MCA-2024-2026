package clan;

import java.sql.*;
import java.util.Scanner;

public class BookManager {

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int choice;

        try (Connection conn = DriverManager.getConnection("jdbc:mysql:","root", "clan1234")) {
            System.out.println("Connected to the database.");

            String createTableSQL = "CREATE TABLE IF NOT EXISTS books (" +
                                    "book_id INT PRIMARY KEY AUTO_INCREMENT, " +
                                    "title TEXT NOT NULL, " +
                                    "author TEXT NOT NULL, " +
                                    "published_year INT NOT NULL)";
            stmt.executeUpdate(createTableSQL);
            System.out.println("Table 'students' is ready.");

            do {
                System.out.println("\nBook Management System:");
                System.out.println("1. Insert Book");
                System.out.println("2. View All Books");
                System.out.println("3. Update Book");
                System.out.println("4. Delete Book");
                System.out.println("5. Exit");
                System.out.print("Enter your choice: ");
                choice = scanner.nextInt();
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
                        break;
                    default:
                        System.out.println("Invalid choice. Try again.");
                }
            } while (choice != 5);

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void insertBook(Connection conn, Scanner scanner) {
        try {
            System.out.print("Enter book title: ");
            String title = scanner.nextLine();
            System.out.print("Enter author name: ");
            String author = scanner.nextLine();
            System.out.print("Enter published year: ");
            int publishedYear = scanner.nextInt();
            scanner.nextLine(); 

            String sql = "INSERT INTO books (title, author, published_year) VALUES (?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, title);
            stmt.setString(2, author);
            stmt.setInt(3, publishedYear);

            int rowsInserted = stmt.executeUpdate();
            if (rowsInserted > 0) {
                System.out.println("Book inserted successfully!");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void retrieveBooks(Connection conn) {
        try {
            String sql = "SELECT * FROM books";
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            System.out.println("\nList of Books:");
            System.out.println("------------------------------------------------");
            System.out.printf("%-10s %-30s %-20s %-15s\n", "Book ID", "Title", "Author", "Published Year");
            System.out.println("------------------------------------------------");

            while (rs.next()) {
                int bookId = rs.getInt("book_id");
                String title = rs.getString("title");
                String author = rs.getString("author");
                int year = rs.getInt("published_year");

                System.out.printf("%-10d %-30s %-20s %-15d\n", bookId, title, author, year);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public static void updateBook(Connection conn, Scanner scanner) {
        try {
            System.out.print("Enter the Book ID to update: ");
            int bookId = scanner.nextInt();
            scanner.nextLine(); 

            System.out.print("Enter new title: ");
            String newTitle = scanner.nextLine();
            System.out.print("Enter new author: ");
            String newAuthor = scanner.nextLine();
            System.out.print("Enter new published year: ");
            int newYear = scanner.nextInt();
            scanner.nextLine(); 

            String sql = "UPDATE books SET title = ?, author = ?, published_year = ? WHERE book_id = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, newTitle);
            stmt.setString(2, newAuthor);
            stmt.setInt(3, newYear);
            stmt.setInt(4, bookId);

            int rowsUpdated = stmt.executeUpdate();
            if (rowsUpdated > 0) {
                System.out.println("Book details updated successfully!");
            } else {
                System.out.println("No book found with the given ID.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void deleteBook(Connection conn, Scanner scanner) {
        try {
            System.out.print("Enter the Book ID to delete: ");
            int bookId = scanner.nextInt();
            scanner.nextLine(); 

            String sql = "DELETE FROM books WHERE book_id = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, bookId);

            int rowsDeleted = stmt.executeUpdate();
            if (rowsDeleted > 0) {
                System.out.println("Book deleted successfully!");
            } else {
                System.out.println("No book found with the given ID.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
