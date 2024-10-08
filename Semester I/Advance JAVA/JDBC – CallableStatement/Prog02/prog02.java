package clan;

import java.sql.*;
import java.util.Scanner;

public class EmployeeManager {

    static final String DB_URL = "jdbc:mysql:";
    static final String USER = "root"; 
    static final String PASS = "your_password"; 

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int choice;

        try (Connection conn = DriverManager.getConnection(DB_URL, USER, PASS)) {
            System.out.println("Connected to the database.");

            do {
                System.out.println("\nEmployee Management System:");
                System.out.println("1. Update Employee");
                System.out.println("2. Delete Employee");
                System.out.println("3. Exit");
                System.out.print("Enter your choice: ");
                choice = scanner.nextInt();
                scanner.nextLine(); 

                switch (choice) {
                    case 1:
                        updateEmployee(conn, scanner);
                        break;
                    case 2:
                        deleteEmployee(conn, scanner);
                        break;
                    case 3:
                        System.out.println("Exiting...");
                        break;
                    default:
                        System.out.println("Invalid choice. Try again.");
                }
            } while (choice != 3);

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public static void updateEmployee(Connection conn, Scanner scanner) {
        try {
            System.out.print("Enter employee ID to update: ");
            int empId = scanner.nextInt();
            scanner.nextLine(); 

            System.out.print("Enter new employee name: ");
            String name = scanner.nextLine();
            System.out.print("Enter new employee position: ");
            String position = scanner.nextLine();
            System.out.print("Enter new employee salary: ");
            double salary = scanner.nextDouble();
            scanner.nextLine(); 

            String sql = "{CALL UpdateEmployee(?, ?, ?, ?)}";
            CallableStatement stmt = conn.prepareCall(sql);
            stmt.setInt(1, empId);
            stmt.setString(2, name);
            stmt.setString(3, position);
            stmt.setDouble(4, salary);

            int rowsAffected = stmt.executeUpdate();
            if (rowsAffected > 0) {
                System.out.println("Employee updated successfully.");
            } else {
                System.out.println("No employee found with ID: " + empId);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void deleteEmployee(Connection conn, Scanner scanner) {
        try {
            System.out.print("Enter employee ID to delete: ");
            int empId = scanner.nextInt();
            scanner.nextLine(); 

            String sql = "{CALL DeleteEmployee(?)}";
            CallableStatement stmt = conn.prepareCall(sql);
            stmt.setInt(1, empId);

            int rowsAffected = stmt.executeUpdate();
            if (rowsAffected > 0) {
                System.out.println("Employee deleted successfully.");
            } else {
                System.out.println("No employee found with ID: " + empId);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
