USE hr_db;


-- 1.
SELECT DISTINCT DEPARTMENT_ID FROM employees;

-- 2.
SELECT * FROM employees ORDER BY FIRST_NAME DESC;

-- 3.
SELECT SUM(SALARY) FROM employees;

-- 4.
SELECT MIN(SALARY) FROM employees;
SELECT MAX(SALARY) FROM employees;
-- togather
SELECT MIN(SALARY), MAX(SALARY) FROM employees;

-- 5.
SELECT AVG(SALARY) FROM employees;

-- 6.
SELECT COUNT(*) FROM employees;

-- 7.
SELECT COUNT(DISTINCT JOB_ID) FROM employees;

-- 8.
SELECT UPPER(FIRST_NAME) FROM employees;

-- 9.
SELECT SUBSTRING(FIRST_NAME, 1, 3) FROM employees;

-- 10.
SELECT CONCAT(FIRST_NAME, ' ', LAST_NAME) FROM employees;

-- 11.
SELECT TRIM(FIRST_NAME) FROM employees;

-- 12.
SELECT LENGTH(FIRST_NAME), LENGTH(LAST_NAME) FROM employees;

-- 13.
SELECT * FROM employees LIMIT 50, 10;