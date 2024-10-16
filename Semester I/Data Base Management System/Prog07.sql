SET SERVEROUTPUT ON;

CREATE TABLE Student2 (
    Rno VARCHAR2(10),
    Name VARCHAR2(50) NOT NULL,
    Sub1 NUMBER(3),
    Sub2 NUMBER(3),
    Sub3 NUMBER(3),
    Sub4 NUMBER(3),
    Sub5 NUMBER(3),
    Average NUMBER(5,2),
    Result VARCHAR2(10),
    Grade VARCHAR2(2),
    CONSTRAINT PK_Student PRIMARY KEY (Rno)
);

CREATE TABLE StudentPass (
    Rno VARCHAR2(10),
    Name VARCHAR2(50) NOT NULL,
    Sub1 NUMBER(3),
    Sub2 NUMBER(3),
    Sub3 NUMBER(3),
    Sub4 NUMBER(3),
    Sub5 NUMBER(3),
    Average NUMBER(5,2),
    Result VARCHAR2(10),
    Grade VARCHAR2(2),
    CONSTRAINT PK_StudentPass PRIMARY KEY (Rno)
);

CREATE TABLE StudentFail (
    Rno VARCHAR2(10),
    Name VARCHAR2(50) NOT NULL,
    Sub1 NUMBER(3),
    Sub2 NUMBER(3),
    Sub3 NUMBER(3),
    Sub4 NUMBER(3),
    Sub5 NUMBER(3),
    Average NUMBER(5,2),
    Result VARCHAR2(10),
    Grade VARCHAR2(2),
    CONSTRAINT PK_StudentFail PRIMARY KEY (Rno)
);

INSERT INTO Student2 (Rno, Name, Sub1, Sub2, Sub3, Sub4, Sub5)
VALUES (&rno1, '&name1', &sub1_1, &sub2_1, &sub3_1, &sub4_1, &sub5_1);

INSERT INTO Student2 (Rno, Name, Sub1, Sub2, Sub3, Sub4, Sub5)
VALUES (&rno2, '&name2', &sub1_2, &sub2_2, &sub3_2, &sub4_2, &sub5_2);

INSERT INTO Student2 (Rno, Name, Sub1, Sub2, Sub3, Sub4, Sub5)
VALUES (&rno3, '&name3', &sub1_3, &sub2_3, &sub3_3, &sub4_3, &sub5_3);

INSERT INTO Student2 (Rno, Name, Sub1, Sub2, Sub3, Sub4, Sub5)
VALUES (&rno4, '&name4', &sub1_4, &sub2_4, &sub3_4, &sub4_4, &sub5_4);

INSERT INTO Student2 (Rno, Name, Sub1, Sub2, Sub3, Sub4, Sub5)
VALUES (&rno5, '&name5', &sub1_5, &sub2_5, &sub3_5, &sub4_5, &sub5_5);

DECLARE
    CURSOR student_cur IS
        SELECT * FROM Student2;
    v_avg NUMBER(5,2);
    v_grade VARCHAR2(2);
    v_result VARCHAR2(10);
BEGIN
    FOR stu IN student_cur LOOP
        v_avg := (stu.Sub1 + stu.Sub2 + stu.Sub3 + stu.Sub4 + stu.Sub5) / 5;

        IF v_avg >= 50 THEN
            v_result := 'Pass';
            IF v_avg >= 90 THEN
                v_grade := 'A';
            ELSIF v_avg >= 75 THEN
                v_grade := 'B';
            ELSE
                v_grade := 'C';
            END IF;
            
            INSERT INTO StudentPass (Rno, Name, Sub1, Sub2, Sub3, Sub4, Sub5, Average, Result, Grade)
            VALUES (stu.Rno, stu.Name, stu.Sub1, stu.Sub2, stu.Sub3, stu.Sub4, stu.Sub5, v_avg, v_result, v_grade);
        ELSE
            v_result := 'Fail';
            v_grade := 'F';
            
            INSERT INTO StudentFail (Rno, Name, Sub1, Sub2, Sub3, Sub4, Sub5, Average, Result, Grade)
            VALUES (stu.Rno, stu.Name, stu.Sub1, stu.Sub2, stu.Sub3, stu.Sub4, stu.Sub5, v_avg, v_result, v_grade);
        END IF;
        
        UPDATE Student2
        SET Average = v_avg, Result = v_result, Grade = v_grade
        WHERE Rno = stu.Rno;
    END LOOP;
    COMMIT;
    
    DBMS_OUTPUT.PUT_LINE('Top 3 Students Based on Average:');
    FOR rec IN (SELECT * FROM StudentPass ORDER BY Average DESC FETCH FIRST 3 ROWS ONLY) LOOP
        DBMS_OUTPUT.PUT_LINE('Rno: ' || rec.Rno || ', Name: ' || rec.Name || ', Average: ' || rec.Average);
    END LOOP;
END;
/

SELECT * FROM Student2;

SELECT * FROM StudentPass;

SELECT * FROM StudentFail;


-- INSERT INTO Student2 (Rno, Name, Sub1, Sub2, Sub3, Sub4, Sub5)
-- VALUES (1, 'Rahul', 80, 75, 88, 92, 85);

-- INSERT INTO Student2 (Rno, Name, Sub1, Sub2, Sub3, Sub4, Sub5)
-- VALUES (2, 'Anjali', 85, 78, 90, 86, 88);

-- INSERT INTO Student2 (Rno, Name, Sub1, Sub2, Sub3, Sub4, Sub5)
-- VALUES (3, 'Deepak', 79, 84, 76, 89, 91);

-- INSERT INTO Student2 (Rno, Name, Sub1, Sub2, Sub3, Sub4, Sub5)
-- VALUES (4, 'Priya', 08, 10, 12, 37, 25);

-- INSERT INTO Student2 (Rno, Name, Sub1, Sub2, Sub3, Sub4, Sub5)
-- VALUES (5, 'Kiran', 18, 80, 35, 03, 28);



-- DROP TABLE Student2 CASCADE CONSTRAINTS;
-- DROP TABLE StudentPass CASCADE CONSTRAINTS;
-- DROP TABLE StudentFail CASCADE CONSTRAINTS;