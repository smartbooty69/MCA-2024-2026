SET SERVEROUTPUT ON;

CREATE OR REPLACE FUNCTION fact(n NUMBER) RETURN NUMBER IS
BEGIN
    IF (n = 0) THEN
        RETURN (1);
    ELSE
        RETURN (n * fact(n - 1));
    END IF;
END;
/

CREATE OR REPLACE FUNCTION fibo(n NUMBER) RETURN NUMBER IS
BEGIN
    IF (n = 1) THEN
        RETURN (0);
    ELSIF (n = 2) THEN
        RETURN (1);
    ELSE
        RETURN (fibo(n - 1) + fibo(n - 2));
    END IF;
END;
/

DECLARE
    n NUMBER;
    ch NUMBER;
BEGIN
    LOOP
        DBMS_OUTPUT.PUT_LINE('1. FACTORIAL VALUE');
        DBMS_OUTPUT.PUT_LINE('2. FIBONACCI SERIES');
        DBMS_OUTPUT.PUT_LINE('3. EXIT');
        DBMS_OUTPUT.PUT('Enter your choice: ');
        ch := :ch;  

        IF ch = 1 THEN
            DBMS_OUTPUT.PUT('Enter a number for factorial: ');
            n := :n;  
            DBMS_OUTPUT.PUT_LINE('Factorial Value of ' || n || ' is ' || fact(n));
        ELSIF ch = 2 THEN
            DBMS_OUTPUT.PUT('Enter the number of terms for Fibonacci series: ');
            n := :n; 
            DBMS_OUTPUT.PUT_LINE('Fibonacci Series:');
            FOR i IN 1..n LOOP
                DBMS_OUTPUT.PUT(fibo(i) || ' ');
            END LOOP;
            DBMS_OUTPUT.PUT_LINE(''); 
        ELSIF ch = 3 THEN
            DBMS_OUTPUT.PUT_LINE('THANK YOU');
            EXIT; 
        ELSE
            DBMS_OUTPUT.PUT_LINE('Invalid choice, please try again.');
        END IF;
    END LOOP;
END;
/
