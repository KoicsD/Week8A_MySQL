USE hr_db;
INSERT INTO countries VALUES ('MC', 'My Country', 5);
INSERT INTO regions VALUES (6, 'My Region');


-- original tables and their counts:
SELECT * FROM countries;
SELECT COUNT(COUNTRY_ID) FROM countries;
SELECT * FROM regions;
SELECT COUNT(REGION_ID) FROM regions;

-- without JOIN: -- everything coupled to everything, like Cartesian produnct in math, primary orde inherited from left
SELECT countries.*, regions.* FROM countries, regions;
SELECT COUNT(countries.COUNTRY_ID), COUNT(regions.REGION_ID) FROM countries, regions;

-- simple JOIN:  -- the same as without JOIN, it seems to use JOIN even implicitely
SELECT countries.*, regions.* FROM countries JOIN regions;
SELECT COUNT(countries.COUNTRY_ID), COUNT(regions.REGION_ID) FROM countries JOIN regions;

-- NATURAL JOIN:  -- automatic filter on fields with same name: records passes with the same value -- this is natural
SELECT countries.*, regions.* FROM countries NATURAL JOIN regions;
SELECT COUNT(countries.COUNTRY_ID), COUNT(regions.REGION_ID) FROM countries NATURAL JOIN regions;

-- INNER JOIN:  -- the same as without JOIN or with simple JOIN -- this must be the default
SELECT countries.*, regions.* FROM countries INNER JOIN regions;
SELECT COUNT(countries.COUNTRY_ID), COUNT(regions.REGION_ID) FROM countries INNER JOIN regions;

-- LEFT JOIN:  -- Error 1064: invalid syntax
SELECT countries.*, regions.* FROM countries LEFT JOIN regions;
SELECT COUNT(countries.COUNTRY_ID), COUNT(regions.REGION_ID) FROM countries LEFT JOIN regions;

-- RIGHT JOIN:  -- Error 1064: invalid syntax
SELECT countries.*, regions.* FROM countries RIGHT JOIN regions;
SELECT COUNT(countries.COUNTRY_ID), COUNT(regions.REGION_ID) FROM countries RIGHT JOIN regions;

-- OUTER JOIN:  -- Error 1064: invalid syntax
SELECT countries.*, regions.* FROM countries OUTER JOIN regions;
SELECT COUNT(countries.COUNTRY_ID), COUNT(regions.REGION_ID) FROM countries OUTER JOIN regions;

-- FULL JOIN:  -- Error 1051: left table unknown
SELECT countries.*, regions.* FROM countries FULL JOIN regions;
SELECT COUNT(countries.COUNTRY_ID), COUNT(regions.REGION_ID) FROM countries FULL JOIN regions;
-- ac. to SQLGuides it's the same as OUTER JOIN but ac. to StackOverflow MySQL does not support them

-- STRAIGHT_JOIN:  -- the same as INNER JOIN but primary order is inherited from right table instead of left table
SELECT countries.*, regions.* FROM countries STRAIGHT_JOIN regions;
SELECT COUNT(countries.COUNTRY_ID), COUNT(regions.REGION_ID) FROM countries STRAIGHT_JOIN regions;

-- CROSS JOIN:  -- the same as INNER JOIN
SELECT countries.*, regions.* FROM countries CROSS JOIN regions;
SELECT COUNT(countries.COUNTRY_ID), COUNT(regions.REGION_ID) FROM countries CROSS JOIN regions;


-- this has no sense
-- what if use ON clause?

-- without JOIN: -- Error 1064: invalid syntax
SELECT countries.*, regions.* FROM countries, regions
ON countries.REGION_ID = regions.REGION_ID;
SELECT COUNT(countries.COUNTRY_ID), COUNT(regions.REGION_ID) FROM countries, regions
ON countries.REGION_ID = regions.REGION_ID;

-- WHERE fixes syntax error, effect is common with NATURAL JOIN
SELECT countries.*, regions.* FROM countries, regions
WHERE countries.REGION_ID = regions.REGION_ID;
SELECT COUNT(countries.COUNTRY_ID), COUNT(regions.REGION_ID) FROM countries, regions
WHERE countries.REGION_ID = regions.REGION_ID;

-- simple JOIN: -- the same as the above NATURAL JOIN
SELECT countries.*, regions.* FROM countries JOIN regions
ON countries.REGION_ID = regions.REGION_ID;
SELECT COUNT(countries.COUNTRY_ID), COUNT(regions.REGION_ID) FROM countries JOIN regions
ON countries.REGION_ID = regions.REGION_ID; -- conclusion: NATURAL JOIN is equivalent with JOIN ON left.COMMON_FIELD = right.COMMON_FIELD)

-- NATURAL JOIN:  -- Error 1064: invalid syntax
SELECT countries.*, regions.* FROM countries NATURAL JOIN regions
ON countries.REGION_ID = regions.REGION_ID;
SELECT COUNT(countries.COUNTRY_ID), COUNT(regions.REGION_ID) FROM countries NATURAL JOIN regions
ON countries.REGION_ID = regions.REGION_ID;

-- INNER JOIN:  -- the same as with simple JOIN -- this is definitelly be the default
SELECT countries.*, regions.* FROM countries INNER JOIN regions
ON countries.REGION_ID = regions.REGION_ID;
SELECT COUNT(countries.COUNTRY_ID), COUNT(regions.REGION_ID) FROM countries INNER JOIN regions
ON countries.REGION_ID = regions.REGION_ID;

-- LEFT JOIN:  -- similar to INNER JOIN but keeps the uncoupled elements from left, completed with NULL
SELECT countries.*, regions.* FROM countries LEFT JOIN regions
ON countries.REGION_ID = regions.REGION_ID;
SELECT COUNT(countries.COUNTRY_ID), COUNT(regions.REGION_ID) FROM countries LEFT JOIN regions
ON countries.REGION_ID = regions.REGION_ID;

-- RIGHT JOIN:  -- similar to INNER JOIN but keeps the uncoupled elements from right, completed with NULL
SELECT countries.*, regions.* FROM countries RIGHT JOIN regions
ON countries.REGION_ID = regions.REGION_ID;
SELECT COUNT(countries.COUNTRY_ID), COUNT(regions.REGION_ID) FROM countries RIGHT JOIN regions
ON countries.REGION_ID = regions.REGION_ID;

-- OUTER JOIN:  -- Error 1064: invalid syntax
SELECT countries.*, regions.* FROM countries OUTER JOIN regions
ON countries.REGION_ID = regions.REGION_ID;
SELECT COUNT(countries.COUNTRY_ID), COUNT(regions.REGION_ID) FROM countries OUTER JOIN regions
ON countries.REGION_ID = regions.REGION_ID;

-- FULL JOIN:  -- Error 1051: left table unknown
SELECT countries.*, regions.* FROM countries FULL JOIN regions
ON countries.REGION_ID = regions.REGION_ID;
SELECT COUNT(countries.COUNTRY_ID), COUNT(regions.REGION_ID) FROM countries FULL JOIN regions
ON countries.REGION_ID = regions.REGION_ID;

-- STRAIGHT_JOIN:  -- the same as INNER JOIN but primary order is inherited from right table instead of left table
SELECT countries.*, regions.* FROM countries STRAIGHT_JOIN regions;
SELECT COUNT(countries.COUNTRY_ID), COUNT(regions.REGION_ID) FROM countries STRAIGHT_JOIN regions;

-- STRAIGHT_JOIN:  -- cannot be seen any difference between this and INNER JOIN
SELECT countries.*, regions.* FROM countries STRAIGHT_JOIN regions
ON countries.REGION_ID = regions.REGION_ID;
SELECT COUNT(countries.COUNTRY_ID), COUNT(regions.REGION_ID) FROM countries STRAIGHT_JOIN regions
ON countries.REGION_ID = regions.REGION_ID; -- ac. to StackOverflow its a non-optimized version of (INNER) JOIN

-- CROSS JOIN:  -- cannot be seen any difference between this and INNER JOIN
SELECT countries.*, regions.* FROM countries CROSS JOIN regions
ON countries.REGION_ID = regions.REGION_ID;
SELECT COUNT(countries.COUNTRY_ID), COUNT(regions.REGION_ID) FROM countries CROSS JOIN regions
ON countries.REGION_ID = regions.REGION_ID; -- ac. to W3Source its the official way to create cartesian product, in MySQL it's the same as (INNER) JOIN
