SET SERVEROUTPUT ON;

CREATE OR REPLACE PACKAGE mypkg AS 
    PROCEDURE area_circum_of_circle (r IN NUMBER, a OUT NUMBER, c OUT NUMBER); 
    
    FUNCTION gcd(a NUMBER, b NUMBER) RETURN NUMBER; 
END mypkg;
/

CREATE OR REPLACE PACKAGE BODY mypkg AS 
    PROCEDURE area_circum_of_circle (r IN NUMBER, a OUT NUMBER, c OUT NUMBER) IS 
    BEGIN 
        DECLARE 
            pi CONSTANT NUMBER(10,4) := 3.1416; 
        BEGIN 
            a := pi * (r * r);
            c := 2 * pi * r;  
        END; 
    END area_circum_of_circle;

    FUNCTION gcd(a NUMBER, b NUMBER) RETURN NUMBER IS 
    BEGIN 
        IF b = 0 THEN 
            RETURN a; 
        ELSE 
            RETURN gcd(b, a MOD b); 
        END IF; 
    END gcd;
END mypkg;
/

DECLARE 
    r NUMBER;   
    a NUMBER;   
    c NUMBER;  
    x NUMBER;   
    y NUMBER;   
    ch NUMBER; 
BEGIN 
    DBMS_OUTPUT.PUT_LINE('1. CALLING THE PROCEDURE AREA_CIRCUM_OF_CIRCLE IN THE PACKAGE');
    DBMS_OUTPUT.PUT_LINE('2. CALLING THE FUNCTION GCD IN THE PACKAGE');
    DBMS_OUTPUT.PUT_LINE('3. EXIT');
    
    ch := &ch;  
    DBMS_OUTPUT.PUT_LINE('Enter your choice: ' || ch);
    
    IF ch = 1 THEN 
        r := &r; 
        DBMS_OUTPUT.PUT_LINE('Enter the radius of the circle: ' || r);
        
        mypkg.area_circum_of_circle(r, a, c);
        
        DBMS_OUTPUT.PUT_LINE('Area of the Circle: ' || a);
        DBMS_OUTPUT.PUT_LINE('Circumference of the Circle: ' || c);
    
    ELSIF ch = 2 THEN 
        x := &x;  
        DBMS_OUTPUT.PUT_LINE('Enter the value for x: ' || x);
        y := &y;  
        DBMS_OUTPUT.PUT_LINE('Enter the value for y: ' || y);
        
        DBMS_OUTPUT.PUT_LINE('Greatest Common Divisor (GCD) of ' || x || ' and ' || y || ' is ' || mypkg.gcd(x, y));
    
    ELSE 
        DBMS_OUTPUT.PUT_LINE('THANK YOU');
    END IF; 
END;
/
