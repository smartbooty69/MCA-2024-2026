-- Step 1: Create the Tables
CREATE TABLE STUDENT (
    regno VARCHAR2(50) PRIMARY KEY,
    name VARCHAR2(100) NOT NULL,
    major VARCHAR2(50),
    bdate DATE
);

CREATE TABLE COURSE (
    course_no NUMBER PRIMARY KEY,
    cname VARCHAR2(100) NOT NULL,
    dept VARCHAR2(50)
);

CREATE TABLE ENROLL (
    reg_no VARCHAR2(50),
    course_no NUMBER,
    sem NUMBER,
    marks NUMBER,
    PRIMARY KEY (reg_no, course_no),
    FOREIGN KEY (reg_no) REFERENCES STUDENT(regno),
    FOREIGN KEY (course_no) REFERENCES COURSE(course_no)
);

CREATE TABLE BOOK_ADOPTION (
    course_no NUMBER,
    sem NUMBER,
    book_isbn NUMBER,
    PRIMARY KEY (course_no, book_isbn),
    FOREIGN KEY (course_no) REFERENCES COURSE(course_no)
);

CREATE TABLE TEXT (
    book_isbn NUMBER PRIMARY KEY,
    book_title VARCHAR2(200),
    publisher VARCHAR2(100),
    author VARCHAR2(100)
);

-- Step 2: Insert At Least Five Tuples for Each Relation
INSERT INTO STUDENT (regno, name, major, bdate) VALUES
('S001', 'Alice Johnson', 'Computer Science', TO_DATE('2000-05-15', 'YYYY-MM-DD')),
('S002', 'Bob Smith', 'Mechanical Engineering', TO_DATE('1999-08-22', 'YYYY-MM-DD')),
('S003', 'Carol White', 'Mathematics', TO_DATE('2001-03-30', 'YYYY-MM-DD')),
('S004', 'David Brown', 'Physics', TO_DATE('2000-11-10', 'YYYY-MM-DD')),
('S005', 'Eve Davis', 'Chemistry', TO_DATE('1998-12-25', 'YYYY-MM-DD'));

INSERT INTO COURSE (course_no, cname, dept) VALUES
(101, 'Data Structures', 'Computer Science'),
(102, 'Thermodynamics', 'Mechanical Engineering'),
(103, 'Linear Algebra', 'Mathematics'),
(104, 'Quantum Mechanics', 'Physics'),
(105, 'Organic Chemistry', 'Chemistry'),
(106, 'Algorithms', 'Computer Science');

INSERT INTO ENROLL (reg_no, course_no, sem, marks) VALUES
('S001', 101, 1, 85),
('S002', 102, 1, 78),
('S003', 103, 1, 92),
('S004', 104, 1, 88),
('S005', 105, 1, 80);

INSERT INTO TEXT (book_isbn, book_title, publisher, author) VALUES
(11111, 'Introduction to Data Structures', 'Tech Books', 'John Doe'),
(22222, 'Basic Thermodynamics', 'Science Press', 'Jane Smith'),
(33333, 'Linear Algebra and Its Applications', 'Math Publishers', 'Albert Johnson'),
(44444, 'Quantum Physics: A Beginner\'s Guide', 'Physics World', 'Emily Clark'),
(55555, 'Organic Chemistry Simplified', 'Chemistry House', 'Michael Lee'),
(66666, 'Advanced Algorithms', 'CompSci Publications', 'Sophia Miller'),
(77777, 'Graph Theory', 'Tech Books', 'James Brown'),
(88888, 'Machine Learning', 'AI Publishers', 'Anna Green');

INSERT INTO BOOK_ADOPTION (course_no, sem, book_isbn) VALUES
(101, 1, 11111),
(102, 1, 22222),
(103, 1, 33333),
(104, 1, 44444),
(105, 1, 55555),
(106, 1, 66666),
(101, 1, 77777),
(101, 1, 88888);

-- Step 3: Add a New Textbook and Adopt it
INSERT INTO TEXT (book_isbn, book_title, publisher, author) VALUES
(99999, 'Data Science', 'Data Publishers', 'Lily White');

INSERT INTO BOOK_ADOPTION (course_no, sem, book_isbn) VALUES
(101, 2, 99999);

-- Step 4: Produce a List of Textbooks
SELECT
    COURSE.course_no,
    TEXT.book_isbn,
    TEXT.book_title
FROM
    BOOK_ADOPTION
JOIN
    COURSE ON BOOK_ADOPTION.course_no = COURSE.course_no
JOIN
    TEXT ON BOOK_ADOPTION.book_isbn = TEXT.book_isbn;

-- Step 4 (iv): List of Textbooks in Alphabetical Order for 'Computer Science' Courses with More Than Two Books
SELECT
    COURSE.course_no,
    TEXT.book_isbn,
    TEXT.book_title
FROM
    BOOK_ADOPTION
JOIN
    COURSE ON BOOK_ADOPTION.course_no = COURSE.course_no
JOIN
    TEXT ON BOOK_ADOPTION.book_isbn = TEXT.book_isbn
WHERE
    COURSE.dept = 'Computer Science'
GROUP BY
    COURSE.course_no, TEXT.book_isbn, TEXT.book_title
HAVING
    COUNT(BOOK_ADOPTION.book_isbn) > 2
ORDER BY
    TEXT.book_title;

-- Step 4 (v): List Any Department with All Adopted Books Published by a Specific Publisher
SELECT
    COURSE.dept
FROM
    BOOK_ADOPTION
JOIN
    COURSE ON BOOK_ADOPTION.course_no = COURSE.course_no
JOIN
    TEXT ON BOOK_ADOPTION.book_isbn = TEXT.book_isbn
GROUP BY
    COURSE.dept
HAVING
    COUNT(DISTINCT TEXT.publisher) = 1;
