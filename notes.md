what is new for me:

* keyword *KEY* renames fields and is used instead of keyword *FOREIGN KEY*
* pair of fields as *PRIMARY KEY*
* what does *IX* mean ac. to the logic of this db?
* LIMIT (OFFSET)
* string-functions:
  * [*REVERSE*](http://www.w3resource.com/mysql/string-functions/mysql-reverse-function.php)
  * [*SUBSTR(ING)*](http://www.w3resource.com/mysql/string-functions/mysql-substr-function.php)
  * [*LENGTH*](http://www.w3resource.com/mysql/string-functions/mysql-length-function.php)
  * LOWER, UPPER

what is pseudonew:

* *DISTINCT*

difficult questions for me:

* what if we SELECT from 2 different tables?  
  answer: 'Cartesian' product of tables  
  see: [two_tables.sql](my_examples/two_tables.sql)
* what happens when combining the above example with aggregate functions?  
  answer: agggregate functions works 'Cartesian' product tables  
  see: [two_tables_with_aggregate.sql](my_examples/two_tables_with_aggregate.sql)
* what if a subquerry returns more than one records?
* what if I want to find the employees earning the least
  (ie. aggregate function *MIN(SALARY)*, **not** *MIN_SALARY FROM jobs*) from their job
  for each job?
* what are the differences between different types of JOIN commands?
  see: [joins.sql](my_examples/joins.sql),
       http://www.w3resource.com/mysql/advance-query-in-mysql/mysql-natural-join.php  
  answer:
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
  * Nothing, just commas  
    This also produces 'Cartesian' product, but you cannot use *ON* clause,
    you can only filter by *WHERE* clause.
* sometimes *NATURAL JOIN* returns more rows than I expect  
  What can be the reason?

A good link:  
http://www.tutorialspoint.com/mysql/
