Note: I have not presented my solution to mentors yet.

## What I've Done

### Extra Points:

* In case of [*Restricting and Sorting*](description.md#3) task, I was able to solve no. 4 only with subquerry or *JOIN*.
  I've tryed it both with *INNER* and *NATURAL JOIN*.
* In case of [*Aggregate Functions*](description.md#4):
  * at no. 1 I've tryed both *INNER* and *NATURAL JOIN* to display the *JOB_TITLE* instead of *JOB_ID*
  * at no. 3 I've joined 2 tables to display *DEPARTMENT_NAME* instead of *DEPARTMENT_ID*
  * at no. 4 I've joined 2 tables to filter on *JOB_TITLE*
  * at no. 6 I've joined 2 tables to display *DEPARTMENT_NAME* instead of *DEPARTMENT_ID*

### Incopletions:

* In case of [*Subqueries*](description.md#5):
  * at no. 3 querry returns too much rows
  * at no. 7-8 I cannot understand hint *"Result of a SELECT can be a selected field"*
* In case of [*JOINS*](description.md#6):
  * at no. 5 I cannot use any kind of *JOIN*, I used subquerry
  * at no. 3 neither *NATURAL JOIN*, nor *INNER JOIN* returns the appropriate rows  
    Actually, *NATURAL JOIN* always seems to misunderstand me in ambiguous cases.

### A Question:
* In case of [*Subqueries*](description.md#5) at no. 5  
  what should I do if I want to find the employees earning the least
  (ie. aggregate function *MIN(SALARY)*, **not** *MIN_SALARY FROM jobs*)
  for each job?

----------------------------

## What I've Learnt

### Features I've Got Acquainted to:

* keyword *KEY* renames fields and is used instead of keyword *FOREIGN KEY*
* pair of fields as *PRIMARY KEY*
* string-functions:
  * [*REVERSE*](http://www.w3resource.com/mysql/string-functions/mysql-reverse-function.php)
  * [*SUBSTR*](http://www.w3resource.com/mysql/string-functions/mysql-substr-function.php)
  * [*LENGTH*](http://www.w3resource.com/mysql/string-functions/mysql-length-function.php)
  * [*CONCAT*](http://www.w3resource.com/mysql/string-functions/mysql-concat-function.php)
  * [*LOWER*](http://www.w3resource.com/mysql/string-functions/mysql-lower-function.php),
    [*UPPER*](http://www.w3resource.com/mysql/string-functions/mysql-upper-function.php)
* different [JOIN commands](http://www.w3resource.com/mysql/advance-query-in-mysql/mysql-natural-join.php):
  * *(INNER) JOIN*  
    Returns the joined records that passes the filter specified by *ON* clause.
    Returns the 'Cartesian' product of tables if *ON* clause is omitted.
  * *LEFT JOIN*  
    Returns the joined records passing the filter specified by *ON* clause
    but also returns the unjoined records from left table, completed with *NULL*.
    *ON* clause cannot be omitted.
  * *RIGHT JOIN*  
    Returns the joined records passing the filter specified by *ON* clause
    but also returns the unjoined records from right table, completed with *NULL*.
    *ON* clause cannot be omitted.
  * *FULL/OUTER JOIN*  
    In standard *SQL*, it returns both the joined records passing the filter
    and the unjoined records from both table.
    Unfortunatelly *MySQL* does not support it.
  * *CROSS JOIN*  
    This is the official way to create 'Cartesian' product of tables.
    In standard *SQL*, it cannot be used with *ON* clause.
    However, in *MySQL* there is no difference between it and *(INNER) JOIN*.
  * *NATURAL JOIN*  
    It returns the joined records where the common field has common values.
  * *STRAIGHT_JOIN*  
    This is similar to *(INNER) JOIN* but is based on 2 loops in each other
    instead of the optimizer.

### My Conclusion:

I'm happy to know these features of *MySQL*.
I have to note that writting this file was quite difficult for me,
which reinforces my surmise that my sense of finding the importance needs some development.
Perhaps I can tell you more after I've presented my work.
