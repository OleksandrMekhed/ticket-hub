USE TicketDB;

-- locations ===========================================================================================================
-- City start with 'Got'
SELECT l.location_id, l.name, l.city, l.address
FROM locations AS l
WHERE l.city LIKE 'Got%';

-- Address ends with '20'
SELECT l.location_id, l.name, l.city, l.address
FROM locations AS l
WHERE l.address LIKE '%20';

-- Name contain 'taden'
SELECT l.location_id, l.name, l.city, l.address
FROM locations AS l
WHERE l.name LIKE '%taden%';

-- Name does not start with 'Filmstaden%' and order by ID DESC
SELECT l.location_id, l.name, l.city, l.address
FROM locations AS l
WHERE l.name NOT LIKE 'Filmstaden%'
ORDER BY l.location_id DESC ;

-- Filter by address and city
SELECT l.location_id, l.name, l.city, l.address
FROM locations AS l
WHERE l.address = 'Skansgatan 2' AND l.city = 'Gothenburg';

-- Filter by name OR address
SELECT l.location_id, l.name, l.city, l.address
FROM locations AS l
WHERE l.name = 'Malmo Live' OR l.address = 'Globentorget 2';

-- Order by city and name ASC
SELECT l.location_id, l.name, l.city, l.address
FROM locations AS l
ORDER BY l.city ASC, l.name ASC ;

-- Order by ID DESC
SELECT l.location_id, l.name, l.city, l.address
FROM locations AS l
ORDER BY l.location_id DESC ;