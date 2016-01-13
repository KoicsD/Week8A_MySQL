USE hr_db;


-- SELECT * FROM countries;
SELECT COUNT(COUNTRY_ID) FROM countries;

-- SELECT * FROM regions;
SELECT COUNT(REGION_ID) FROM regions;

-- SELECT countries.*, regions.* FROM countries, regions;
SELECT COUNT(countries.COUNTRY_ID), COUNT(regions.REGION_ID) FROM countries, regions;

-- SELECT countries.*, regions.* FROM countries, regions WHERE countries.REGION_ID = regions.REGION_ID;
SELECT COUNT(countries.COUNTRY_ID), COUNT(regions.REGION_ID) FROM countries, regions
WHERE countries.REGION_ID = regions.REGION_ID;

-- the same with having
SELECT COUNT(countries.COUNTRY_ID), COUNT(regions.REGION_ID) FROM countries, regions
HAVING countries.REGION_ID = regions.REGION_ID; -- Error 1054: Unknown column countries.REGION_ID in having clause
