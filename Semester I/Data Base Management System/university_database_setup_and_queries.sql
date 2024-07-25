-- Step 1: Create the Tables
CREATE TABLE STUDENT (
    REGNO VARCHAR(50) PRIMARY KEY,
    NAME VARCHAR(100) NOT NULL,
    MAJOR VARCHAR(50),
    BDATE DATE
);

CREATE TABLE COURSE (
    COURSE_NO INT PRIMARY KEY,
    CNAME VARCHAR(100) NOT NULL,
    DEPT VARCHAR(50)
);

CREATE TABLE ENROLL (
    REG_NO VARCHAR(50),
    COURSE_NO INT,
    SEM INT,
    MARKS INT,
    PRIMARY KEY (REG_NO, COURSE_NO),
    FOREIGN KEY (REG_NO) REFERENCES STUDENT(REGNO),
    FOREIGN KEY (COURSE_NO) REFERENCES COURSE(COURSE_NO)
);

CREATE TABLE BOOK_ADOPTION (
    COURSE_NO INT,
    SEM INT,
    BOOK_ISBN INT,
    PRIMARY KEY (COURSE_NO, BOOK_ISBN),
    FOREIGN KEY (COURSE_NO) REFERENCES COURSE(COURSE_NO)
);

CREATE TABLE TEXT (
    BOOK_ISBN INT PRIMARY KEY,
    BOOK_TITLE VARCHAR(200),
    PUBLISHER VARCHAR(100),
    AUTHOR VARCHAR(100)
);

-- Step 2: Insert At Least Five Tuples for Each Relation
INSERT INTO STUDENT (
    REGNO,
    NAME,
    MAJOR,
    BDATE
) VALUES (
    'S001',
    'Alice Johnson',
    'Computer Science',
    '2000-05-15'
),
(
    'S002',
    'Bob Smith',
    'Mechanical Engineering',
    '1999-08-22'
),
(
    'S003',
    'Carol White',
    'Mathematics',
    '2001-03-30'
),
(
    'S004',
    'David Brown',
    'Physics',
    '2000-11-10'
),
(
    'S005',
    'Eve Davis',
    'Chemistry',
    '1998-12-25'
);

INSERT INTO COURSE (
    COURSE_NO,
    CNAME,
    DEPT
) VALUES (
    101,
    'Data Structures',
    'Computer Science'
),
(
    102,
    'Thermodynamics',
    'Mechanical Engineering'
),
(
    103,
    'Linear Algebra',
    'Mathematics'
),
(
    104,
    'Quantum Mechanics',
    'Physics'
),
(
    105,
    'Organic Chemistry',
    'Chemistry'
),
(
    106,
    'Algorithms',
    'Computer Science'
);

INSERT INTO ENROLL (
    REG_NO,
    COURSE_NO,
    SEM,
    MARKS
) VALUES (
    'S001',
    101,
    1,
    85
),
(
    'S002',
    102,
    1,
    78
),
(
    'S003',
    103,
    1,
    92
),
(
    'S004',
    104,
    1,
    88
),
(
    'S005',
    105,
    1,
    80
);

INSERT INTO TEXT (
    BOOK_ISBN,
    BOOK_TITLE,
    PUBLISHER,
    AUTHOR
) VALUES (
    11111,
    'Introduction to Data Structures',
    'Tech Books',
    'John Doe'
),
(
    22222,
    'Basic Thermodynamics',
    'Science Press',
    'Jane Smith'
),
(
    33333,
    'Linear Algebra and Its Applications',
    'Math Publishers',
    'Albert Johnson'
),
(
    44444,
    'Quantum Physics: A Beginner\s Guide',
    'Physics World',
    'Emily Clark'
),
(
    55555,
    'Organic Chemistry Simplified',
    'Chemistry House',
    'Michael Lee'
),
(
    66666,
    'Advanced Algorithms',
    'CompSci Publications',
    'Sophia Miller'
),
(
    77777,
    'Graph Theory',
    'Tech Books',
    'James Brown'
),
(
    88888,
    'Machine Learning',
    'AI Publishers',
    'Anna Green'
);

INSERT INTO BOOK_ADOPTION (
    COURSE_NO,
    SEM,
    BOOK_ISBN
) VALUES (
    101,
    1,
    11111
),
(
    102,
    1,
    22222
),
(
    103,
    1,
    33333
),
(
    104,
    1,
    44444
),
(
    105,
    1,
    55555
),
(
    106,
    1,
    66666
),
(
    101,
    1,
    77777
),
(
    101,
    1,
    88888
);

-- Step 3: Add a New Textbook and Adopt it
INSERT INTO TEXT (
    BOOK_ISBN,
    BOOK_TITLE,
    PUBLISHER,
    AUTHOR
) VALUES (
    99999,
    'Data Science',
    'Data Publishers',
    'Lily White'
);

INSERT INTO BOOK_ADOPTION (
    COURSE_NO,
    SEM,
    BOOK_ISBN
) VALUES (
    101,
    2,
    99999
);

-- Step 4: Produce a List of Textbooks
SELECT
    COURSE.COURSE_NO,
    TEXT.BOOK_ISBN,
    TEXT.BOOK_TITLE
FROM
    BOOK_ADOPTION
    JOIN COURSE
    ON BOOK_ADOPTION.COURSE_NO = COURSE.COURSE_NO
    JOIN TEXT
    ON BOOK_ADOPTION.BOOK_ISBN = TEXT.BOOK_ISBN;

-- Step 4 (iv): List of Textbooks in Alphabetical Order for 'Computer Science' Courses with More Than Two Books
SELECT
    COURSE.COURSE_NO,
    TEXT.BOOK_ISBN,
    TEXT.BOOK_TITLE
FROM
    BOOK_ADOPTION
    JOIN COURSE
    ON BOOK_ADOPTION.COURSE_NO = COURSE.COURSE_NO
    JOIN TEXT
    ON BOOK_ADOPTION.BOOK_ISBN = TEXT.BOOK_ISBN
WHERE
    COURSE.DEPT = 'Computer Science'
GROUP BY
    COURSE.COURSE_NO,
    TEXT.BOOK_ISBN,
    TEXT.BOOK_TITLE
HAVING
    COUNT(BOOK_ADOPTION.BOOK_ISBN) > 2
ORDER BY
    TEXT.BOOK_TITLE;

-- Step 4 (v): List Any Department with All Adopted Books Published by a Specific Publisher
SELECT
    COURSE.DEPT
FROM
    BOOK_ADOPTION
    JOIN COURSE
    ON BOOK_ADOPTION.COURSE_NO = COURSE.COURSE_NO
    JOIN TEXT
    ON BOOK_ADOPTION.BOOK_ISBN = TEXT.BOOK_ISBN
GROUP BY
    COURSE.DEPT
HAVING
    COUNT(DISTINCT TEXT.PUBLISHER) = 1;