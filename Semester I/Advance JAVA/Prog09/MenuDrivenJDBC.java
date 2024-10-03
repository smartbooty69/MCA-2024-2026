package clan;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Scanner;

public class MenuDrivenJDBC {
    
    static final String DB_URL = "jdbc:mysql://localhost:3306/testdb";
    static final String USER = "root"; 
    static final String PASS = "clan1234"; 

    public static void main(String[] args) {
        Connection conn = null;
        Scanner scanner = new Scanner(System.in);
        int choice;

        try {
            conn = DriverManager.getConnection(DB_URL, USER, PASS);
            System.out.println("Connected to the database.");

            do {
                System.out.println("\nMenu:");
                System.out.println("1. Insert Data");
                System.out.println("2. Display Data");
                System.out.println("3. Exit");
                System.out.print("Enter your choice: ");
                choice = scanner.nextInt();
                scanner.nextLine(); 

                switch (choice) {
                    case 1:
                        insertData(conn, scanner); 
                        break;
                    case 2:
                        displayData(conn); 
                        break;
                    case 3:
                        System.out.println("Exiting program...");
                        break;
                    default:
                        System.out.println("Invalid choice. Please try again.");
                }
            } while (choice != 3);

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (conn != null) {
                    conn.close();
                    System.out.println("Connection closed.");
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        scanner.close();
    }

    public static void insertData(Connection conn, Scanner scanner) {
        try {
            System.out.print("Enter name: ");
            String name = scanner.nextLine();
            System.out.print("Enter email: ");
            String email = scanner.nextLine();

            String sql = "INSERT INTO users (name, email) VALUES (?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, name);
            stmt.setString(2, email);
            int rowsInserted = stmt.executeUpdate();
            if (rowsInserted > 0) {
                System.out.println("A new user was inserted successfully!");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void displayData(Connection conn) {
        try {
            String sql = "SELECT * FROM users";
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            System.out.println("ID\tName\t\tEmail");
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String email = rs.getString("email");
                System.out.println(id + "\t" + name + "\t" + email);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
