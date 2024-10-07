CREATE TABLE AUTHOR (
    author_id INT PRIMARY KEY,
    name VARCHAR2(100),
    city VARCHAR2(50),
    country VARCHAR2(50)
);

CREATE TABLE PUBLISHER (
    publisher_id INT PRIMARY KEY,
    name VARCHAR2(100),
    city VARCHAR2(50),
    country VARCHAR2(50)
);

CREATE TABLE CATEGORY (
    category_id INT PRIMARY KEY,
    description VARCHAR2(255)
);

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

CREATE TABLE ORDER_DETAILS (
    order_no INT PRIMARY KEY,
    book_id INT,
    quantity INT,
    FOREIGN KEY (book_id) REFERENCES BOOK_CATALOG(book_id)
);

INSERT INTO AUTHOR (AUTHOR_ID, AUTHOR_NAME, AUTHOR_CITY, AUTHOR_COUNTRY) 
    VALUES (:author_id, :author_name, :author_city, :author_country);

INSERT INTO PUBLISHER (PUBLISHER_ID, PUBLISHER_NAME, PUBLISHER_CITY, PUBLISHER_COUNTRY)
    VALUES (:publisher_id, :publisher_name, :publisher_city, :publisher_country);

INSERT INTO CATEGORY (CATEGORY_ID, CATEGORY_NAME) 
    VALUES (:category_id, :category_name);

INSERT INTO BOOK_CATALOG (BOOK_ID, BOOK_TITLE, AUTHOR_ID, PUBLISHER_ID, CATEGORY_ID, PUBLISH_YEAR, PRICE) 
    VALUES (:book_id, :book_title, :author_id, :publisher_id, :category_id, :publish_year, :price);

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

-- INSERT INTO AUTHOR (author_id, name, city, country)
-- VALUES (1, 'Arundhati Roy', 'Shillong', 'India');
-- INSERT INTO AUTHOR (author_id, name, city, country)
-- VALUES (2, 'Chinua Achebe', 'Ogidi', 'Nigeria');
-- INSERT INTO AUTHOR (author_id, name, city, country)
-- VALUES (3, 'Gabriel Garcia Marquez', 'Aracataca', 'Colombia');
-- INSERT INTO AUTHOR (author_id, name, city, country)
-- VALUES (4, 'J.K. Rowling', 'Yate', 'United Kingdom');
-- INSERT INTO AUTHOR (author_id, name, city, country)
-- VALUES (5, 'Haruki Murakami', 'Kyoto', 'Japan');

-- INSERT INTO PUBLISHER (publisher_id, name, city, country)
-- VALUES (1, 'Penguin Random House', 'New York', 'USA');
-- INSERT INTO PUBLISHER (publisher_id, name, city, country)
-- VALUES (2, 'HarperCollins', 'London', 'United Kingdom');
-- INSERT INTO PUBLISHER (publisher_id, name, city, country)
-- VALUES (3, 'Bloomsbury', 'London', 'United Kingdom');
-- INSERT INTO PUBLISHER (publisher_id, name, city, country)
-- VALUES (4, 'Vintage Books', 'New York', 'USA');
-- INSERT INTO PUBLISHER (publisher_id, name, city, country)
-- VALUES (5, 'Kodansha', 'Tokyo', 'Japan');

-- INSERT INTO CATEGORY (category_id, description)
-- VALUES (1, 'Fiction');
-- INSERT INTO CATEGORY (category_id, description)
-- VALUES (2, 'Non-fiction');
-- INSERT INTO CATEGORY (category_id, description)
-- VALUES (3, 'Science Fiction');
-- INSERT INTO CATEGORY (category_id, description)
-- VALUES (4, 'Historical');
-- INSERT INTO CATEGORY (category_id, description)
-- VALUES (5, 'Fantasy');

-- INSERT INTO BOOK_CATALOG (book_id, title, author_id, publisher_id, category_id, year, price)
-- VALUES (1, 'The God of Small Things', 1, 1, 1, 1997, 350);
-- INSERT INTO BOOK_CATALOG (book_id, title, author_id, publisher_id, category_id, year, price)
-- VALUES (2, 'Things Fall Apart', 2, 2, 4, 1958, 300);
-- INSERT INTO BOOK_CATALOG (book_id, title, author_id, publisher_id, category_id, year, price)
-- VALUES (3, 'One Hundred Years of Solitude', 3, 4, 1, 1967, 400);
-- INSERT INTO BOOK_CATALOG (book_id, title, author_id, publisher_id, category_id, year, price)
-- VALUES (4, 'Harry Potter and the Sorcerer''s Stone', 4, 3, 5, 1997, 450);
-- INSERT INTO BOOK_CATALOG (book_id, title, author_id, publisher_id, category_id, year, price)
-- VALUES (5, 'Norwegian Wood', 5, 5, 1, 1987, 375);

-- INSERT INTO ORDER_DETAILS (order_no, book_id, quantity)
-- VALUES (1, 1, 10);
-- INSERT INTO ORDER_DETAILS (order_no, book_id, quantity)
-- VALUES (2, 2, 5);
-- INSERT INTO ORDER_DETAILS (order_no, book_id, quantity)
-- VALUES (3, 3, 15);
-- INSERT INTO ORDER_DETAILS (order_no, book_id, quantity)
-- VALUES (4, 4, 20);
-- INSERT INTO ORDER_DETAILS (order_no, book_id, quantity)
-- VALUES (5, 5, 7);
