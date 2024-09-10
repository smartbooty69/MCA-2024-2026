-- Create Student table
CREATE TABLE STUDENT (
  RNO VARCHAR2(10) PRIMARY KEY, -- Roll number as primary key
  NAME VARCHAR2(100) NOT NULL, -- Student name, not null
  SUB1 NUMBER, -- Marks for subject 1
  SUB2 NUMBER, -- Marks for subject 2
  SUB3 NUMBER, -- Marks for subject 3
  SUB4 NUMBER, -- Marks for subject 4
  SUB5 NUMBER, -- Marks for subject 5
  AVERAGE NUMBER, -- Average marks of the student
  RESULT VARCHAR2(10), -- Result (Pass/Fail)
  GRADE VARCHAR2(2) -- Grade (A, B, C, etc.)
);

-- Create StudentPass table
CREATE TABLE STUDENTPASS AS
  SELECT
    *
  FROM
    STUDENT
  WHERE
    1=0;

-- Creating structure based on Student table

-- Create StudentFail table
CREATE TABLE STUDENTFAIL AS
  SELECT
    *
  FROM
    STUDENT
  WHERE
    1=0;

-- Creating structure based on Student table

-- Insert sample data into the Student table
INSERT INTO STUDENT (
  RNO,
  NAME,
  SUB1,
  SUB2,
  SUB3,
  SUB4,
  SUB5
) VALUES (
  'S001',
  'Arun Kumar',
  78,
  85,
  90,
  88,
  80
);

INSERT INTO STUDENT (
  RNO,
  NAME,
  SUB1,
  SUB2,
  SUB3,
  SUB4,
  SUB5
) VALUES (
  'S002',
  'Beena Rao',
  65,
  70,
  75,
  68,
  72
);

INSERT INTO STUDENT (
  RNO,
  NAME,
  SUB1,
  SUB2,
  SUB3,
  SUB4,
  SUB5
) VALUES (
  'S003',
  'Charan Das',
  50,
  55,
  60,
  58,
  54
);

INSERT INTO STUDENT (
  RNO,
  NAME,
  SUB1,
  SUB2,
  SUB3,
  SUB4,
  SUB5
) VALUES (
  'S004',
  'Divya Singh',
  85,
  90,
  88,
  92,
  94
);

INSERT INTO STUDENT (
  RNO,
  NAME,
  SUB1,
  SUB2,
  SUB3,
  SUB4,
  SUB5
) VALUES (
  'S005',
  'Eshwar Mehta',
  40,
  45,
  35,
  38,
  42
);

-- Commit changes
COMMIT;

DECLARE
  V_CHOICE  NUMBER;
  V_RNO     VARCHAR2(10);
  V_NAME    VARCHAR2(100);
  V_SUB1    NUMBER;
  V_SUB2    NUMBER;
  V_SUB3    NUMBER;
  V_SUB4    NUMBER;
  V_SUB5    NUMBER;
  V_AVERAGE NUMBER;
  V_RESULT  VARCHAR2(10);
  V_GRADE   VARCHAR2(2);
  CURSOR C_STUDENTS IS
  SELECT
    *
  FROM
    STUDENT;

  PROCEDURE CALCULATE_RESULT IS
  BEGIN
    FOR STUDENT_REC IN C_STUDENTS LOOP
 
      -- Calculate the average
      V_AVERAGE := (STUDENT_REC.SUB1 + STUDENT_REC.SUB2 + STUDENT_REC.SUB3 + STUDENT_REC.SUB4 + STUDENT_REC.SUB5) / 5;
 
      -- Determine result and grade
      IF STUDENT_REC.SUB1 >= 35 AND STUDENT_REC.SUB2 >= 35 AND STUDENT_REC.SUB3 >= 35 AND STUDENT_REC.SUB4 >= 35 AND STUDENT_REC.SUB5 >= 35 THEN
        V_RESULT := 'Pass';
        IF V_AVERAGE >= 85 THEN
          V_GRADE := 'A';
        ELSIF V_AVERAGE >= 70 THEN
          V_GRADE := 'B';
        ELSIF V_AVERAGE >= 50 THEN
          V_GRADE := 'C';
        ELSE
          V_GRADE := 'D';
        END IF;
 

        -- Insert into StudentPass
        INSERT INTO STUDENTPASS VALUES (
          STUDENT_REC.RNO,
          STUDENT_REC.NAME,
          STUDENT_REC.SUB1,
          STUDENT_REC.SUB2,
          STUDENT_REC.SUB3,
          STUDENT_REC.SUB4,
          STUDENT_REC.SUB5,
          V_AVERAGE,
          V_RESULT,
          V_GRADE
        );
      ELSE
        V_RESULT := 'Fail';
        V_GRADE := 'F';
 
        -- Insert into StudentFail
        INSERT INTO STUDENTFAIL VALUES (
          STUDENT_REC.RNO,
          STUDENT_REC.NAME,
          STUDENT_REC.SUB1,
          STUDENT_REC.SUB2,
          STUDENT_REC.SUB3,
          STUDENT_REC.SUB4,
          STUDENT_REC.SUB5,
          V_AVERAGE,
          V_RESULT,
          V_GRADE
        );
      END IF;
 

      -- Update the Student table with calculated average, result, and grade
      UPDATE STUDENT
      SET
        AVERAGE = V_AVERAGE,
        RESULT = V_RESULT,
        GRADE = V_GRADE
      WHERE
        RNO = STUDENT_REC.RNO;
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('Results and grades calculated successfully.');
  END CALCULATE_RESULT;

  PROCEDURE DISPLAY_TOP_STUDENTS IS
  BEGIN
    DBMS_OUTPUT.PUT_LINE('Top 3 students based on average marks:');
    FOR REC IN (
      SELECT
        *
      FROM
        STUDENTPASS
      ORDER BY
        AVERAGE DESC FETCH FIRST 3 ROWS ONLY
    ) LOOP
      DBMS_OUTPUT.PUT_LINE('Rno: '
                           || REC.RNO
                           || ', Name: '
                           || REC.NAME
                           || ', Average: '
                           || REC.AVERAGE
                           || ', Grade: '
                           || REC.GRADE);
    END LOOP;
  END DISPLAY_TOP_STUDENTS;
BEGIN
  DBMS_OUTPUT.PUT_LINE('Menu Driven Program');
  DBMS_OUTPUT.PUT_LINE('1. Calculate Average, Result, and Grade');
  DBMS_OUTPUT.PUT_LINE('2. Display Top 3 Students');
  DBMS_OUTPUT.PUT_LINE('3. Exit');
  DBMS_OUTPUT.PUT('Enter your choice: ');
  V_CHOICE := &CHOICE; -- Input choice from the user
  CASE V_CHOICE
    WHEN 1 THEN
      CALCULATE_RESULT;
    WHEN 2 THEN
      DISPLAY_TOP_STUDENTS;
    WHEN 3 THEN
      DBMS_OUTPUT.PUT_LINE('Exiting the program.');
    ELSE
      DBMS_OUTPUT.PUT_LINE('Invalid choice. Please try again.');
  END CASE;
END;
/


