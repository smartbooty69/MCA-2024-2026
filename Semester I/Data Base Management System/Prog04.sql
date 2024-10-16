-- CREATE TABLE BRANCH (
--     ifsc VARCHAR(11) PRIMARY KEY,
--     branch_name VARCHAR(100),
--     branch_city VARCHAR(50),
--     assets REAL
-- );

-- CREATE TABLE ACCOUNT (
--     accno INT PRIMARY KEY,
--     ifsc VARCHAR(11),  
--     balance REAL,
--     FOREIGN KEY (ifsc) REFERENCES BRANCH(ifsc)
-- );

-- CREATE TABLE DEPOSITOR (
--     accno INT,
--     customer_name VARCHAR(100),
--     PRIMARY KEY (accno, customer_name),
--     FOREIGN KEY (accno) REFERENCES ACCOUNT(accno) ON DELETE CASCADE
-- );

-- CREATE TABLE CUSTOMER (
--     accno INT PRIMARY KEY,
--     customer_name VARCHAR(100),
--     customer_street VARCHAR(100),
--     customer_city VARCHAR(50),
--     FOREIGN KEY (accno) REFERENCES ACCOUNT(accno) ON DELETE CASCADE
-- );


-- CREATE TABLE LOAN (
--     loan_no INT PRIMARY KEY,
--     ifsc VARCHAR(11),  
--     amount REAL,
--     FOREIGN KEY (ifsc) REFERENCES BRANCH(ifsc) 
-- );

-- CREATE TABLE BORROWER (
--     loan_no INT,
--     customer_name VARCHAR(100),
--     PRIMARY KEY (loan_no, customer_name),
--     FOREIGN KEY (loan_no) REFERENCES LOAN(loan_no) 
-- );

INSERT INTO BRANCH (ifsc, branch_name, branch_city, assets)
VALUES (:ifsc, :branch_name, :branch_city, :assets);

INSERT INTO ACCOUNT (accno, branch_name, balance)
VALUES (:accno, :branch_name, :balance);

INSERT INTO CUSTOMER (accno, customer_name, customer_street, customer_city)
VALUES (:accno, :customer_name, :customer_street, :customer_city);

INSERT INTO DEPOSITOR (accno, customer_name)
VALUES (:accno, :customer_name);

INSERT INTO LOAN (loan_no, branch_name, amount)
VALUES (:loan_no, :branch_name, :amount);

INSERT INTO BORROWER (loan_no, customer_name)
VALUES (:loan_no, :customer_name);

SELECT c.customer_name
FROM CUSTOMER c
JOIN DEPOSITOR d ON c.accno = d.accno
JOIN ACCOUNT a ON d.accno = a.accno
JOIN BRANCH b ON a.ifsc = b.ifsc
WHERE b.branch_name = 'Main Branch'
GROUP BY c.customer_name
HAVING COUNT(a.accno) >= 2;

SELECT c.customer_name
FROM CUSTOMER c
JOIN DEPOSITOR d ON c.accno = d.accno
JOIN ACCOUNT a ON d.accno = a.accno
JOIN BRANCH b ON a.ifsc = b.ifsc
WHERE b.branch_city = 'Chicago'  
GROUP BY c.customer_name
HAVING COUNT(DISTINCT b.ifsc) = 
    (SELECT COUNT(DISTINCT ifsc)
     FROM BRANCH
     WHERE branch_city = 'Chicago');

DELETE FROM ACCOUNT
WHERE ifsc IN (
    SELECT ifsc
    FROM BRANCH
    WHERE branch_city = 'Chicago'  
);

-- DROP TABLE BRANCH CASCADE CONSTRAINTS;
-- DROP TABLE ACCOUNT CASCADE CONSTRAINTS;
-- DROP TABLE DEPOSITOR CASCADE CONSTRAINTS;
-- DROP TABLE CUSTOMER CASCADE CONSTRAINTS;
-- DROP TABLE LOAN CASCADE CONSTRAINTS;
-- DROP TABLE BORROWER CASCADE CONSTRAINTS;

-- INSERT INTO BRANCH (ifsc, branch_name, branch_city, assets)
-- VALUES ('IFC0001', 'Main Branch', 'New York', 500000);

-- INSERT INTO BRANCH (ifsc, branch_name, branch_city, assets)
-- VALUES ('IFC0002', 'City Branch', 'Chicago', 200000);

-- INSERT INTO BRANCH (ifsc, branch_name, branch_city, assets)
-- VALUES ('IFC0003', 'Suburban Branch', 'Santa Clara', 100000);

-- INSERT INTO BRANCH (ifsc, branch_name, branch_city, assets)
-- VALUES ('IFC0004', 'Downtown Branch', 'San Francisco', 300000);

-- INSERT INTO BRANCH (ifsc, branch_name, branch_city, assets)
-- VALUES ('IFC0005', 'Rural Branch', 'Austin', 100000);

-- INSERT INTO ACCOUNT (accno, ifsc, balance)
-- VALUES (101, 'IFC0001', 5000.00);  -- Main Branch

-- INSERT INTO ACCOUNT (accno, ifsc, balance)
-- VALUES (102, 'IFC0002', 1500.00);  -- City Branch

-- INSERT INTO ACCOUNT (accno, ifsc, balance)
-- VALUES (103, 'IFC0001', 3000.00);  -- Main Branch

-- INSERT INTO ACCOUNT (accno, ifsc, balance)
-- VALUES (104, 'IFC0003', 2000.00);  -- Suburban Branch

-- INSERT INTO ACCOUNT (accno, ifsc, balance)
-- VALUES (105, 'IFC0001', 2500.00);  -- Main Branch

-- INSERT INTO DEPOSITOR (accno, customer_name)
-- VALUES (101, 'John Doe');

-- INSERT INTO DEPOSITOR (accno, customer_name)
-- VALUES (102, 'Jane Smith');

-- INSERT INTO DEPOSITOR (accno, customer_name)
-- VALUES (103, 'John Doe');

-- INSERT INTO DEPOSITOR (accno, customer_name)
-- VALUES (104, 'Alice Johnson');

-- INSERT INTO DEPOSITOR (accno, customer_name)
-- VALUES (105, 'Robert Brown');

-- INSERT INTO CUSTOMER (accno, customer_name, customer_street, customer_city)
-- VALUES (101, 'John Doe', '123 Main St', 'New York');

-- INSERT INTO CUSTOMER (accno, customer_name, customer_street, customer_city)
-- VALUES (102, 'Jane Smith', '456 Lake Ave', 'Chicago');

-- INSERT INTO CUSTOMER (accno, customer_name, customer_street, customer_city)
-- VALUES (103, 'John Doe', '789 State St', 'New York');

-- INSERT INTO CUSTOMER (accno, customer_name, customer_street, customer_city)
-- VALUES (104, 'Alice Johnson', '1011 Main St', 'Santa Clara');

-- INSERT INTO CUSTOMER (accno, customer_name, customer_street, customer_city)
-- VALUES (105, 'Robert Brown', '1212 Ave', 'New York');

-- INSERT INTO LOAN (loan_no, ifsc, amount)
-- VALUES (201, 'IFC0001', 1000.00);  

-- INSERT INTO LOAN (loan_no, ifsc, amount)
-- VALUES (202, 'IFC0002', 5000.00);  

-- INSERT INTO LOAN (loan_no, ifsc, amount)
-- VALUES (203, 'IFC0001', 2000.00);  

-- INSERT INTO LOAN (loan_no, ifsc, amount)
-- VALUES (204, 'IFC0003', 12000.00); 

-- INSERT INTO LOAN (loan_no, ifsc, amount)
-- VALUES (205, 'IFC0004', 6000.00);  

-- INSERT INTO BORROWER (loan_no, customer_name)
-- VALUES (201, 'John Doe');

-- INSERT INTO BORROWER (loan_no, customer_name)
-- VALUES (202, 'Jane Smith');

-- INSERT INTO BORROWER (loan_no, customer_name)
-- VALUES (203, 'John Doe');

-- INSERT INTO BORROWER (loan_no, customer_name)
-- VALUES (204, 'Alice Johnson');

-- INSERT INTO BORROWER (loan_no, customer_name)
-- VALUES (205, 'Robert Brown');
