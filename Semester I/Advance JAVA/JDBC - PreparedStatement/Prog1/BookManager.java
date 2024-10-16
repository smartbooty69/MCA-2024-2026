import java.sql.*;
import java.util.Scanner;

public class BookManager {

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int choice;

        try (Connection conn = DriverManager.getConnection("jdbc:mysql:","root", "clan1234")) {
            do {
                System.out.println("\nBook Management System:");
                System.out.println("1. Insert Book");
                System.out.println("2. View All Books");
                System.out.println("3. Update Book");
                System.out.println("4. Delete Book");
                System.out.println("5. Exit");
                System.out.print("Enter your choice: ");
                choice = sc.nextInt();
                sc.nextLine(); 

                switch (choice) {
                    case 1:
                        insertBook(conn, sc);
                        break;
                    case 2:
                        retrieveBooks(conn);
                        break;
                    case 3:
                        updateBook(conn, sc);
                        break;
                    case 4:
                        deleteBook(conn, sc);
                        break;
                    case 5:
                        System.out.println("Exiting...");
                        break;
                    default:
                        System.out.println("Invalid choice.");
                }
            } while (choice != 5);

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void insertBook(Connection conn, Scanner sc) {
        try {
            System.out.print("Enter book title: ");
            String title = sc.nextLine();
            System.out.print("Enter author name: ");
            String author = sc.nextLine();
            System.out.print("Enter published year: ");
            int publishedYear = sc.nextInt();
            sc.nextLine(); 

            String sql = "INSERT INTO books (title, author, published_year) VALUES (?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, title);
            stmt.setString(2, author);
            stmt.setInt(3, publishedYear);
            stmt.executeUpdate();

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
            while (rs.next()) {
                int bookId = rs.getInt("book_id");
                String title = rs.getString("title");
                String author = rs.getString("author");
                int year = rs.getInt("published_year");

                System.out.printf("\nBook ID: "+bookId+"\nTitle: "+title+"\nAuthor: "+author+"\nPublished Year: "+year);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public static void updateBook(Connection conn, Scanner sc) {
        try {
            System.out.print("Enter the Book ID to update: ");
            int bookId = sc.nextInt();
            sc.nextLine(); 

            System.out.print("Enter new title: ");
            String newTitle = sc.nextLine();
            System.out.print("Enter new author: ");
            String newAuthor = sc.nextLine();
            System.out.print("Enter new published year: ");
            int newYear = sc.nextInt();
            sc.nextLine(); 

            String sql = "UPDATE books SET title = ?, author = ?, published_year = ? WHERE book_id = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, newTitle);
            stmt.setString(2, newAuthor);
            stmt.setInt(3, newYear);
            stmt.setInt(4, bookId);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void deleteBook(Connection conn, Scanner sc) {
        try {
            System.out.print("Enter the Book ID to delete: ");
            int bookId = sc.nextInt();
            sc.nextLine(); 

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
