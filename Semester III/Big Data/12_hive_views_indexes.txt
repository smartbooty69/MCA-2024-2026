### Program 12: Hive Guide - Using Views and Indexes

Prerequisites: Start services (Cloudera terminal)
```bash
sudo service hadoop-hdfs-namenode start
sudo service hadoop-hdfs-datanode start
sudo service hive-server2 start
```

Open Hive shell:
```bash
hive
```

1) Create database and table (in Hive shell)
```sql
CREATE DATABASE company;
USE company;

CREATE TABLE employees (
    emp_id INT,
    emp_name STRING,
    department STRING,
    salary FLOAT,
    city STRING
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE;
```

2) Prepare and load data
- Exit Hive (Ctrl+D), then in terminal create file:
```bash
echo -e "1,John,HR,50000,New York\n2,Alice,IT,60000,San Francisco\n3,Bob,Finance,70000,Chicago\n4,Diana,HR,55000,New York\n5,Sam,IT,65000,San Francisco" > /home/cloudera/employees.csv
```
- Re-enter Hive and load data:
```sql
USE company;
LOAD DATA LOCAL INPATH '/home/cloudera/employees.csv' INTO TABLE employees;
SELECT * FROM employees;
```

3) Create and query a view
```sql
CREATE VIEW it_employees AS
SELECT emp_id, emp_name, salary, city
FROM employees
WHERE department = 'IT';

SELECT * FROM it_employees;
```

4) Create an index on department
```sql
CREATE INDEX idx_department
ON TABLE employees (department)
AS 'COMPACT'
WITH DEFERRED REBUILD;

ALTER INDEX idx_department ON employees REBUILD;
```

5) Query with the index
```sql
SELECT emp_id, emp_name
FROM employees
WHERE department = 'HR';
```

6) Clean up
```sql
DROP VIEW it_employees;
DROP INDEX idx_department ON employees;
```

Notes:
- Some Hive deployments require enabling the index handler and may store index tables in the metastore; if `CREATE INDEX` is not supported in your version, consider partitioning or using ORC + column stats instead.
- Views are logical; data remains in the base table.


