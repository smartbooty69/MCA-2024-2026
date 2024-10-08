Here's a structured format for your **DBMS Lab (SQL & PL/SQL)** course that matches the syntax you provided earlier. Each practical has a linked resource for easy access. 

---

# DEPARTMENT OF COMPUTER SCIENCE AND APPLICATIONS (MCA)

## COURSE CODE: CA 7P2  
## COURSE TITLE: DBMS LAB (SQL & PL/SQL)

### LIST OF PRACTICALS - SQL & PL/SQL

---

## PART A - SQL

### 1. Explore Built-In Functions in SQL
- **Objective:** Explore the following Built-In Functions in SQL:
  - **(i)** NUMBER FUNCTIONS (Group-value functions and List Functions)
  - **(ii)** DATE FUNCTIONS
  - **(iii)** COUNT FUNCTIONS
  - **(iv)** CHARACTER FUNCTIONS
- **View Code** [Prog01.sql](https://github.com/smartbooty69/MCA-2024-2026/blob/main/Semester%20I/Data%20Base%20Management%20System/Prog01.sql)

### 2. Student Enrollment-Book Adoption Database Management
- **Objective:** Manage a database of students' enrollment in courses and books adopted for each course.
- **Tables:**
  - **STUDENT** (regno: string, name: string (not null), major: string, bdate: date)
  - **COURSE** (course_no: int, cname: string (not null), dept: string)
  - **ENROLL** (regno: string, course_no: int, sem: int, marks: int)
  - **BOOK-ADOPTION** (course_no: int, sem: int, book_isbn: int)
  - **TEXT** (book_isbn: int, book_title: string, publisher: string, author: string)
- **Tasks:**
  - (i) Create tables with primary and foreign keys.
  - (ii) Insert at least five tuples for each relation.
  - (iii) Demonstrate adding a new textbook to the database.
  - (iv) List textbooks for courses in the 'Computer Science' department that use more than two books, sorted alphabetically.
  - (v) List departments with all adopted books published by a specific publisher.
- **View Code** [Prog02.sql](https://github.com/smartbooty69/MCA-2024-2026/blob/main/Semester%20I/Data%20Base%20Management%20System/Prog02.sql)

### 3. Book Dealer Database Management
- **Objective:** Manage a database maintained by a book dealer.
- **Tables:**
  - **AUTHOR** (author_id: int, name: string, city: string, country: string)
  - **PUBLISHER** (publisher_id: int, name: string, city: string, country: string)
  - **CATALOG** (book_id: int, title: string, author_id: int, publisher_id: int, category: int, year: int, price: int)
  - **CATEGORY** (category_id: int, description: string)
  - **ORDER-DETAILS** (order_no: int, book_id: int, quantity: int)
- **Tasks:**
  - (i) Create tables with primary and foreign keys.
  - (ii) Insert at least five tuples for each relation.
  - (iii) Get details of authors with 2 or more books in the catalog and whose book prices are above average and published after 2010.
  - (iv) Find the author of the book with maximum sales.
  - (v) Increase the price of books published by a specific publisher by 10%.
- **View Code** [Prog03.sql](https://github.com/smartbooty69/MCA-2024-2026/blob/main/Semester%20I/Data%20Base%20Management%20System/Prog03.sql)

### 4. Bank Database Management
- **Objective:** Manage a database for a bank.
- **Tables:**
  - **BRANCH** (ifsc: string, branch_name: string, branch_city: string, assets: real)
  - **ACCOUNT** (accno: int, branch_name: string, balance: real)
  - **DEPOSITOR** (accno: int, customer_name: string)
  - **CUSTOMER** (accno: int, customer_name: string, customer_street: string, customer_city: string)
  - **LOAN** (loan_no: int, branch_name: string, amount: real)
  - **BORROWER** (loan_no: int, customer_name: string)
- **Tasks:**
  - (i) Create tables with primary and foreign keys.
  - (ii) Insert at least five tuples for each relation.
  - (iii) Find customers with at least two accounts at the main branch.
  - (iv) Find customers with accounts at all branches located in a specific city.
  - (v) Delete all account tuples at branches in a specific city.
- **View Code** [Prog04.sql](https://github.com/smartbooty69/MCA-2024-2026/blob/main/Semester%20I/Data%20Base%20Management%20System/Prog04.sql)

### 5. Order Processing Database Management
- **Objective:** Manage a database for order processing.
- **Tables:**
  - **CUSTOMER** (custno: int, cname: string, city: string)
  - **ORDER** (orderno: int, odate: date, ord_amt: real)
  - **ORDER_ITEM** (orderno: int, itemno: int, qty: int)
  - **ITEM** (itemno: int, unitprice: real)
  - **SHIPMENT** (orderno: int, warehouseno: int, ship_date: date)
  - **WAREHOUSE** (warehouseno: int, city: string)
- **Tasks:**
  - (i) Create tables with primary and foreign keys.
  - (ii) Insert at least five tuples for each relation.
  - (iii) List order numbers and shipping dates for all orders shipped from a particular warehouse.
  - (iv) Produce a list of customer details with their name, number of orders, and average order amount.
  - (v) List orders not shipped within 30 days from the date of ordering.
- **View Code** [Prog05.sql](https://github.com/smartbooty69/MCA-2024-2026/blob/main/Semester%20I/Data%20Base%20Management%20System/Prog05.sql)

### 6. Insurance Database Management
- **Objective:** Manage an insurance database.
- **Tables:**
  - **PERSON** (driver_idno: string, name: string (not null), address: string)
  - **CAR** (regno: string, model: string, year: int)
  - **ACCIDENT** (report_no: int, date: date, location: string)
  - **OWNS** (driver_idno: string, regno: string)
  - **PARTICIPATED** (driver_idno: string, regno: string, report_no: int, damage_amount: int)
- **Tasks:**
  - (i) Create tables with primary and foreign keys.
  - (ii) Insert at least five tuples for each relation.
  - (iii) Update damage costs for cars involved in accident report no. 12.
  - (iv) Add a new accident to the database.
  - (v) Find total people owning cars involved in accidents in 2022.
  - (vi) Find the number of accidents involving a specific model.
- **View Code** [Prog06.sql](https://github.com/smartbooty69/MCA-2024-2026/blob/main/Semester%20I/Data%20Base%20Management%20System/Prog06.sql)

---

## PART B - PL/SQL

### 7. Menu Driven PL/SQL Program for Computing Student's Average, Result, and Grade
- **Objective:** Create a menu-driven PL/SQL program to:
  - (i) Compute averages and grades, separating students into `StudentPass` and `StudentFail`.
  - (ii) Display details of first, second, and third average students.
- **Tables:**
  - **Student** (Rno: string, Name: string (not null), Sub1: number, Sub2: number, Sub3: number, Sub4: number, Sub5: number, Average: number, Result: string, Grade: string)
  - **StudentPass** (Similar structure as Student)
  - **StudentFail** (Similar structure as Student)
- **View Code** [Prog07.sql](https://github.com/smartbooty69/MCA-2024-2026/blob/main/Semester%20I/Data%20Base%20Management%20System/Prog07.sql)

### 8. Menu Driven PL/SQL Program to Compute Factorial and Generate Fibonacci Series
- **Objective:** Create a menu-driven PL/SQL program using recursive functions to:
  - (i) Compute factorial of a given number.
  - (ii) Generate Fibonacci series for a specified number of terms.
- **View Code** [Prog08.sql](https://github.com/smartbooty69/MCA-2024-2026/blob/main/Semester%20I/Data%20Base%20Management%20System/Prog08.sql)

### 9. Menu Driven PL/SQL Program to Get Employee Details and Salary Information
- **Objective:** Create a menu-driven PL/SQL program to:
  - (i) Get employee details by EID.
  - (ii) Find details

 of employees with a salary above a specific amount.
- **View Code** [Prog09.sql](https://github.com/smartbooty69/MCA-2024-2026/blob/main/Semester%20I/Data%20Base%20Management%20System/Prog09.sql)

### 10. PL/SQL Program to Generate Prime Numbers within a Range
- **Objective:** Write a PL/SQL program to:
  - (i) Generate prime numbers between a specified range using a loop and conditional statements.
- **View Code** [Prog10.sql](https://github.com/smartbooty69/MCA-2024-2026/blob/main/Semester%20I/Data%20Base%20Management%20System/Prog10.sql)

### 11. PL/SQL Program to Create an Employee Database
- **Objective:** Write a PL/SQL program to create and manage an employee database with CRUD operations.
- **View Code** [Prog11.sql](https://github.com/smartbooty69/MCA-2024-2026/blob/main/Semester%20I/Data%20Base%20Management%20System/Prog11.sql)

### 12. PL/SQL Program for String Manipulation
- **Objective:** Write a PL/SQL program that demonstrates various string manipulation techniques.
- **View Code** [Prog12.sql](https://github.com/smartbooty69/MCA-2024-2026/blob/main/Semester%20I/Data%20Base%20Management%20System/Prog12.sql)

### 13. PL/SQL Program to Find the Maximum and Minimum Values in an Array
- **Objective:** Write a PL/SQL program that finds the maximum and minimum values in a numeric array.
- **View Code** [Prog13.sql](https://github.com/smartbooty69/MCA-2024-2026/blob/main/Semester%20I/Data%20Base%20Management%20System/Prog13.sql)

---

This format includes uniform linking and structured objectives for each practical task. Adjust any section as necessary for completeness or clarity!