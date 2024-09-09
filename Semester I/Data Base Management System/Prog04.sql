-- Creating BRANCH table
CREATE TABLE BRANCH (
    ifsc VARCHAR2(11) PRIMARY KEY,
    branch_name VARCHAR2(100) UNIQUE,
    branch_city VARCHAR2(50),
    assets REAL
);

-- Creating ACCOUNT table
CREATE TABLE ACCOUNT (
    accno INT PRIMARY KEY,
    branch_name VARCHAR2(100),
    balance REAL,
    FOREIGN KEY (branch_name) REFERENCES BRANCH(branch_name)
);

-- Creating DEPOSITOR table
CREATE TABLE DEPOSITOR (
    accno INT,
    customer_name VARCHAR2(100),
    PRIMARY KEY (accno, customer_name),
    FOREIGN KEY (accno) REFERENCES ACCOUNT(accno)
);

-- Creating CUSTOMER table
CREATE TABLE CUSTOMER (
    accno INT PRIMARY KEY,
    customer_name VARCHAR2(100),
    customer_street VARCHAR2(100),
    customer_city VARCHAR2(50),
    FOREIGN KEY (accno) REFERENCES ACCOUNT(accno)
);

-- Creating LOAN table
CREATE TABLE LOAN (
    loan_no INT PRIMARY KEY,
    branch_name VARCHAR2(100),
    amount REAL,
    FOREIGN KEY (branch_name) REFERENCES BRANCH(branch_name)
);

-- Creating BORROWER table
CREATE TABLE BORROWER (
    loan_no INT,
    customer_name VARCHAR2(100),
    PRIMARY KEY (loan_no, customer_name),
    FOREIGN KEY (loan_no) REFERENCES LOAN(loan_no)
);

-- Insert data into BRANCH table
INSERT INTO BRANCH VALUES ('IFSC001', 'Main Branch', 'New York', 5000000);
INSERT INTO BRANCH VALUES ('IFSC002', 'City Branch', 'Chicago', 2000000);
INSERT INTO BRANCH VALUES ('IFSC003', 'Suburban Branch', 'San Francisco', 1500000);
INSERT INTO BRANCH VALUES ('IFSC004', 'Downtown Branch', 'Boston', 3000000);
INSERT INTO BRANCH VALUES ('IFSC005', 'Rural Branch', 'Austin', 1000000);

-- Insert data into ACCOUNT table
INSERT INTO ACCOUNT VALUES (101, 'Main Branch', 5000);
INSERT INTO ACCOUNT VALUES (102, 'City Branch', 1500);
INSERT INTO ACCOUNT VALUES (103, 'Main Branch', 3000);
INSERT INTO ACCOUNT VALUES (104, 'Suburban Branch', 2000);
INSERT INTO ACCOUNT VALUES (105, 'Main Branch', 2500);

-- Insert data into DEPOSITOR table
INSERT INTO DEPOSITOR VALUES (101, 'John Doe');
INSERT INTO DEPOSITOR VALUES (102, 'Jane Smith');
INSERT INTO DEPOSITOR VALUES (103, 'John Doe');
INSERT INTO DEPOSITOR VALUES (104, 'Alice Johnson');
INSERT INTO DEPOSITOR VALUES (105, 'Robert Brown');

-- Insert data into CUSTOMER table
INSERT INTO CUSTOMER VALUES (101, 'John Doe', '5th Avenue', 'New York');
INSERT INTO CUSTOMER VALUES (102, 'Jane Smith', 'Lake Shore Drive', 'Chicago');
INSERT INTO CUSTOMER VALUES (103, 'John Doe', '5th Avenue', 'New York');
INSERT INTO CUSTOMER VALUES (104, 'Alice Johnson', 'Market Street', 'San Francisco');
INSERT INTO CUSTOMER VALUES (105, 'Robert Brown', '6th Avenue', 'New York');

-- Insert data into LOAN table
INSERT INTO LOAN VALUES (201, 'Main Branch', 10000);
INSERT INTO LOAN VALUES (202, 'City Branch', 5000);
INSERT INTO LOAN VALUES (203, 'Main Branch', 8000);
INSERT INTO LOAN VALUES (204, 'Suburban Branch', 12000);
INSERT INTO LOAN VALUES (205, 'Downtown Branch', 6000);

-- Insert data into BORROWER table
INSERT INTO BORROWER VALUES (201, 'John Doe');
INSERT INTO BORROWER VALUES (202, 'Jane Smith');
INSERT INTO BORROWER VALUES (203, 'John Doe');
INSERT INTO BORROWER VALUES (204, 'Alice Johnson');
INSERT INTO BORROWER VALUES (205, 'Robert Brown');

SELECT d.customer_name
FROM DEPOSITOR d
JOIN ACCOUNT a ON d.accno = a.accno
WHERE a.branch_name = 'Main Branch'
GROUP BY d.customer_name
HAVING COUNT(a.accno) >= 2;

SELECT c.customer_name
FROM CUSTOMER c
JOIN ACCOUNT a ON c.accno = a.accno
JOIN BRANCH b ON a.branch_name = b.branch_name
WHERE b.branch_city = 'New York'
GROUP BY c.customer_name
HAVING COUNT(DISTINCT a.branch_name) = 
      (SELECT COUNT(branch_name) 
       FROM BRANCH 
       WHERE branch_city = 'New York');

DELETE FROM DEPOSITOR
WHERE accno IN (
    SELECT accno FROM ACCOUNT
    WHERE branch_name IN (
        SELECT branch_name
        FROM BRANCH
        WHERE branch_city = 'New York'
    )
);

DELETE FROM CUSTOMER
WHERE accno IN (
    SELECT accno FROM ACCOUNT
    WHERE branch_name IN (
        SELECT branch_name
        FROM BRANCH
        WHERE branch_city = 'New York'
    )
);

DELETE FROM ACCOUNT
WHERE branch_name IN (
    SELECT branch_name
    FROM BRANCH
    WHERE branch_city = 'New York'
);

