USE hr_db;


-- 1.
SELECT DEPARTMENT_NAME, LOCATION_ID, STREET_ADDRESS, CITY, STATE_PROVINCE, COUNTRY_NAME FROM departments NATURAL JOIN locations NATURAL JOIN countries;

-- 2.
SELECT FIRST_NAME, LAST_NAME, DEPARTMENT_ID, DEPARTMENT_NAME FROM employees NATURAL JOIN departments;

-- 3. -- something went wrong...
SELECT FIRST_NAME, LAST_NAME, JOB_TITLE, DEPARTMENT_ID, DEPARTMENT_NAME
FROM employees NATURAL JOIN departments NATURAL JOIN jobs;  -- 32 rows returned instead of COUNT(*) FROM employees = 107? WTF?!

-- 4. -- something must be wrong
SELECT DEPARTMENT_NAME, COUNT(EMPLOYEE_ID)
FROM departments NATURAL JOIN employees
GROUP BY DEPARTMENT_ID;  -- number of rows != COUNT(*) FROM departments as sum of CPUNT(EMPLOYEE_ID) doesn't seem to be COUNT(*) FROM employees = 107 either. WTF?!

-- 5. -- How is it connected to NATURAL (or any kind of) JOIN?
SELECT FIRST_NAME, LAST_NAME, HIRE_DATE FROM employees
WHERE HIRE_DATE >
(
	SELECT HIRE_DATE FROM employees
    WHERE LAST_NAME = 'Jones'
);

-- 3. -- with explicite INNER JOIN
SELECT emps.FIRST_NAME, emps.LAST_NAME, jobs.JOB_TITLE, deps.DEPARTMENT_NAME
FROM employees AS emps
LEFT JOIN jobs ON emps.JOB_ID = jobs.JOB_ID
LEFT JOIN departments AS deps ON emps.DEPARTMENT_ID = deps.DEPARTMENT_ID
LEFT JOIN locations ON deps.LOCATION_ID = locations.LOCATION_ID;

SELECT COUNT(*)
FROM employees AS emps
INNER JOIN jobs ON emps.JOB_ID = jobs.JOB_ID
LEFT JOIN departments AS deps ON emps.DEPARTMENT_ID = deps.DEPARTMENT_ID
INNER JOIN locations ON deps.LOCATION_ID = locations.LOCATION_ID;

SELECT COUNT(*) FROM employees;

SELECT emps.FIRST_NAME, emps.LAST_NAME, jobs.JOB_TITLE, deps.DEPARTMENT_NAME FROM
employees AS emps NATURAL JOIN jobs NATURAL JOIN departments AS deps NATURAL JOIN locations;

SELECT COUNT(*) FROM
employees AS emps NATURAL JOIN jobs NATURAL JOIN departments AS deps NATURAL JOIN locations;
