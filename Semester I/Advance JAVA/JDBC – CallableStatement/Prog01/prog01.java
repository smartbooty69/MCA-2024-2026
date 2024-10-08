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
                System.out.println("1. Insert Employee");
                System.out.println("2. View All Employees");
                System.out.println("3. Exit");
                System.out.print("Enter your choice: ");
                choice = scanner.nextInt();
                scanner.nextLine(); 

                switch (choice) {
                    case 1:
                        insertEmployee(conn, scanner);
                        break;
                    case 2:
                        retrieveEmployees(conn);
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

    public static void insertEmployee(Connection conn, Scanner scanner) {
        try {
            System.out.print("Enter employee name: ");
            String name = scanner.nextLine();
            System.out.print("Enter employee position: ");
            String position = scanner.nextLine();
            System.out.print("Enter employee salary: ");
            double salary = scanner.nextDouble();
            scanner.nextLine(); 

            String sql = "{CALL InsertEmployee(?, ?, ?)}";
            CallableStatement stmt = conn.prepareCall(sql);
            stmt.setString(1, name);
            stmt.setString(2, position);
            stmt.setDouble(3, salary);

            stmt.execute();
            System.out.println("Employee inserted successfully.");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void retrieveEmployees(Connection conn) {
        try {
            String sql = "{CALL GetEmployees()}";
            CallableStatement stmt = conn.prepareCall(sql);

            ResultSet rs = stmt.executeQuery();

            System.out.println("\nList of Employees:");
            System.out.println("------------------------------------------------");
            System.out.printf("%-10s %-20s %-20s %-10s\n", "Emp ID", "Name", "Position", "Salary");
            System.out.println("------------------------------------------------");

            while (rs.next()) {
                int empId = rs.getInt("emp_id");
                String name = rs.getString("name");
                String position = rs.getString("position");
                double salary = rs.getDouble("salary");

                System.out.printf("%-10d %-20s %-20s %-10.2f\n", empId, name, position, salary);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
