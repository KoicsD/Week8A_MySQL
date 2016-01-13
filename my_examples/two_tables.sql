USE hr_db;

SELECT * FROM countries;
SELECT * FROM regions;
SELECT countries.*, regions.* FROM countries, regions;
SELECT countries.*, regions.* FROM countries, regions
WHERE countries.REGION_ID = regions.REGION_ID;
