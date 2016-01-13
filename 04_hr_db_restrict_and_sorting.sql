USE hr_db;


-- 1.
SELECT CONCAT(FIRST_NAME, ' ', LAST_NAME) AS NAME, SALARY FROM employees
WHERE
(
	SALARY < 10000 OR SALARY > 15000
)
AND
(
    DEPARTMENT_ID = 30 OR DEPARTMENT_ID = 100
);

-- 2.
SELECT CONCAT(FIRST_NAME, ' ', LAST_NAME) AS NAME, HIRE_DATE FROM employees
WHERE YEAR(HIRE_DATE) = 1987;

-- 3.
SELECT FIRST_NAME FROM employees
WHERE
	LOWER(FIRST_NAME) LIKE '%b%'
OR
	LOWER(FIRST_NAME) LIKE '%c%';

-- 4.  -- how should I solve it without JOIN?
-- querry in querry:
SELECT LAST_NAME, JOB_ID, SALARY FROM employees
WHERE JOB_ID =
(
	SELECT JOB_ID FROM jobs
    WHERE JOB_TITLE = 'Programmer'
)
OR JOB_ID =
(
	SELECT JOB_ID FROM jobs
    WHERE JOB_TITLE = 'Shipping Clerk'
);

-- joining by simple commas and filtering by WHERE clause:
SELECT employees.LAST_NAME, jobs.JOB_TITLE, employees.SALARY FROM employees, jobs
WHERE employees.JOB_ID = jobs.JOB_ID
AND
	(jobs.JOB_TITLE = 'Programmer' OR jobs.JOB_TITLE= 'Shipping Clerk')
AND
	(SALARY != 4500 AND SALARY != 10000 AND SALARY != 15000);

-- with (INNER) JOIN:
SELECT employees.LAST_NAME, jobs.JOB_TITLE, employees.SALARY FROM employees JOIN jobs
ON employees.JOB_ID = jobs.JOB_ID
WHERE
	(jobs.JOB_TITLE = 'Programmer' OR jobs.JOB_TITLE= 'Shipping Clerk')
AND
	(SALARY != 4500 AND SALARY != 10000 AND SALARY != 15000);

-- with NATURAL JOIN:
SELECT employees.LAST_NAME, jobs.JOB_TITLE, employees.SALARY FROM employees NATURAL JOIN jobs
WHERE
	(jobs.JOB_TITLE = 'Programmer' OR jobs.JOB_TITLE= 'Shipping Clerk')
AND
	(SALARY != 4500 AND SALARY != 10000 AND SALARY != 15000);

-- 5.
SELECT * FROM employees
WHERE
(
	LAST_NAME LIKE '%SCOTT%'
OR
	LAST_NAME LIKE '%BLAKE%'
OR
	LAST_NAME LIKE '%KING%'
OR
	LAST_NAME LIKE '%FORD%'
);

SELECT CONCAT(e.FIRST_NAME, ' ', e.LAST_NAME) AS NAME, e.EMAIL, e.PHONE_NUMBER, e.HIRE_DATE, j.JOB_TITLE, e.SALARY, e.COMMISSION_PCT, e.MANAGER_ID, d.DEPARTMENT_NAME
FROM employees AS e, jobs AS j, departments AS d
WHERE (j.JOB_ID = e.JOB_ID AND d.DEPARTMENT_ID = e.DEPARTMENT_ID)
AND
(
	e.LAST_NAME LIKE '%SCOTT%'
OR
	e.LAST_NAME LIKE '%BLAKE%'
OR
	e.LAST_NAME LIKE '%KING%'
OR
	e.LAST_NAME LIKE '%FORD%'
);
