import java.sql.*;
import java.util.Scanner;

public class MenuDrivenStudentRecords { 

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int choice;

        try {
            
            Connection conn = DriverManager.getConnection("jdbc:mysql:", "root", "clan1234");
            Statement stmt = conn.createStatement();
            System.out.println("Connected to the database!");

            String createTableSQL = "CREATE TABLE IF NOT EXISTS students (" +
                                    "student_id INT AUTO_INCREMENT PRIMARY KEY, " +
                                    "name VARCHAR(100), " +
                                    "age INT, " +
                                    "grade VARCHAR(10))";
            stmt.executeUpdate(createTableSQL);
            System.out.println("Table 'students' is ready.");

            do {
                System.out.println("\nMenu:");
                System.out.println("1. Insert a student record");
                System.out.println("2. Display all student records");
                System.out.println("3. Drop the students table");
                System.out.println("4. Exit");
                System.out.print("Enter your choice: ");
                choice = scanner.nextInt();
                scanner.nextLine(); 

                switch (choice) {
                    case 1:
                        insertStudentRecord(stmt, scanner);  
                        break;
                    case 2:
                        displayStudentRecords(stmt);  
                        break;
                    case 3:
                        dropStudentsTable(stmt);  
                        break;
                    case 4:
                        System.out.println("Exiting program...");
                        break;
                    default:
                        System.out.println("Invalid choice. Please try again.");
                }
            } while (choice != 4);

        } catch (SQLException e) {
            e.printStackTrace();
        }
        scanner.close();
    }

    public static void insertStudentRecord(Statement stmt, Scanner scanner) {
        try {
            System.out.print("Enter student name: ");
            String name = scanner.nextLine();
            System.out.print("Enter student age: ");
            int age = scanner.nextInt();
            scanner.nextLine();  
            System.out.print("Enter student grade: ");
            String grade = scanner.nextLine();

            String insertSQL = "INSERT INTO students (name, age, grade) VALUES ('" + name + "', " + age + ", '" + grade + "')";
            stmt.executeUpdate(insertSQL);
            System.out.println("Record inserted successfully.");

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void displayStudentRecords(Statement stmt) {
        try {
            String selectSQL = "SELECT * FROM students";
            ResultSet rs = stmt.executeQuery(selectSQL);

            System.out.println("\nStudent Records:");
            while (rs.next()) {
                int studentId = rs.getInt("student_id");
                String name = rs.getString("name");
                int age = rs.getInt("age");
                String grade = rs.getString("grade");

                System.out.println("ID: " + studentId + ", Name: " + name + ", Age: " + age + ", Grade: " + grade);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void dropStudentsTable(Statement stmt) {
        try {
            String dropTableSQL = "DROP TABLE IF EXISTS students";
            stmt.executeUpdate(dropTableSQL);
            System.out.println("Table 'students' has been dropped.");

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
