# DEPARTMENT OF COMPUTER SCIENCE AND APPLICATIONS (MCA)
## COURSE CODE: CA 7P2  
## COURSE TITLE: DBMS LAB (SQL & PL/SQL)

### LIST OF PRACTICALS - SQL & PL/SQL

## PART A - SQL

### 1. EXPLORE BUILT-IN FUNCTIONS IN SQL
Exploring the following Built-In Functions in SQL:
- **Number Functions** (Group-value functions and List Functions)
- **Date Functions**
- **Count Functions**
- **Character Functions**

---

### 2. STUDENT ENROLLMENT-BOOK ADOPTION DATABASE MANAGEMENT
Consider the following database of students enrolled in courses and books adopted for each course.

- **STUDENT**(regno: string, name: string (not null), major: string, bdate: date)
- **COURSE**(course_no: int, cname: string (not null), dept: string)
- **ENROLL**(regno: string, course_no: int, sem: int, marks: int)
- **BOOK-ADOPTION**(course_no: int, sem: int, book_isbn: int)
- **TEXT**(book_isbn: int, book_title: string, publisher: string, author: string)

Tasks:
1. Create the above tables by specifying primary keys and foreign keys.
2. Enter at least five tuples for each relation.
3. Demonstrate how to add a new textbook to the database and adopt it for a department.
4. Produce a list of textbooks (include course-no, book-isbn, book-title) in alphabetical order for the 'Computer Science' department that uses more than two books.
5. List any department that has all its adopted books published by a specific publisher.

---

### 3. BOOK DEALER DATABASE MANAGEMENT
The following tables are maintained by a book dealer:

- **AUTHOR**(author_id: int, name: string, city: string, country: string)
- **PUBLISHER**(publisher_id: int, name: string, city: string, country: string)
- **CATALOG**(book_id: int, title: string, author_id: int, publisher_id: int, category: int, year: int, price: int)
- **CATEGORY**(category_id: int, description: string)
- **ORDER-DETAILS**(order_no: int, book_id: int, quantity: int)

Tasks:
1. Create the above tables by specifying primary keys and foreign keys.
2. Enter at least five tuples for each relation.
3. List details of authors who have 2 or more books in the catalog, where the price of the books is greater than the average price of books published after 2010.
4. Find the author of the book with the maximum sales.
5. Increase the price of books published by a specific publisher by 10%.

---

### 4. BANK DATABASE MANAGEMENT
Consider the following database for a bank:

- **BRANCH**(ifsc: string, branch_name: string, branch_city: string, assets: real)
- **ACCOUNT**(accno: int, branch_name: string, balance: real)
- **DEPOSITOR**(accno: int, customer_name: string)
- **CUSTOMER**(accno: int, customer_name: string, customer_street: string, customer_city: string)
- **LOAN**(loan_no: int, branch_name: string, amount: real)
- **BORROWER**(loan_no: int, customer_name: string)

Tasks:
1. Create the above tables by specifying primary keys and foreign keys.
2. Enter at least five tuples for each relation.
3. Find all customers who have at least two accounts at the main branch.
4. Find all customers with accounts at all branches located in a specific city.
5. Demonstrate how to delete all account tuples at every branch located in a specific city.

---

### 5. ORDER PROCESSING DATABASE MANAGEMENT
Consider the following database for order processing:

- **CUSTOMER**(custno: int, cname: string, city: string)
- **ORDER**(orderno: int, odate: date, ord_amt: real)
- **ORDER_ITEM**(orderno: int, itemno: int, qty: int)
- **ITEM**(itemno: int, unitprice: real)
- **SHIPMENT**(orderno: int, warehouseno: int, ship_date: date)
- **WAREHOUSE**(warehouseno: int, city: string)

Tasks:
1. Create the above tables by specifying primary keys and foreign keys.
2. Enter at least five tuples for each relation.
3. List the order number and shipping date for all orders shipped from a particular warehouse.
4. Produce a list of customer details with their name, number of orders, and average order amount.
5. List orders that were not shipped within 30 days from the ordering date.

---

### 6. INSURANCE DATABASE MANAGEMENT
Consider the following insurance database:

- **PERSON**(driver_idno: string, name: string (not null), address: string)
- **CAR**(regno: string, model: string, year: int)
- **ACCIDENT**(report_no: int, date: date, location: string)
- **OWNS**(driver_idno: string, regno: string)
- **PARTICIPATED**(driver_idno: string, regno: string, report_no: int, damage_amount: int)

Tasks:
1. Create the above tables by specifying primary keys and foreign keys.
2. Enter at least five tuples for each relation.
3. 
    a. Update the cost of damage for the car in report no. 12 to Rs 25000 along with the register number.
    b. Add a new accident record to the database.
4. Find the total number of people who owned cars involved in accidents in 2022.
5. Find the number of accidents involving cars of a specific model.

---

## PART B - PL/SQL

### 7. MENU-DRIVEN PL/SQL PROGRAM FOR COMPUTING STUDENT'S AVERAGE, RESULT, AND GRADE
Create the following tables and insert at least five tuples in the Student table:

- **Student**(Rno: string, Name: string (not null), Sub1: number, Sub2: number, Sub3: number, Sub4: number, Sub5: number, Average: number, Result: string, Grade: string)
- **StudentPass**(Rno: string, Name: string (not null), Sub1: number, Sub2: number, Sub3: number, Sub4: number, Sub5: number, Average: number, Result: string, Grade: string)
- **StudentFail**(Rno: string, Name: string (not null), Sub1: number, Sub2: number, Sub3: number, Sub4: number, Sub5: number, Average: number, Result: string, Grade: string)

Tasks:
1. Write a menu-driven PL/SQL program to compute the average and grade of students, splitting the table into StudentPass and StudentFail tables.
2. Display first, second, and third average details of students.

---

### 8. MENU-DRIVEN PL/SQL PROGRAM TO COMPUTE FACTORIAL AND GENERATE FIBONACCI SERIES
Write a menu-driven PL/SQL program using recursive functions to:

1. Compute the factorial value of a given number.
2. Generate the Fibonacci series for a given number of terms.

---

### 9. MENU-DRIVEN PL/SQL PROGRAM USING PROCEDURES TO GET EMPLOYEE DETAILS BY EID
Create the following table and insert at least five tuples:

- **Emp**(eid: string, ename: string, dob: date, doj: date, salary: number (salary > 0))

Tasks:
1. Get employee details by EID.
2. Find the first, second, and third highest salary details.
3. Find the first and second senior-most employee details based on date of birth and date of joining.

---

### 10. MENU-DRIVEN PL/SQL PROGRAM USING PROCEDURES AND FUNCTIONS OF CUSTOM PACKAGE
Write a menu-driven PL/SQL program using procedures and functions to:

1. Find the area and circumference of a circle.
2. Compute the GCD (Greatest Common Divisor) of two numbers using recursive functions.

---

### 11. EMPLOYEE DATABASE MANAGEMENT USING TRIGGERS
Create the following tables:

- **employee**(eid: string, ename: string (not null), salary: number (salary > 0))
- **employee10000**(eid: string, ename: string (not null), salary: number (salary > 0), msg: string)

Tasks:
1. Create a trigger to insert records into `employee10000` when the employee's salary is greater than 10000.
2. Create another trigger to insert records when employee records are deleted.

---

### 12. STUDENT DATABASE MANAGEMENT USING TRIGGERS
Create the following tables:

- **Student**(Rno: string, Name: string (not null), Sub1: number, Sub2: number, Sub3: number, Sub4: number, Sub5: number, Average: number, Result: string, Grade: string)
- **StudentPass**(Rno: string, Name: string (not null), Sub1: number, Sub2: number, Sub3: number, Sub4: number, Sub5: number, Average: number, Result: string, Grade: string)
- **StudentFail**(Rno: string, Name: string (not null), Sub1: number, Sub2: number, Sub3: number, Sub4: number, Sub5: number, Average: number, Result: string, Grade: string)

Tasks:
1. Create a trigger to split student details based on results into `StudentPass` and `StudentFail` tables.
