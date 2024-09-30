CREATE TABLE emp (
    eid VARCHAR2(12) PRIMARY KEY, 
    ename VARCHAR2(50), 
    dob DATE, 
    doj DATE,
    salary NUMBER(16,2) CHECK (salary > 0)
);

INSERT INTO emp VALUES ('E101', 'John', TO_DATE('1985-06-15', 'YYYY-MM-DD'), TO_DATE('2010-01-10', 'YYYY-MM-DD'), 50000);
INSERT INTO emp VALUES ('E102', 'Alice', TO_DATE('1990-08-22', 'YYYY-MM-DD'), TO_DATE('2012-07-19', 'YYYY-MM-DD'), 60000);
INSERT INTO emp VALUES ('E103', 'Bob', TO_DATE('1978-03-12', 'YYYY-MM-DD'), TO_DATE('2009-09-12', 'YYYY-MM-DD'), 55000);
INSERT INTO emp VALUES ('E104', 'Charlie', TO_DATE('1980-05-25', 'YYYY-MM-DD'), TO_DATE('2011-05-30', 'YYYY-MM-DD'), 45000);
INSERT INTO emp VALUES ('E105', 'Diana', TO_DATE('1988-11-30', 'YYYY-MM-DD'), TO_DATE('2013-11-11', 'YYYY-MM-DD'), 65000);

CREATE OR REPLACE PROCEDURE getByEID(
    id IN emp.eid%TYPE,
    ename OUT emp.ename%TYPE,
    salary OUT emp.salary%TYPE
) IS
BEGIN
    SELECT ename, salary INTO ename, salary FROM emp WHERE eid = id;
END;
/

CREATE OR REPLACE PROCEDURE findFirstMaxSalary(
    eid OUT emp.eid%TYPE,
    ename OUT emp.ename%TYPE,
    dob OUT emp.dob%TYPE,
    salary OUT emp.salary%TYPE
) IS
BEGIN
    SELECT eid, ename, dob, salary INTO eid, ename, dob, salary 
    FROM emp 
    WHERE salary = (SELECT MAX(salary) FROM emp);
END;
/

CREATE OR REPLACE PROCEDURE findSecondMaxSalary(
    eid OUT emp.eid%TYPE,
    ename OUT emp.ename%TYPE,
    dob OUT emp.dob%TYPE,
    salary OUT emp.salary%TYPE
) IS
BEGIN
    SELECT eid, ename, dob, salary INTO eid, ename, dob, salary 
    FROM emp 
    WHERE salary = (SELECT MAX(salary) FROM emp WHERE salary < (SELECT MAX(salary) FROM emp));
END;
/

CREATE OR REPLACE PROCEDURE findThirdMaxSalary(
    eid OUT emp.eid%TYPE,
    ename OUT emp.ename%TYPE,
    dob OUT emp.dob%TYPE,
    salary OUT emp.salary%TYPE
) IS
BEGIN
    SELECT eid, ename, dob, salary INTO eid, ename, dob, salary 
    FROM emp 
    WHERE salary = (SELECT MAX(salary) 
                    FROM emp 
                    WHERE salary < (SELECT MAX(salary) FROM emp WHERE salary < (SELECT MAX(salary) FROM emp)));
END;
/

CREATE OR REPLACE PROCEDURE findFirstSeniorMost(
    eid OUT emp.eid%TYPE,
    ename OUT emp.ename%TYPE,
    dob OUT emp.dob%TYPE,
    salary OUT emp.salary%TYPE
) IS
BEGIN
    SELECT eid, ename, dob, salary INTO eid, ename, dob, salary 
    FROM emp 
    WHERE dob = (SELECT MIN(dob) FROM emp);
END;
/

CREATE OR REPLACE PROCEDURE findSecondSeniorMost(
    eid OUT emp.eid%TYPE,
    ename OUT emp.ename%TYPE,
    dob OUT emp.dob%TYPE,
    salary OUT emp.salary%TYPE
) IS
BEGIN
    SELECT eid, ename, dob, salary INTO eid, ename, dob, salary 
    FROM emp 
    WHERE doj = (SELECT MIN(doj) FROM emp WHERE doj > (SELECT MIN(doj) FROM emp));
END;
/

DECLARE
    eid emp.eid%TYPE;
    ename emp.ename%TYPE;
    dob emp.dob%TYPE;
    salary emp.salary%TYPE;
    ch NUMBER;
BEGIN
    DBMS_OUTPUT.PUT_LINE('1. GET EMPLOYEE DETAILS BY EID');
    DBMS_OUTPUT.PUT_LINE('2. GET EMPLOYEE DETAILS OF FIRST HIGHEST SALARY');
    DBMS_OUTPUT.PUT_LINE('3. GET EMPLOYEE DETAILS OF SECOND HIGHEST SALARY');
    DBMS_OUTPUT.PUT_LINE('4. GET EMPLOYEE DETAILS OF THIRD HIGHEST SALARY');
    DBMS_OUTPUT.PUT_LINE('5. GET FIRST SENIOR MOST EMPLOYEE DETAILS');
    DBMS_OUTPUT.PUT_LINE('6. GET SECOND SENIOR MOST EMPLOYEE DETAILS');
    DBMS_OUTPUT.PUT_LINE('7. EXIT');
    
    ch := &ch; 
    DBMS_OUTPUT.PUT_LINE('Enter your choice: ' || ch);
    
    IF ch = 1 THEN
        eid := '&eid';
        DBMS_OUTPUT.PUT_LINE('EMPLOYEE DETAILS BY EID');
        DBMS_OUTPUT.PUT_LINE('************************');
        getByEID(eid, ename, salary);
        DBMS_OUTPUT.PUT_LINE('EID: ' || eid);
        DBMS_OUTPUT.PUT_LINE('ENAME: ' || ename);
        DBMS_OUTPUT.PUT_LINE('SALARY: ' || salary);
        
    ELSIF ch = 2 THEN
        DBMS_OUTPUT.PUT_LINE('EMPLOYEE DETAILS OF FIRST HIGHEST SALARY');
        DBMS_OUTPUT.PUT_LINE('***************************************');
        findFirstMaxSalary(eid, ename, dob, salary);
        DBMS_OUTPUT.PUT_LINE('EID: ' || eid);
        DBMS_OUTPUT.PUT_LINE('ENAME: ' || ename);
        DBMS_OUTPUT.PUT_LINE('DOB: ' || dob);
        DBMS_OUTPUT.PUT_LINE('SALARY: ' || salary);
        
    ELSIF ch = 3 THEN
        DBMS_OUTPUT.PUT_LINE('EMPLOYEE DETAILS OF SECOND HIGHEST SALARY');
        DBMS_OUTPUT.PUT_LINE('****************************************');
        findSecondMaxSalary(eid, ename, dob, salary);
        DBMS_OUTPUT.PUT_LINE('EID: ' || eid);
        DBMS_OUTPUT.PUT_LINE('ENAME: ' || ename);
        DBMS_OUTPUT.PUT_LINE('DOB: ' || dob);
        DBMS_OUTPUT.PUT_LINE('SALARY: ' || salary);
        
    ELSIF ch = 4 THEN
        DBMS_OUTPUT.PUT_LINE('EMPLOYEE DETAILS OF THIRD HIGHEST SALARY');
        DBMS_OUTPUT.PUT_LINE('***************************************');
        findThirdMaxSalary(eid, ename, dob, salary);
        DBMS_OUTPUT.PUT_LINE('EID: ' || eid);
        DBMS_OUTPUT.PUT_LINE('ENAME: ' || ename);
        DBMS_OUTPUT.PUT_LINE('DOB: ' || dob);
        DBMS_OUTPUT.PUT_LINE('SALARY: ' || salary);
        
    ELSIF ch = 5 THEN
        DBMS_OUTPUT.PUT_LINE('FIRST SENIOR MOST EMPLOYEE DETAILS');
        DBMS_OUTPUT.PUT_LINE('*********************************');
        findFirstSeniorMost(eid, ename, dob, salary);
        DBMS_OUTPUT.PUT_LINE('EID: ' || eid);
        DBMS_OUTPUT.PUT_LINE('ENAME: ' || ename);
        DBMS_OUTPUT.PUT_LINE('DOB: ' || dob);
        DBMS_OUTPUT.PUT_LINE('SALARY: ' || salary);
        
    ELSIF ch = 6 THEN
        DBMS_OUTPUT.PUT_LINE('SECOND SENIOR MOST EMPLOYEE DETAILS');
        DBMS_OUTPUT.PUT_LINE('**********************************');
        findSecondSeniorMost(eid, ename, dob, salary);
        DBMS_OUTPUT.PUT_LINE('EID: ' || eid);
        DBMS_OUTPUT.PUT_LINE('ENAME: ' || ename);
        DBMS_OUTPUT.PUT_LINE('DOB: ' || dob);
        DBMS_OUTPUT.PUT_LINE('SALARY: ' || salary);
        
    ELSE
        DBMS_OUTPUT.PUT_LINE('THANK YOU! GOODBYE!');
    END IF;
    
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No Records Found!');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An Error Occurred!');
END;
/

SET SERVEROUTPUT ON;
/

-- DROP TABLE emp;