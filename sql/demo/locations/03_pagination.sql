USE TicketDB;

-- locations ===========================================================================================================
-- Page 1
SELECT l.location_id, l.name, l.city, l.address
FROM locations AS l
ORDER BY l.location_id ASC, l.name ASC
LIMIT 3 OFFSET 0;

-- Page 2
SELECT l.location_id, l.name, l.city, l.address
FROM locations AS l
ORDER BY l.location_id ASC, l.name ASC
LIMIT 3 OFFSET 3;

-- Count total pages of locations
SELECT COUNT(*) AS total_locations,
       CEIL(COUNT(*) / 3.0) AS total_pages
FROM locations;