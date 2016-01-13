USE hr_db;


-- 1.
SELECT jobs.JOB_TITLE, COUNT(employees.EMPLOYEE_ID) AS COUNT FROM employees, jobs
WHERE jobs.JOB_ID = employees.JOB_ID
GROUP BY employees.JOB_ID;

-- with (INNER) JOIN
SELECT jobs.JOB_TITLE, COUNT(employees.EMPLOYEE_ID) AS COUNT FROM employees JOIN jobs
ON jobs.JOB_ID = employees.JOB_ID
GROUP BY employees.JOB_ID;

-- with NATURAL JOIN
SELECT jobs.JOB_TITLE, COUNT(employees.EMPLOYEE_ID) AS COUNT FROM employees NATURAL JOIN jobs
GROUP BY employees.JOB_ID;

-- 2.
SELECT MANAGER_ID, MIN(SALARY) AS LOWEST_SALARY FROM employees
GROUP BY MANAGER_ID;

-- 3.
SELECT DEPARTMENT_ID, SUM(SALARY) FROM employees
GROUP BY DEPARTMENT_ID;

-- DEPARTMENT_NAME instead of DEPARTMENT_ID
SELECT dep.DEPARTMENT_NAME, SUM(emp.SALARY) AS TOTAL_SALARY FROM employees AS emp, departments AS dep
WHERE dep.DEPARTMENT_ID = emp.DEPARTMENT_ID
GROUP BY dep.DEPARTMENT_ID;

-- 4.
SELECT employees.JOB_ID, AVG(employees.SALARY) AS AVG_SALARY FROM employees, jobs
WHERE employees.JOB_ID = jobs.JOB_ID
AND jobs.JOB_TITLE != 'Programmer'
GROUP BY employees.JOB_ID;

-- with NATURAL JOIN
SELECT employees.JOB_ID, AVG(employees.SALARY) AS AVG_SALARY FROM employees NATURAL JOIN jobs
WHERE jobs.JOB_TITLE != 'Programmer'
GROUP BY employees.JOB_ID;

-- 5.
SELECT JOB_ID, MAX(SALARY) FROM employees
GROUP BY JOB_ID
HAVING MAX(SALARY) >= 4000;

-- 6.
SELECT departments.DEPARTMENT_NAME, AVG(employees.SALARY) AS AVG_SALARY FROM departments, employees
WHERE departments.DEPARTMENT_ID = employees.DEPARTMENT_ID
GROUP BY employees.DEPARTMENT_ID
HAVING COUNT(employees.EMPLOYEE_ID) > 10;

-- with (INNER) JOIN (NATURAL JOIN has troubles here)
SELECT departments.DEPARTMENT_NAME, AVG(employees.SALARY) AS AVG_SALARY FROM departments JOIN employees
ON departments.DEPARTMENT_ID = employees.DEPARTMENT_ID
GROUP BY employees.DEPARTMENT_ID
HAVING COUNT(employees.EMPLOYEE_ID) > 10;
