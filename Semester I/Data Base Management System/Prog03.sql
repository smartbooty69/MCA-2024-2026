-- Creating AUTHOR table
CREATE TABLE AUTHOR (
    author_id INT PRIMARY KEY,
    name VARCHAR2(100),
    city VARCHAR2(50),
    country VARCHAR2(50)
);

-- Creating PUBLISHER table
CREATE TABLE PUBLISHER (
    publisher_id INT PRIMARY KEY,
    name VARCHAR2(100),
    city VARCHAR2(50),
    country VARCHAR2(50)
);

-- Creating CATEGORY table
CREATE TABLE CATEGORY (
    category_id INT PRIMARY KEY,
    description VARCHAR2(255)
);

-- Creating CATALOG table
CREATE TABLE BOOK_CATALOG (
    book_id INT PRIMARY KEY,
    title VARCHAR2(255),
    author_id INT,
    publisher_id INT,
    category_id INT,
    year INT,
    price INT,
    FOREIGN KEY (author_id) REFERENCES AUTHOR(author_id),
    FOREIGN KEY (publisher_id) REFERENCES PUBLISHER(publisher_id),
    FOREIGN KEY (category_id) REFERENCES CATEGORY(category_id)
);


-- Creating ORDER_DETAILS table
CREATE TABLE ORDER_DETAILS (
    order_no INT PRIMARY KEY,
    book_id INT,
    quantity INT,
    FOREIGN KEY (book_id) REFERENCES BOOK_CATALOG(book_id)
);

-- Insert data into AUTHOR table
INSERT INTO AUTHOR VALUES (1, 'J.K. Rowling', 'London', 'UK');
INSERT INTO AUTHOR VALUES (2, 'George R.R. Martin', 'Santa Fe', 'USA');
INSERT INTO AUTHOR VALUES (3, 'J.R.R. Tolkien', 'Bournemouth', 'UK');
INSERT INTO AUTHOR VALUES (4, 'Agatha Christie', 'Wallingford', 'UK');
INSERT INTO AUTHOR VALUES (5, 'Stephen King', 'Portland', 'USA');

-- Insert data into PUBLISHER table
INSERT INTO PUBLISHER VALUES (1, 'Bloomsbury', 'London', 'UK');
INSERT INTO PUBLISHER VALUES (2, 'Bantam Books', 'New York', 'USA');
INSERT INTO PUBLISHER VALUES (3, 'HarperCollins', 'London', 'UK');
INSERT INTO PUBLISHER VALUES (4, 'Penguin', 'New York', 'USA');
INSERT INTO PUBLISHER VALUES (5, 'Scribner', 'New York', 'USA');

-- Insert data into CATEGORY table
INSERT INTO CATEGORY VALUES (1, 'Fantasy');
INSERT INTO CATEGORY VALUES (2, 'Mystery');
INSERT INTO CATEGORY VALUES (3, 'Horror');
INSERT INTO CATEGORY VALUES (4, 'Thriller');
INSERT INTO CATEGORY VALUES (5, 'Science Fiction');

-- Insert data into CATALOG table
INSERT INTO CATALOG VALUES (101, "Harry Potter and the Philosopher\'s Stone", 1, 1, 1, 1997, 500);
INSERT INTO CATALOG VALUES (102, 'A Game of Thrones', 2, 2, 5, 1996, 700);
INSERT INTO CATALOG VALUES (103, 'The Hobbit', 3, 3, 1, 1937, 400);
INSERT INTO CATALOG VALUES (104, 'Murder on the Orient Express', 4, 4, 2, 1934, 350);
INSERT INTO CATALOG VALUES (105, 'The Shining', 5, 5, 3, 1977, 600);

-- Insert data into ORDER_DETAILS table
INSERT INTO ORDER_DETAILS VALUES (1001, 101, 5);
INSERT INTO ORDER_DETAILS VALUES (1002, 102, 2);
INSERT INTO ORDER_DETAILS VALUES (1003, 103, 3);
INSERT INTO ORDER_DETAILS VALUES (1004, 104, 4);
INSERT INTO ORDER_DETAILS VALUES (1005, 105, 6);

SELECT a.name, a.city, a.country
FROM AUTHOR a
JOIN CATALOG c ON a.author_id = c.author_id
WHERE c.year > 2010
GROUP BY a.author_id, a.name, a.city, a.country
HAVING COUNT(c.book_id) >= 2 
   AND MIN(c.price) > (SELECT AVG(price) FROM CATALOG);

SELECT a.name, a.city, a.country
FROM AUTHOR a
JOIN CATALOG c ON a.author_id = c.author_id
JOIN ORDER_DETAILS o ON c.book_id = o.book_id
WHERE o.quantity = (
    SELECT MAX(quantity)
    FROM ORDER_DETAILS
);

-- Assume the publisher is 'Bloomsbury'
UPDATE CATALOG
SET price = price * 1.10
WHERE publisher_id = (
    SELECT publisher_id
    FROM PUBLISHER
    WHERE name = 'Bloomsbury'
);

