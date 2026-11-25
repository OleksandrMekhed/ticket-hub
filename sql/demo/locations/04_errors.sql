USE TicketDB;

-- locations ===========================================================================================================
-- ERROR - 1062, duplicate location at the same name and city (UNIQUE name, city)
SELECT l.location_id, l.name, l.city, l.address
FROM locations AS l;
INSERT INTO locations (name, city, address)
VALUES ('Malmo Live', 'Malmo', 'Test');

-- ERROR - 1451, cannot delete a location that has events FOREIGN KEY in events - ON DELETE RESTRICT
SELECT l.location_id, l.name, e.event_id, e.title
FROM locations AS l
JOIN events AS e ON l.location_id = e.location_id
WHERE l.location_id = 1;
DELETE FROM locations
WHERE location_id = 1;

-- ERROR - 1048,  cannot insert NULL into required column name
SELECT l.location_id, l.name, l.city, l.address
FROM locations AS l;
INSERT INTO locations (name, city, address)
VALUES (NULL, 'Test City', 'Test Address');