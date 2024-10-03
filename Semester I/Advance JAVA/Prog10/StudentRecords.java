package clan;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class StudentRecords {

	public static void main(String[] args) {
        
		try {
            System.out.println("Connecting to database...");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/testdb", "root", "clan1234");
            System.out.println("Connected to database successfully!");

            Statement stmt = conn.createStatement();

            stmt.executeUpdate("CREATE TABLE IF NOT EXISTS students ("
                    + "student_id INT AUTO_INCREMENT PRIMARY KEY, "
                    + "name VARCHAR(100), "
                    + "age INT, "
                    + "grade VARCHAR(10))");
            System.out.println("Table 'students' created successfully.");

            stmt.executeUpdate("INSERT INTO students (name, age, grade) VALUES ('Ravi Kumar', 20, 'A')");
            stmt.executeUpdate("INSERT INTO students (name, age, grade) VALUES ('Anita Sharma', 22, 'B')");
            stmt.executeUpdate("INSERT INTO students (name, age, grade) VALUES ('Raj Patel', 21, 'A')");
            System.out.println("Records inserted successfully.");
            
            String selectSQL = "SELECT * FROM students";
            ResultSet rs = stmt.executeQuery(selectSQL);
            System.out.println("Retrieving student records...");
            while (rs.next()) {
                
                int id = rs.getInt("student_id");
                String name = rs.getString("name");
                int age = rs.getInt("age");
                String grade = rs.getString("grade");
                
                System.out.printf("ID: %d, Name: %s, Age: %d, Grade: %s%n", id, name, age, grade);
            }

            String dropTableSQL = "DROP TABLE IF EXISTS students";
            stmt.executeUpdate(dropTableSQL);
            System.out.println("Table 'students' dropped successfully.");

        } catch (SQLException e) {            
            e.printStackTrace();
        } 
    }
}