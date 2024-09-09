-- Creating CUSTOMER table
CREATE TABLE CUSTOMER (
    custno INT PRIMARY KEY,
    cname VARCHAR2(100),
    city VARCHAR2(50)
);

-- Creating ORDER table
CREATE TABLE ORDER_TABLE (
    orderno INT PRIMARY KEY,
    custno INT,
    odate DATE,
    ord_amt REAL,
    FOREIGN KEY (custno) REFERENCES CUSTOMER(custno)
);

-- Creating ITEM table
CREATE TABLE ITEM (
    itemno INT PRIMARY KEY,
    unitprice REAL
);

-- Creating ORDER_ITEM table
CREATE TABLE ORDER_ITEM (
    orderno INT,
    itemno INT,
    qty INT,
    PRIMARY KEY (orderno, itemno),
    FOREIGN KEY (orderno) REFERENCES ORDER_TABLE(orderno),
    FOREIGN KEY (itemno) REFERENCES ITEM(itemno)
);

-- Creating WAREHOUSE table
CREATE TABLE WAREHOUSE (
    warehouseno INT PRIMARY KEY,
    city VARCHAR2(50)
);

-- Creating SHIPMENT table
CREATE TABLE SHIPMENT (
    orderno INT,
    warehouseno INT,
    ship_date DATE,
    PRIMARY KEY (orderno, warehouseno),
    FOREIGN KEY (orderno) REFERENCES ORDER_TABLE(orderno),
    FOREIGN KEY (warehouseno) REFERENCES WAREHOUSE(warehouseno)
);

-- Inserting data into CUSTOMER table
INSERT INTO CUSTOMER VALUES (1, 'Alice Johnson', 'New York');
INSERT INTO CUSTOMER VALUES (2, 'Bob Smith', 'Chicago');
INSERT INTO CUSTOMER VALUES (3, 'Charlie Brown', 'San Francisco');
INSERT INTO CUSTOMER VALUES (4, 'Diana Ross', 'Boston');
INSERT INTO CUSTOMER VALUES (5, 'Edward Norton', 'Austin');

-- Inserting data into ORDER_TABLE
INSERT INTO ORDER_TABLE VALUES (101, 1, TO_DATE('2024-01-01', 'YYYY-MM-DD'), 500);
INSERT INTO ORDER_TABLE VALUES (102, 2, TO_DATE('2024-01-10', 'YYYY-MM-DD'), 1500);
INSERT INTO ORDER_TABLE VALUES (103, 3, TO_DATE('2024-02-01', 'YYYY-MM-DD'), 2000);
INSERT INTO ORDER_TABLE VALUES (104, 4, TO_DATE('2024-03-15', 'YYYY-MM-DD'), 250);
INSERT INTO ORDER_TABLE VALUES (105, 5, TO_DATE('2024-04-01', 'YYYY-MM-DD'), 3000);

-- Inserting data into ITEM table
INSERT INTO ITEM VALUES (1, 100);
INSERT INTO ITEM VALUES (2, 200);
INSERT INTO ITEM VALUES (3, 150);
INSERT INTO ITEM VALUES (4, 250);
INSERT INTO ITEM VALUES (5, 300);

-- Inserting data into ORDER_ITEM table
INSERT INTO ORDER_ITEM VALUES (101, 1, 5);
INSERT INTO ORDER_ITEM VALUES (102, 2, 3);
INSERT INTO ORDER_ITEM VALUES (103, 3, 4);
INSERT INTO ORDER_ITEM VALUES (104, 4, 2);
INSERT INTO ORDER_ITEM VALUES (105, 5, 1);

-- Inserting data into WAREHOUSE table
INSERT INTO WAREHOUSE VALUES (1, 'New York');
INSERT INTO WAREHOUSE VALUES (2, 'Chicago');
INSERT INTO WAREHOUSE VALUES (3, 'San Francisco');
INSERT INTO WAREHOUSE VALUES (4, 'Boston');
INSERT INTO WAREHOUSE VALUES (5, 'Austin');

-- Inserting data into SHIPMENT table
INSERT INTO SHIPMENT VALUES (101, 1, TO_DATE('2024-01-05', 'YYYY-MM-DD'));
INSERT INTO SHIPMENT VALUES (102, 2, TO_DATE('2024-01-20', 'YYYY-MM-DD'));
INSERT INTO SHIPMENT VALUES (103, 3, TO_DATE('2024-02-10', 'YYYY-MM-DD'));
INSERT INTO SHIPMENT VALUES (104, 4, TO_DATE('2024-03-20', 'YYYY-MM-DD'));
INSERT INTO SHIPMENT VALUES (105, 5, TO_DATE('2024-04-10', 'YYYY-MM-DD'));

SELECT s.orderno, s.ship_date
FROM SHIPMENT s
JOIN WAREHOUSE w ON s.warehouseno = w.warehouseno
WHERE w.city = 'New York';  -- Replace 'New York' with the desired warehouse city

SELECT c.custno, c.cname, c.city, COUNT(o.orderno) AS no_of_orders, AVG(o.ord_amt) AS avg_order_amount
FROM CUSTOMER c
JOIN ORDER_TABLE o ON c.custno = o.custno
GROUP BY c.custno, c.cname, c.city;

SELECT o.orderno, o.odate, s.ship_date
FROM ORDER_TABLE o
JOIN SHIPMENT s ON o.orderno = s.orderno
WHERE s.ship_date > o.odate + 30;
