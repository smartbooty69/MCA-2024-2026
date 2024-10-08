# Advanced Java Programming Lab

## Master of Computer Applications (MCA)

This repository contains a collection of Java programming exercises aimed at demonstrating the understanding and implementation of various concepts in Java, including the Collection Framework, Java Servlets, Java Server Pages (JSP), and Java Database Connectivity (JDBC). 

### Table of Contents
1. [Collection Framework](#collection-framework)
2. [Java Servlet and JSP](#java-servlet-and-jsp)
3. [JDBC - CreateStatement](#jdbc---createstatement)
4. [JDBC - PreparedStatement](#jdbc---preparedstatement)
5. [JDBC - CallableStatement](#jdbc---callablestatement)

---

## Collection Framework

1. **ArrayList Methods**  
   Write a Java program that demonstrates the creation and implementation of various `ArrayList` methods. Traverse through the list before and after each operation.  
   [View Code](Semester%20I/Advance%20JAVA/Collection%20Framework/Prog01/prog01.java)

2. **LinkedList Operations**  
   Write a Java program that demonstrates the use of a linked list by performing linked list specific operations.  
   [View Code](path/to/LinkedListOperations.java)

3. **Unique Student IDs Management**  
   Write a program in Java to manage a set of unique student IDs for a university. Ensure that no duplicate IDs are present and perform various operations on this set of student IDs using the `HashSet` class.  
   [View Code](path/to/UniqueStudentIdsManagement.java)

4. **Course Management**  
   Write a Java program to:
   - Use a function `retrieveCourseFromDatabase()` to take `courseName`, `courseID`, and `courseCategory` as inputs.
   - Use `get()` and `set()` to store and retrieve data.
   - Display using `printCourseDetails(String courseName, String courseID, String courseCategory)`.
   - Update the `courseName` to "Computing in Java".  
   [View Code](path/to/CourseManagement.java)

5. **Model View Controller (MVC)**  
   Write a program in Java to implement the Model View Controller architecture used in J2EE.  
   [View Code](path/to/MVCExample.java)

---

## Java Servlet and JSP

6. **Servlet Lifecycle**  
   Write a program in Java to demonstrate the various stages of a servlet lifecycle.  
   [View Code](path/to/ServletLifecycle.java)

7. **User Input with JSP**  
   Create a Java Server Page that displays a form to input the username and age. When submitted, the page will display the entered information and provide the current date and time using JSP elements.  
   [View Code](path/to/UserInputJSP.jsp)

8. **Form Handling in JSP**  
   Create a Java Server Page to display a form. When submitted, handle the request using both GET and POST methods. The form will accept the username, and based on the request method, the page will display a message.  
   [View Code](path/to/FormHandlingJSP.jsp)

9. **Session Handling with Cookies**  
   Write a program to handle sessions using cookies. It should print the username and email and implement various methods associated with it.  
   [View Code](path/to/CookieSessionHandling.java)

---

## JDBC - CreateStatement

1. **Student Records Management**  
   Create a Java program that connects to a MySQL database to manage a simple "student" records system using the `createStatement()` method:
   - **Create Database**: Create a database named `school_db`.
   - **Create Table**: Within `school_db`, create a table named `students` with the following structure:
     - `student_id` (INT, Primary Key, Auto Increment)
     - `name` (VARCHAR(100))
     - `age` (INT)
     - `grade` (VARCHAR(10))
   - **Insert Records**: Use the `createStatement()` method to insert at least three student records into the `students` table.
   - **Retrieve Records**: Use the same method to retrieve and display all records from the `students` table.
   - **Drop Table**: Write a statement to drop the `students` table to clean up.  
   [View Code](path/to/StudentRecordsManagement.java)

---

## JDBC - PreparedStatement

1. **Book Management System**  
   Create a Java program that connects to a MySQL database:
   - **Create Database**: Create a database named `library_db`.
   - **Create Table**: Create a table named `books` with the following structure:
     - `book_id` (INTEGER, Primary Key, Auto Increment)
     - `title` (TEXT)
     - `author` (TEXT)
     - `published_year` (INTEGER)
   - **Insert Records**: Implement a method that uses `PreparedStatement` to insert new book records. Prompt the user for the book's title, author, and published year.
   - **Retrieve Records**: Implement a method to retrieve and display all books in the `books` table.
   - **Update Records**: Implement a method to update the details of a book by its `book_id`. The user should be prompted for the `book_id` and the new details.
   - **Delete Records**: Implement a method to delete a book record based on its `book_id`.  
   [View Code](path/to/BookManagementSystem.java)

---

## JDBC – CallableStatement

1. **Employee Management System**  
   Create a Java program that connects to a MySQL database and performs operations on an `employees` table using `CallableStatement`:
   - **Create Database**: Create a database named `company_db`.
   - **Create Table**: Create a table named `employees` with the following structure:
     - `emp_id` (INTEGER, Primary Key, Auto Increment)
     - `name` (TEXT)
     - `position` (TEXT)
     - `salary` (DECIMAL)
   - **Insert Records**: Write stored procedures in SQL to insert records.
   - **Retrieve Records**: Write stored procedures in SQL to retrieve records.  
   [View Code](path/to/EmployeeManagementSystem.java)

2. **CRUD Operations on Employees**  
   Create a Java program that connects to a MySQL database and performs CRUD operations on the `employees` table using `CallableStatement`:
   - **Create Database**: Create a database named `company_db`.
   - **Update Records**: Write stored procedures in SQL to update records.
   - **Delete Records**: Write stored procedures in SQL to delete records.  
   [View Code](path/to/EmployeeCRUDOperations.java)

---

### Getting Started

1. **Prerequisites**: 
   - Java Development Kit (JDK)
   - MySQL Server
   - IDE (Eclipse, IntelliJ IDEA, etc.)

2. **Clone the Repository**:
   ```bash
   git clone https://github.com/yourusername/advanced-java-lab.git
   cd advanced-java-lab
