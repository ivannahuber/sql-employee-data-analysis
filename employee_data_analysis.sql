/*
============================================================
PROJECT: Employee Data Analysis
AUTHOR: Ivanna Huber
DATABASE: Microsoft SQL Server

DESCRIPTION:
This project demonstrates the use of SQL to create, query
and analyse employee salary and department data.

The project includes:
- Table creation
- Data insertion
- Filtering
- Sorting
- Pattern matching
- Aggregate functions
- Grouping
- Subqueries
- Window functions
============================================================
*/


------------------------------------------------------------
-- SECTION 1: CREATE THE EMPLOYEES TABLE
------------------------------------------------------------

CREATE TABLE employees (
    id INT PRIMARY KEY,
    first_name NVARCHAR(20),
    last_name NVARCHAR(20),
    department NVARCHAR(30),
    salary DECIMAL(10,2)
);


------------------------------------------------------------
-- SECTION 2: INSERT SAMPLE DATA
------------------------------------------------------------

INSERT INTO employees (
    id,
    first_name,
    last_name,
    department,
    salary
)
VALUES
    (1, 'James', 'Brown', 'Sales', 2800.00),
    (2, 'Sarah', 'Wilson', 'Marketing', 3200.00),
    (3, 'Tom', 'Evans', 'Sales', 2950.00),
    (4, 'Emma', 'Taylor', 'HR', 3500.00),
    (5, 'Liam', 'Murphy', 'IT', 4200.00),
    (6, 'Olivia', 'Scott', 'Marketing', 3100.00),
    (7, 'Noah', 'Thompson', 'IT', 4500.00),
    (8, 'Grace', 'Kelly', 'HR', 3300.00),
    (9, 'Jack', 'Stewart', 'Sales', 2700.00),
    (10, 'Sophia', 'White', 'IT', 4800.00),
    (11, 'Daniel', 'Walker', 'Marketing', 2900.00),
    (12, 'Mia', 'Young', 'HR', 3600.00),
    (13, 'Ethan', 'Hall', 'Sales', 2600.00),
    (14, 'Chloe', 'Green', 'IT', 5000.00),
    (15, 'Luke', 'Adams', 'Marketing', 3400.00);


------------------------------------------------------------
-- SECTION 3: BASIC SELECT QUERIES
------------------------------------------------------------


-- Task 1:
-- Display all columns and all records from the employees table.

SELECT *
FROM employees;


-- Task 2:
-- Display only the first name and last name of every employee.

SELECT
    first_name,
    last_name
FROM employees;


-- Task 3:
-- Display all information for the employee with ID 7.

SELECT *
FROM employees
WHERE id = 7;


-- Task 4:
-- Display all employees who work in the IT department.

SELECT *
FROM employees
WHERE department = 'IT';


------------------------------------------------------------
-- SECTION 4: SORTING DATA
------------------------------------------------------------


-- Task 5:
-- Display first names and last names ordered alphabetically
-- by surname.

SELECT
    first_name,
    last_name
FROM employees
ORDER BY last_name ASC;


-- Task 6:
-- Display first names and last names ordered in reverse
-- alphabetical order by surname.

SELECT
    first_name,
    last_name
FROM employees
ORDER BY last_name DESC;


-- Task 7:
-- Display all employees ordered by salary from highest
-- to lowest.

SELECT *
FROM employees
ORDER BY salary DESC;


------------------------------------------------------------
-- SECTION 5: FILTERING DATA
------------------------------------------------------------


-- Task 8:
-- Display all employees earning more than £4,000.

SELECT *
FROM employees
WHERE salary > 4000;


-- Task 9:
-- Display all employees earning less than £3,000.

SELECT *
FROM employees
WHERE salary < 3000;


-- Task 10:
-- Display employees whose salary is between £3,000
-- and £4,000.

SELECT *
FROM employees
WHERE salary BETWEEN 3000 AND 4000;


-- Task 11:
-- Display employees who work in Marketing.

SELECT *
FROM employees
WHERE department = 'Marketing';


-- Task 12:
-- Display employees who do not work in Sales.

SELECT *
FROM employees
WHERE department <> 'Sales';


------------------------------------------------------------
-- SECTION 6: PATTERN MATCHING
------------------------------------------------------------


-- Task 13:
-- Display all employees whose first name starts with
-- the letter S.

SELECT *
FROM employees
WHERE first_name LIKE 'S%';


-- Task 14:
-- Display all employees whose last name ends with
-- the letter n.

SELECT *
FROM employees
WHERE last_name LIKE '%n';


-- Task 15:
-- Display all employees whose surname contains "son".

SELECT *
FROM employees
WHERE last_name LIKE '%son%';


------------------------------------------------------------
-- SECTION 7: MULTIPLE CONDITIONS
------------------------------------------------------------


-- Task 16:
-- Display all employees in the IT department who earn
-- more than £4,500.

SELECT *
FROM employees
WHERE department = 'IT'
  AND salary > 4500;


-- Task 17:
-- Display all employees in Sales who earn less
-- than £2,900.

SELECT *
FROM employees
WHERE department = 'Sales'
  AND salary < 2900;


-- Task 18:
-- Display all employees who work in either HR
-- or Marketing.

SELECT *
FROM employees
WHERE department IN ('HR', 'Marketing');


------------------------------------------------------------
-- SECTION 8: AGGREGATE FUNCTIONS
------------------------------------------------------------


-- Task 19:
-- Calculate the total salary paid to all employees.

SELECT
    SUM(salary) AS total_salary
FROM employees;


-- Task 20:
-- Calculate the average salary of all employees.

SELECT
    CAST(AVG(salary) AS DECIMAL(10,2)) AS average_salary
FROM employees;


-- Task 21:
-- Find the highest salary in the company.

SELECT
    MAX(salary) AS highest_salary
FROM employees;


-- Task 22:
-- Find the lowest salary in the company.

SELECT
    MIN(salary) AS lowest_salary
FROM employees;


------------------------------------------------------------
-- SECTION 9: GROUPING DATA
------------------------------------------------------------


-- Task 23:
-- Show the total salary paid in each department.

SELECT
    department,
    SUM(salary) AS total_salary
FROM employees
GROUP BY department
ORDER BY total_salary DESC;


-- Task 24:
-- Show the average salary for each department.

SELECT
    department,
    CAST(AVG(salary) AS DECIMAL(10,2)) AS average_salary
FROM employees
GROUP BY department
ORDER BY average_salary DESC;


-- Task 25:
-- Count how many employees work in each department.

SELECT
    department,
    COUNT(*) AS employee_count
FROM employees
GROUP BY department
ORDER BY employee_count DESC;


------------------------------------------------------------
-- SECTION 10: TOP RESULTS AND SUBQUERIES
------------------------------------------------------------


-- Task 26:
-- Display the top 5 highest-paid employees.

SELECT TOP 5
    id,
    first_name,
    last_name,
    department,
    salary
FROM employees
ORDER BY salary DESC;


-- Task 27:
-- Display all employees earning above the company
-- average salary.

SELECT *
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
)
ORDER BY salary DESC;


-- Task 28:
-- Display employees whose first name contains
-- the letter a.

SELECT *
FROM employees
WHERE first_name LIKE '%a%';


-- Task 29:
-- Display all employees ordered first by department
-- and then by salary from highest to lowest.

SELECT *
FROM employees
ORDER BY
    department ASC,
    salary DESC;


-- Task 30:
-- Find the department with the highest average salary.

SELECT TOP 1
    department,
    CAST(AVG(salary) AS DECIMAL(10,2)) AS highest_average_salary
FROM employees
GROUP BY department
ORDER BY AVG(salary) DESC;


------------------------------------------------------------
-- SECTION 11: ADDITIONAL ADVANCED QUERIES
------------------------------------------------------------


-- Task 31:
-- Rank all employees by salary from highest to lowest.

SELECT
    id,
    first_name,
    last_name,
    department,
    salary,
    RANK() OVER (
        ORDER BY salary DESC
    ) AS salary_rank
FROM employees;


-- Task 32:
-- Rank employees by salary within each department.

SELECT
    id,
    first_name,
    last_name,
    department,
    salary,
    RANK() OVER (
        PARTITION BY department
        ORDER BY salary DESC
    ) AS department_salary_rank
FROM employees;


-- Task 33:
-- Display employees earning more than the average salary
-- in their own department.

SELECT
    e.id,
    e.first_name,
    e.last_name,
    e.department,
    e.salary
FROM employees AS e
WHERE e.salary > (
    SELECT AVG(e2.salary)
    FROM employees AS e2
    WHERE e2.department = e.department
)
ORDER BY
    e.department,
    e.salary DESC;


-- Task 34:
-- Display the highest-paid employee in each department.

WITH ranked_employees AS (
    SELECT
        id,
        first_name,
        last_name,
        department,
        salary,
        RANK() OVER (
            PARTITION BY department
            ORDER BY salary DESC
        ) AS salary_rank
    FROM employees
)

SELECT
    id,
    first_name,
    last_name,
    department,
    salary
FROM ranked_employees
WHERE salary_rank = 1
ORDER BY salary DESC;


-- Task 35:
-- Create salary categories using a CASE statement.

SELECT
    id,
    first_name,
    last_name,
    department,
    salary,
    CASE
        WHEN salary < 3000 THEN 'Low Salary'
        WHEN salary BETWEEN 3000 AND 3999.99 THEN 'Medium Salary'
        WHEN salary BETWEEN 4000 AND 4499.99 THEN 'High Salary'
        ELSE 'Very High Salary'
    END AS salary_category
FROM employees
ORDER BY salary DESC;


/*
============================================================
PROJECT SUMMARY

SQL SKILLS DEMONSTRATED:

- CREATE TABLE
- INSERT INTO
- SELECT
- WHERE
- ORDER BY
- LIKE
- BETWEEN
- IN
- AND
- Aggregate functions
- GROUP BY
- TOP
- Subqueries
- CASE statements
- Common Table Expressions
- Window functions
- RANK
- PARTITION BY

KEY FINDINGS:

- The IT department has the highest average salary.
- Chloe Green is the highest-paid employee.
- The Sales department has the lowest salary levels.
- Several IT employees earn above the company average salary.

============================================================
*/
