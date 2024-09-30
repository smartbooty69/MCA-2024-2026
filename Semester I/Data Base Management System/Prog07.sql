-- Create Student Table
CREATE TABLE Student (
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

-- Create StudentPass Table
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

-- Create StudentFail Table
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

INSERT INTO Student (Rno, Name, Sub1, Sub2, Sub3, Sub4, Sub5)
VALUES (:rno1, :name1, :sub1_1, :sub2_1, :sub3_1, :sub4_1, :sub5_1);

INSERT INTO Student (Rno, Name, Sub1, Sub2, Sub3, Sub4, Sub5)
VALUES (:rno2, :name2, :sub1_2, :sub2_2, :sub3_2, :sub4_2, :sub5_2);

INSERT INTO Student (Rno, Name, Sub1, Sub2, Sub3, Sub4, Sub5)
VALUES (:rno3, :name3, :sub1_3, :sub2_3, :sub3_3, :sub4_3, :sub5_3);

INSERT INTO Student (Rno, Name, Sub1, Sub2, Sub3, Sub4, Sub5)
VALUES (:rno4, :name4, :sub1_4, :sub2_4, :sub3_4, :sub4_4, :sub5_4);

INSERT INTO Student (Rno, Name, Sub1, Sub2, Sub3, Sub4, Sub5)
VALUES (:rno5, :name5, :sub1_5, :sub2_5, :sub3_5, :sub4_5, :sub5_5);

DECLARE
    CURSOR student_cur IS
        SELECT * FROM Student;
    v_avg NUMBER(5,2);
    v_grade VARCHAR2(2);
    v_result VARCHAR2(10);
BEGIN
    FOR stu IN student_cur LOOP
        -- Calculate average
        v_avg := (stu.Sub1 + stu.Sub2 + stu.Sub3 + stu.Sub4 + stu.Sub5) / 5;

        -- Determine result and grade
        IF v_avg >= 50 THEN
            v_result := 'Pass';
            IF v_avg >= 90 THEN
                v_grade := 'A';
            ELSIF v_avg >= 75 THEN
                v_grade := 'B';
            ELSE
                v_grade := 'C';
            END IF;
            
            -- Insert into StudentPass table
            INSERT INTO StudentPass (Rno, Name, Sub1, Sub2, Sub3, Sub4, Sub5, Average, Result, Grade)
            VALUES (stu.Rno, stu.Name, stu.Sub1, stu.Sub2, stu.Sub3, stu.Sub4, stu.Sub5, v_avg, v_result, v_grade);
        ELSE
            v_result := 'Fail';
            v_grade := 'F';
            
            -- Insert into StudentFail table
            INSERT INTO StudentFail (Rno, Name, Sub1, Sub2, Sub3, Sub4, Sub5, Average, Result, Grade)
            VALUES (stu.Rno, stu.Name, stu.Sub1, stu.Sub2, stu.Sub3, stu.Sub4, stu.Sub5, v_avg, v_result, v_grade);
        END IF;
        
        -- Update the original student table with average, result, and grade
        UPDATE Student
        SET Average = v_avg, Result = v_result, Grade = v_grade
        WHERE Rno = stu.Rno;
    END LOOP;
    COMMIT;
    
    -- Display first, second, and third average students
    DBMS_OUTPUT.PUT_LINE('Top 3 Students Based on Average:');
    FOR rec IN (SELECT * FROM StudentPass ORDER BY Average DESC FETCH FIRST 3 ROWS ONLY) LOOP
        DBMS_OUTPUT.PUT_LINE('Rno: ' || rec.Rno || ', Name: ' || rec.Name || ', Average: ' || rec.Average);
    END LOOP;
END;
/

-- DROP TABLE Student CASCADE CONSTRAINTS;
-- DROP TABLE StudentPass CASCADE CONSTRAINTS;
-- DROP TABLE StudentFail CASCADE CONSTRAINTS;

-- View all students in the Student table
SELECT * FROM Student;

-- View students who passed
SELECT * FROM StudentPass;

-- View students who failed
SELECT * FROM StudentFail;
