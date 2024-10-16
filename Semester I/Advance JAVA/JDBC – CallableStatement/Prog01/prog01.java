import java.sql.*;
import java.util.Scanner;

public class prog01 {
    
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int ch;

        try (Connection conn = DriverManager.getConnection("jdbc:mysql:","root", "clan1234")) {
            System.out.println("Connected to the database.");
            
            do {
                System.out.println("\nEmployee Management System:");
                System.out.println("1. Insert Employee");
                System.out.println("2. View All Employees");
                System.out.println("3. Exit");
                System.out.print("Enter your choice: ");
                ch = sc.nextInt();
                sc.nextLine(); 

                switch (ch) {
                    case 1:
                        insertEmployee(conn, sc);
                        break;
                    case 2:
                        retrieveEmployees(conn);
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

    public static void insertEmployee(Connection conn, Scanner sc) {
        try {
            System.out.print("Enter employee name: ");
            String name = sc.nextLine();
            System.out.print("Enter employee position: ");
            String position = sc.nextLine();
            System.out.print("Enter employee salary: ");
            double salary = sc.nextDouble();
            sc.nextLine(); 

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
            while (rs.next()) {
                int empId = rs.getInt("emp_id");
                String name = rs.getString("name");
                String position = rs.getString("position");
                double salary = rs.getDouble("salary");

                System.out.printf("\nEmp ID: "+empId+"\nName: "+name+"\nPosition: "+position+"\nSalary: "+salary);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
