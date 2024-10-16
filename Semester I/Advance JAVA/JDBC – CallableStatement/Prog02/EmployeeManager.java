import java.sql.*;
import java.util.Scanner;

public class EmployeeManager {

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int ch;

        try (Connection conn = DriverManager.getConnection("jdbc:mysql:","root", "clan1234")) {
            System.out.println("Connected to the database.");

            do {
                System.out.println("\nEmployee Management System:");
                System.out.println("1. Update Employee");
                System.out.println("2. Delete Employee");
                System.out.println("3. Exit");
                System.out.print("Enter your choice: ");
                ch = sc.nextInt();
                sc.nextLine(); 

                switch (ch) {
                    case 1:
                        updateEmployee(conn, sc);
                        break;
                    case 2:
                        deleteEmployee(conn, sc);
                        break;
                    case 3:
                        System.out.println("Exiting...");
                        break;
                    default:
                        System.out.println("Invalid choice.");
                }
            } while (ch != 3);

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public static void updateEmployee(Connection conn, Scanner sc) {
        try {
            System.out.print("Enter employee ID to update: ");
            int empId = sc.nextInt();
            sc.nextLine(); 

            System.out.print("Enter new employee name: ");
            String name = sc.nextLine();
            System.out.print("Enter new employee position: ");
            String position = sc.nextLine();
            System.out.print("Enter new employee salary: ");
            double salary = sc.nextDouble();
            sc.nextLine(); 

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

    public static void deleteEmployee(Connection conn, Scanner sc) {
        try {
            System.out.print("Enter employee ID to delete: ");
            int empId = sc.nextInt();
            sc.nextLine(); 

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
