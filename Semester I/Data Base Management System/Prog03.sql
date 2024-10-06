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
INSERT INTO AUTHOR (AUTHOR_ID, AUTHOR_NAME, AUTHOR_CITY, AUTHOR_COUNTRY) 
    VALUES (:author_id, :author_name, :author_city, :author_country);

-- Insert data into PUBLISHER table
INSERT INTO PUBLISHER (PUBLISHER_ID, PUBLISHER_NAME, PUBLISHER_CITY, PUBLISHER_COUNTRY)
    VALUES (:publisher_id, :publisher_name, :publisher_city, :publisher_country);

-- Insert data into CATEGORY table
INSERT INTO CATEGORY (CATEGORY_ID, CATEGORY_NAME) 
    VALUES (:category_id, :category_name);

-- Insert data into CATALOG table
INSERT INTO BOOK_CATALOG (BOOK_ID, BOOK_TITLE, AUTHOR_ID, PUBLISHER_ID, CATEGORY_ID, PUBLISH_YEAR, PRICE) 
    VALUES (:book_id, :book_title, :author_id, :publisher_id, :category_id, :publish_year, :price);

-- Insert data into ORDER_DETAILS table
 INSERT INTO ORDER_DETAILS (ORDER_ID, BOOK_ID, QUANTITY) 
    VALUES (:order_id, :book_id, :quantity);

SELECT a.name, a.city, a.country
FROM AUTHOR a
JOIN BOOK_CATALOG c ON a.author_id = c.author_id
WHERE c.year > 2010
GROUP BY a.author_id, a.name, a.city, a.country
HAVING COUNT(c.book_id) >= 2 
   AND MIN(c.price) > (SELECT AVG(price) FROM BOOK_CATALOG);

SELECT a.name, a.city, a.country
FROM AUTHOR a
JOIN BOOK_CATALOG c ON a.author_id = c.author_id
JOIN ORDER_DETAILS o ON c.book_id = o.book_id
WHERE o.quantity = (
    SELECT MAX(quantity)
    FROM ORDER_DETAILS
);

-- Assume the publisher is 'Bloomsbury'
UPDATE BOOK_CATALOG
SET price = price * 1.10
WHERE publisher_id = (
    SELECT publisher_id
    FROM PUBLISHER
    WHERE name = 'Bloomsbury' 
);

-- DROP TABLE ORDER_DETAILS CASCADE CONSTRAINTS;
-- DROP TABLE BOOK_CATALOG CASCADE CONSTRAINTS;
-- DROP TABLE AUTHOR CASCADE CONSTRAINTS;
-- DROP TABLE PUBLISHER CASCADE CONSTRAINTS;
-- DROP TABLE CATEGORY CASCADE CONSTRAINTS;
