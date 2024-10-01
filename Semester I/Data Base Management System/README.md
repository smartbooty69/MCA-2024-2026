# DBMS Lab (SQL & PL/SQL) Practicals

**Department of Computer Science and Applications (MCA)**  
**Course Code**: CA 7P2  
**Course Title**: DBMS Lab (SQL & PL/SQL)  

## List of Practicals

### Part A - SQL

#### 1. Explore Built-In Functions in SQL
Exploring the following Built-In Functions in SQL:
- **Number Functions**: Group-value functions and List Functions
- **Date Functions**
- **Count Functions**
- **Character Functions**

#### 2. Student Enrollment-Book Adoption Database Management
Tables:
- `STUDENT (regno, name, major, bdate)`
- `COURSE (course_no, cname, dept)`
- `ENROLL (regno, course_no, sem, marks)`
- `BOOK_ADOPTION (course_no, sem, book_isbn)`
- `TEXT (book_isbn, book_title, publisher, author)`

Tasks:
1. Create the tables with appropriate primary and foreign keys.
2. Insert at least five records for each table.
3. Add a new textbook and adopt it for some department.
4. List textbooks (with course-no, book-isbn, book-title) for courses in 'Computer Science' using more than two books.
5. List departments that have all their adopted books published by a specific publisher.

#### 3. Book Dealer Database Management
Tables:
- `AUTHOR (author_id, name, city, country)`
- `PUBLISHER (publisher_id, name, city, country)`
- `CATALOG (book_id, title, author_id, publisher_id, category, year, price)`
- `CATEGORY (category_id, description)`
- `ORDER_DETAILS (order_no, book_id, quantity)`

Tasks:
1. Create the tables with appropriate primary and foreign keys.
2. Insert at least five records for each table.
3. Get details of authors with 2 or more books and books priced higher than the average, published after 2010.
4. Find the author of the book with the maximum sales.
5. Increase the price of books from a specific publisher by 10%.

#### 4. Bank Database Management
Tables:
- `BRANCH (ifsc, branch_name, branch_city, assets)`
- `ACCOUNT (accno, branch_name, balance)`
- `DEPOSITOR (accno, customer_name)`
- `CUSTOMER (accno, customer_name, customer_street, customer_city)`
- `LOAN (loan_no, branch_name, amount)`
- `BORROWER (loan_no, customer_name)`

Tasks:
1. Create the tables with appropriate primary and foreign keys.
2. Insert at least five records for each table.
3. Find customers with at least two accounts at the main branch.
4. Find customers with accounts at all branches in a specific city.
5. Delete all account tuples at branches located in a specific city.

#### 5. Order Processing Database Management
Tables:
- `CUSTOMER (custno, cname, city)`
- `ORDER (orderno, odate, ord_amt)`
- `ORDER_ITEM (orderno, itemno, qty)`
- `ITEM (itemno, unitprice)`
- `SHIPMENT (orderno, warehouseno, ship_date)`
- `WAREHOUSE (warehouseno, city)`

Tasks:
1. Create the tables with appropriate primary and foreign keys.
2. Insert at least five records for each table.
3. List order number and shipping date for orders shipped from a specific warehouse.
4. List customer details with name, number of orders, and average order amount.
5. List orders not shipped within 30 days of ordering.

#### 6. Insurance Database Management
Tables:
- `PERSON (driver_idno, name, address)`
- `CAR (regno, model, year)`
- `ACCIDENT (report_no, date, location)`
- `OWNS (driver_idno, regno)`
- `PARTICIPATED (driver_idno, regno, report_no, damage_amount)`

Tasks:
1. Create the tables with appropriate primary and foreign keys.
2. Insert at least five records for each table.
3. 
    - Update the damage cost for a car in report no. 12 to ₹25,000.
    - Add a new accident to the database.
4. Find the total number of people who owned cars involved in accidents in 2022.
5. Find the number of accidents involving cars of a specific model.

### Part B - PL/SQL

#### 7. Menu-Driven PL/SQL Program for Student Average, Result, and Grade
Tables:
- `Student (Rno, Name, Sub1, Sub2, Sub3, Sub4, Sub5, Average, Result, Grade)`
- `StudentPass (Rno, Name, Sub1, Sub2, Sub3, Sub4, Sub5, Average, Result, Grade)`
- `StudentFail (Rno, Name, Sub1, Sub2, Sub3, Sub4, Sub5, Average, Result, Grade)`

Tasks:
1. Compute average and grade of students, splitting them into StudentPass and StudentFail tables.
2. Display first, second, and third average student details.

#### 8. Menu-Driven PL/SQL Program for Factorial and Fibonacci Series (Using Recursive Functions)
Tasks:
1. Compute factorial of a given number.
2. Generate Fibonacci series for the given number of terms.

#### 9. Menu-Driven PL/SQL Program for Employee Details and Seniority
Tables:
- `Emp (eid, ename, dob, doj, salary)`

Tasks:
1. Get employee details by `eid`.
2. Get first, second, and third highest salary details.
3. Get first and second senior-most employee details.

#### 10. Menu-Driven PL/SQL Program for Circle and GCD Calculations (Using Procedures and Functions)
Tasks:
1. Find the area and circumference of a circle (using a procedure).
2. Find the GCD of two numbers (using a recursive function).

#### 11. Employee Database Management Using Triggers
Tables:
- `employee (eid, ename, salary)`
- `employee10000 (eid, ename, salary, msg)`

Tasks:
1. Create triggers to insert records into `employee10000` when salary exceeds 10,000 or when records are deleted from `employee`.

#### 12. Student Database Management Using Triggers
Tables:
- `Student (Rno, Name, Sub1, Sub2, Sub3, Sub4, Sub5, Average, Result, Grade)`
- `StudentPass (Rno, Name, Sub1, Sub2, Sub3, Sub4, Sub5, Average, Result, Grade)`
- `StudentFail (Rno, Name, Sub1, Sub2, Sub3, Sub4, Sub5, Average, Result, Grade)`

Tasks:
1. Create triggers to insert records into `StudentPass` or `StudentFail` based on student results and delete records when necessary.

#### 13. Sales Commission Computation Using Triggers
Tables:
- `salesmen (smno, name, act_sales_amt, tgt_sales_amt)`
- `salescommission (smno, name, dos, comm)`

Tasks:
1. Create triggers to calculate and insert sales commission into `salescommission` based on sales performance.
2. Delete commission records when the corresponding `salesmen` record is deleted.
