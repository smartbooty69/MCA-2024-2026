-- Creating PERSON table
CREATE TABLE PERSON (
    driver_idno VARCHAR2(20) PRIMARY KEY,
    name VARCHAR2(100) NOT NULL,
    address VARCHAR2(255)
);

-- Creating CAR table
CREATE TABLE CAR (
    regno VARCHAR2(20) PRIMARY KEY,
    model VARCHAR2(50),
    year INT
);

-- Creating ACCIDENT table
CREATE TABLE ACCIDENT (
    report_no INT PRIMARY KEY,
    accident_date DATE,  
    location VARCHAR2(100)
);

-- Creating OWNS table
CREATE TABLE OWNS (
    driver_idno VARCHAR2(20),
    regno VARCHAR2(20),
    PRIMARY KEY (driver_idno, regno),
    FOREIGN KEY (driver_idno) REFERENCES PERSON(driver_idno),
    FOREIGN KEY (regno) REFERENCES CAR(regno)
);

-- Creating PARTICIPATED table
CREATE TABLE PARTICIPATED (
    driver_idno VARCHAR2(20),
    regno VARCHAR2(20),
    report_no INT,
    damage_amount INT,
    PRIMARY KEY (driver_idno, regno, report_no),
    FOREIGN KEY (driver_idno) REFERENCES PERSON(driver_idno),
    FOREIGN KEY (regno) REFERENCES CAR(regno),
    FOREIGN KEY (report_no) REFERENCES ACCIDENT(report_no)
);

-- Inserting data into PERSON table
INSERT INTO PERSON VALUES ('D001', 'Alice Johnson', '123 Elm Street, New York');
INSERT INTO PERSON VALUES ('D002', 'Bob Smith', '456 Oak Street, Chicago');
INSERT INTO PERSON VALUES ('D003', 'Charlie Brown', '789 Pine Street, San Francisco');
INSERT INTO PERSON VALUES ('D004', 'Diana Ross', '101 Maple Street, Boston');
INSERT INTO PERSON VALUES ('D005', 'Edward Norton', '202 Cedar Street, Austin');

-- Inserting data into CAR table
INSERT INTO CAR VALUES ('C001', 'Toyota Corolla', 2020);
INSERT INTO CAR VALUES ('C002', 'Honda Civic', 2019);
INSERT INTO CAR VALUES ('C003', 'Ford Focus', 2021);
INSERT INTO CAR VALUES ('C004', 'Chevrolet Malibu', 2018);
INSERT INTO CAR VALUES ('C005', 'Tesla Model 3', 2022);

-- Inserting data into ACCIDENT table
INSERT INTO ACCIDENT VALUES (11, TO_DATE('2022-01-10', 'YYYY-MM-DD'), 'New York');
INSERT INTO ACCIDENT VALUES (12, TO_DATE('2022-02-15', 'YYYY-MM-DD'), 'Chicago');
INSERT INTO ACCIDENT VALUES (13, TO_DATE('2022-03-20', 'YYYY-MM-DD'), 'San Francisco');
INSERT INTO ACCIDENT VALUES (14, TO_DATE('2022-04-25', 'YYYY-MM-DD'), 'Boston');
INSERT INTO ACCIDENT VALUES (15, TO_DATE('2022-05-30', 'YYYY-MM-DD'), 'Austin');

-- Inserting data into OWNS table
INSERT INTO OWNS VALUES ('D001', 'C001');
INSERT INTO OWNS VALUES ('D002', 'C002');
INSERT INTO OWNS VALUES ('D003', 'C003');
INSERT INTO OWNS VALUES ('D004', 'C004');
INSERT INTO OWNS VALUES ('D005', 'C005');

-- Inserting data into PARTICIPATED table
INSERT INTO PARTICIPATED VALUES ('D001', 'C001', 11, 10000);
INSERT INTO PARTICIPATED VALUES ('D002', 'C002', 12, 15000);
INSERT INTO PARTICIPATED VALUES ('D003', 'C003', 13, 20000);
INSERT INTO PARTICIPATED VALUES ('D004', 'C004', 14, 5000);
INSERT INTO PARTICIPATED VALUES ('D005', 'C005', 15, 30000);

UPDATE PARTICIPATED
SET damage_amount = 25000
WHERE report_no = 12 AND regno = 'C002';

-- Adding new accident details
INSERT INTO ACCIDENT VALUES (16, TO_DATE('2024-09-01', 'YYYY-MM-DD'), 'Los Angeles');

-- Registering participation of a car in the accident
INSERT INTO PARTICIPATED VALUES ('D003', 'C003', 16, 40000);

SELECT COUNT(DISTINCT p.driver_idno) AS total_owners
FROM PARTICIPATED p
JOIN ACCIDENT a ON p.report_no = a.report_no
WHERE EXTRACT(YEAR FROM a.accident_date) = 2022;

SELECT c.model, COUNT(DISTINCT a.report_no) AS accident_count
FROM PARTICIPATED p
JOIN CAR c ON p.regno = c.regno
JOIN ACCIDENT a ON p.report_no = a.report_no
WHERE c.model = 'Toyota Corolla' 
GROUP BY c.model;
