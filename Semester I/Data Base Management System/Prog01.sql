-- Create a table for number functions
CREATE TABLE tab1 (data NUMBER(7,2));

-- Insert values into the table
INSERT INTO tab1 VALUES ('&data');
INSERT INTO tab1 VALUES ('&data');
INSERT INTO tab1 VALUES ('&data');
INSERT INTO tab1 VALUES ('&data');
INSERT INTO tab1 VALUES ('&data');

-- Number Functions
SELECT AVG(data) AS avg_data FROM tab1;
SELECT COUNT(data) AS count_data FROM tab1;
SELECT MAX(data) AS max_data FROM tab1;
SELECT MIN(data) AS min_data FROM tab1;
SELECT STDDEV(data) AS stddev_data FROM tab1;
SELECT VARIANCE(data) AS variance_data FROM tab1;
SELECT GREATEST(57, 23, 78, 56, 89) AS greatest_value FROM dual;
SELECT LEAST(57, 23, 78, 56, 89) AS least_value FROM dual;
SELECT ABS(-67.89) AS abs_value FROM dual;
SELECT CEIL(56.6856) AS ceil_value FROM dual;
SELECT FLOOR(56.467) AS floor_value FROM dual;
SELECT LN(10) AS ln_value FROM dual;
SELECT EXP(2.3025851) AS exp_value FROM dual;
SELECT LOG(10, 2) AS log_value FROM dual;
SELECT POWER(2, 3) AS power_value FROM dual;
SELECT SQRT(16) AS sqrt_value FROM dual;
SELECT MOD(7, 2) AS mod_value FROM dual;
SELECT ROUND(36.7897, 2) AS round_value FROM dual;
SELECT TRUNC(1005.678) AS trunc_value FROM dual;
SELECT ROUND(1000.68) AS round_value_2 FROM dual;
SELECT SIGN(-67) AS sign_negative FROM dual;
SELECT SIGN(67) AS sign_positive FROM dual;
SELECT SIN(30 * (3.1415 / 180)) AS sin_value_1 FROM dual;
SELECT SIN(30 * (3.142857 / 180)) AS sin_value_2 FROM dual;
SELECT SINH(30 * (3.142857 / 180)) AS sinh_value FROM dual;
SELECT COS(30 * (3.142857 / 180)) AS cos_value FROM dual;
SELECT COSH(30 * (3.142857 / 180)) AS cosh_value FROM dual;
SELECT TAN(30 * (3.142857 / 180)) AS tan_value FROM dual;
SELECT TANH(30 * (3.142857 / 180)) AS tanh_value FROM dual;

-- Date Functions
SELECT SYSDATE FROM dual;
SELECT ADD_MONTHS(SYSDATE, 3) AS date_plus_three_months FROM dual;
SELECT LAST_DAY(SYSDATE) AS last_day_of_month FROM dual;
SELECT NEXT_DAY(SYSDATE, 'TUESDAY') AS next_tuesday FROM dual;
SELECT NEXT_DAY(SYSDATE, 'MONDAY') AS next_monday FROM dual;
SELECT TO_CHAR(SYSDATE, 'DD-MM-YY') AS formatted_date FROM dual;
SELECT ROUND(TO_DATE('8/8/96', 'DD/MM/YY'), 'YEAR') AS rounded_year FROM dual;
SELECT TRUNC(TO_DATE('8/8/96', 'DD/MM/YY'), 'MONTH') AS truncated_month FROM dual;
SELECT TO_DATE('8/8/96', 'DD/MM/YY') AS original_date FROM dual;
SELECT MONTHS_BETWEEN('15-MAR-04', '01-DEC-03') AS months_between_dates FROM dual;

-- Count Functions
-- Note: Assumes an 'emp' table exists with 'deptcode' column
SELECT * FROM emp;
SELECT COUNT(*) FROM emp;
SELECT COUNT(deptcode) FROM emp;
SELECT COUNT(DISTINCT deptcode) FROM emp;

-- Character Functions
SELECT INITCAP('hello') AS initcap_value FROM dual;
SELECT LOWER('FUN') AS lower_value FROM dual;
SELECT UPPER('fun') AS upper_value FROM dual;
SELECT LTRIM(' Hello') AS ltrim_value FROM dual;
SELECT RTRIM('Hello ') AS rtrim_value FROM dual;
SELECT TRANSLATE('jack', 'j', 'b') AS translate_value FROM dual;
SELECT SUBSTR('abcdefgh', 6, 3) AS substr_value FROM dual;

-- Stop OCI (this is generally done outside of SQL, e.g., by closing your SQL client)
