CREATE OR REPLACE FUNCTION FACT(
    N NUMBER
) RETURN NUMBER IS
BEGIN
    IF (N=0) THEN
        RETURN(1);
    ELSE
        RETURN(N*FACT(N-1));
    END IF;
END;
/

CREATE OR REPLACE FUNCTION FIBO(
    N NUMBER
) RETURN NUMBER IS
BEGIN
    IF (N=1) THEN
        RETURN(0);
    ELSIF (N=2) THEN
        RETURN(1);
    ELSE
        RETURN(FIBO(N-1)+FIBO(N-2));
    END IF;
END;
/

DECLARE
    N  NUMBER;
    CH NUMBER;
BEGIN
    DBMS_OUTPUT.PUT_LINE('1.FACTORIAL VALUE');
    DBMS_OUTPUT.PUT_LINE('2.FIBONACCI SERIES');
    DBMS_OUTPUT.PUT_LINE('3.EXIT');
    CH:=&CH;
    DBMS_OUTPUT.PUT_LINE('Enter your choice : '
                         ||CH);
    N:=&N;
    CASE CH
        WHEN 1 THEN
            DBMS_OUTPUT.PUT_LINE('Factorial Value of '
                                 ||N
                                 ||' is '
                                 ||FACT(N));
        WHEN 2 THEN
            BEGIN
                DBMS_OUTPUT.PUT_LINE('Fibonacci Series are');
                FOR I IN 1..N LOOP
                    DBMS_OUTPUT.PUT_LINE(FIBO(I));
                END LOOP;
            END;
        ELSE
            DBMS_OUTPUT.PUT_LINE('THANK YOU');
    END CASE;
END;
/