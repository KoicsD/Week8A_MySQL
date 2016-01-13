USE hr_db;


-- original table of countries:
SELECT * FROM countries;
SELECT COUNT(*) FROM countries;  -- 25

-- original table of regions:
SELECT * FROM regions;
SELECT COUNT(*) FROM regions;  -- 4

-- NATURAL JOIN of them:
SELECT * FROM countries NATURAL JOIN regions;
SELECT COUNT(*) FROM countries NATURAL JOIN regions;  -- 25
