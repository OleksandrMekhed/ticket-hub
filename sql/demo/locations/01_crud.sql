USE TicketDB;


-- locations ===========================================================================================================

-- All locations
SELECT l.location_id, l.name, l.city, l.address
FROM locations AS l;

-- Add new location
SELECT l.location_id, l.name, l.city, l.address
FROM locations AS l;
INSERT INTO locations (name, city, address)
VALUES ('Test Name', 'Test City', 'Test Address');
SELECT l.location_id, l.name, l.city, l.address
FROM locations AS l;

-- Update location
SELECT l.location_id, l.name, l.city, l.address
FROM locations AS l;
UPDATE locations AS l
SET name = 'New Test Update'
WHERE l.name = 'Test Name' AND l.city = 'Test City';
SELECT l.location_id, l.name, l.city, l.address
FROM locations AS l;


-- Get 'Malmo' location
SELECT l.location_id, l.name, l.city, l.address
FROM locations AS l
WHERE l.city = 'Malmo';

-- Delete location
SELECT l.location_id, l.name, l.city, l.address
FROM locations AS l
WHERE name = 'New Test Update' AND city = 'Test City';
DELETE FROM locations AS l
WHERE name = 'New Test Update' AND city = 'Test City';
SELECT l.location_id, l.name, l.city, l.address
FROM locations AS l;