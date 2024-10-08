CREATE DATABASE company_db;

USE company_db;

CREATE TABLE employees (
    emp_id INT PRIMARY KEY AUTO_INCREMENT,
    name TEXT NOT NULL,
    position TEXT NOT NULL,
    salary DECIMAL(10, 2) NOT NULL
);

DELIMITER $$

CREATE PROCEDURE UpdateEmployee(
    IN emp_id INT,
    IN new_name TEXT,
    IN new_position TEXT,
    IN new_salary DECIMAL(10, 2)
)
BEGIN
    UPDATE employees
    SET name = new_name, position = new_position, salary = new_salary
    WHERE emp_id = emp_id;
END $$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE DeleteEmployee(IN emp_id INT)
BEGIN
    DELETE FROM employees WHERE emp_id = emp_id;
END $$

DELIMITER ;
