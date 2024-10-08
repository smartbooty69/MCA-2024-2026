CREATE DATABASE company_db;

USE company_db;

CREATE TABLE employees (
    emp_id INT PRIMARY KEY AUTO_INCREMENT,
    name TEXT NOT NULL,
    position TEXT NOT NULL,
    salary DECIMAL(10, 2) NOT NULL
);

DELIMITER $$

CREATE PROCEDURE InsertEmployee(
    IN emp_name TEXT,
    IN emp_position TEXT,
    IN emp_salary DECIMAL(10, 2)
)
BEGIN
    INSERT INTO employees (name, position, salary)
    VALUES (emp_name, emp_position, emp_salary);
END $$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE GetEmployees()
BEGIN
    SELECT * FROM employees;
END $$

DELIMITER ;
