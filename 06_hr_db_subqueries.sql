USE hr_db;


-- 1.
SELECT CONCAT(FIRST_NAME, ' ', LAST_NAME) AS NAME, SALARY FROM employees
WHERE SALARY >
(
	SELECT SALARY FROM employees
    WHERE LAST_NAME = 'Bull'
);

-- 2.
SELECT FIRST_NAME, LAST_NAME FROM employees
WHERE DEPARTMENT_ID =
(
	SELECT DEPARTMENT_ID FROM departments
    WHERE DEPARTMENT_NAME = 'IT'
);

-- 3.
-- Pass: There are only manager ids but there is no table assigning names to these codes.

-- 4.
SELECT  FIRST_NAME, LAST_NAME, SALARY FROM employees
WHERE SALARY >
(
	SELECT AVG(SALARY) FROM employees
);

-- 5.
SELECT FIRST_NAME, LAST_NAME, SALARY FROM employees
WHERE SALARY =
(
	SELECT MIN_SALARY FROM jobs
    WHERE JOB_ID = employees.JOB_ID -- who would have known: employees is visible from this scope -- F*CK!!!
);

-- 6.
SELECT FIRST_NAME, LAST_NAME, SALARY, DEPARTMENT_ID FROM employees as a
WHERE SALARY =
(
	SELECT MIN(b.SALARY) FROM employees as b
    WHERE b.DEPARTMENT_ID = a.DEPARTMENT_ID
);

-- 7. -- What do you mean by: 'Result of a SELECT can be a selected field'?
SELECT emp.EMPLOYEE_ID, emp.FIRST_NAME, emp.LAST_NAME, dep.DEPARTMENT_NAME
FROM employees AS emp, departments AS dep
WHERE emp.DEPARTMENT_ID = dep.DEPARTMENT_ID;

-- 8. -- How do you mean: 'Result of a SELECT can be a set where you can select'?
SELECT * FROM locations
ORDER BY LOCATION_ID DESC
LIMIT 10; -- ac. to StackOverflow


-- 3. -- Assuming those employees are manager whose EMPLOYEE_ID is in column MANAGER_ID -- something wrong
SELECT FIRST_NAME, LAST_NAME FROM employees AS a
WHERE
(
	SELECT COUNT(b.MANAGER_ID) FROM employees AS b
    WHERE b.MANAGER_ID = a.MANAGER_ID
)
> 0; -- Semantic error: 'Diana Lorentz' has the EMPLOYEE_ID = 107 which is not in column MANAGER_ID -- too many rows returned
