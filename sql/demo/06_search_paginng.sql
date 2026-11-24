USE TicketDB;

-- =====================================================================================================================
-- Search, sorting and pagination.
-- Sections: categories, locations, events, tickets, users
-- WHERE + LIKE / NOT LIKE, BETWEEN, IN, AND / OR, ORDER BY (one and two columns), LIMIT + OFFSET (pagination), COUNT + CEIL (number of pages)
-- =====================================================================================================================

-- categories ==========================================================================================================

-- Name start with 'The'
SELECT c.category_id, c.name
FROM categories AS c
WHERE c.name LIKE 'The%';

-- Name contains '%n%'
SELECT c.category_id, c.name
FROM categories AS c
WHERE c.name LIKE '%n%';

-- Name ends with '%rt'
SELECT c.category_id, c.name
FROM categories AS c
WHERE c.name LIKE '%rt';

-- Name does not start with '%C%' and order by ID DESC
SELECT c.category_id, c.name
FROM categories AS c
WHERE c.name NOT LIKE 'C%'
ORDER BY c.category_id DESC ;

-- Order by name Desc
SELECT c.category_id, c.name
FROM categories AS c
ORDER BY c.name DESC ;

-- Order by ID ASC
SELECT c.category_id, c.name
FROM categories AS c
ORDER BY c.category_id ASC ;

-- Page 1 (first 2 categories)
SELECT c.category_id, c.name
FROM categories AS c
ORDER BY c.name ASC, c.category_id ASC
LIMIT 2 OFFSET 0;

-- Page 2 (next 2 categories)
SELECT c.category_id, c.name
FROM categories AS c
ORDER BY c.name ASC, c.category_id ASC
LIMIT 2 OFFSET 2;

-- Count total pages of categories
SELECT COUNT(*) AS total_categories,
       CEIL(COUNT(*) / 2.0) AS total_pages
FROM categories;

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

-- Page 3
SELECT l.location_id, l.name, l.city, l.address
FROM locations AS l
ORDER BY l.location_id ASC, l.name ASC
LIMIT 3 OFFSET 6;

-- Count total pages of locations
SELECT COUNT(*) AS total_locations,
       CEIL(COUNT(*) / 3.0) AS total_pages
FROM locations;

-- events ==============================================================================================================

-- Title contain '%Batman%'
SELECT e.event_id, e.category_id, e.location_id, e.title, e.starts_at, e.price
FROM events AS e
WHERE e.title LIKE '%Batman%';

-- Title does not contain '%Dune%'
SELECT e.event_id, e.category_id, e.location_id, e.title, e.starts_at, e.price
FROM events AS e
WHERE e.title NOT LIKE '%Dune%';

-- Filter by price BETWEEN 100 and 300
SELECT e.event_id, e.category_id, e.location_id, e.title, e.starts_at, e.price
FROM events AS e
WHERE e.price BETWEEN 100.00 AND 300.00;

-- Filter by price less than or equal to 150
SELECT e.event_id, e.category_id, e.location_id, e.title, e.starts_at, e.price
FROM events AS e
WHERE e.price <= 150.00;

-- Filter by price more than or equal to 200
SELECT e.event_id, e.category_id, e.location_id, e.title, e.starts_at, e.price
FROM events AS e
WHERE e.price >= 200.00;

-- Filter by starts_at
SELECT e.event_id, e.category_id, e.location_id, e.title, e.starts_at, e.price
FROM events AS e
WHERE e.starts_at >= '2026-12-01 00:00:00'
  AND e.starts_at < '2026-12-06 00:00:00';

-- Filter by category ID = 1
SELECT e.event_id, e.category_id, e.location_id, e.title, e.starts_at, e.price
FROM events AS e
WHERE e.category_id = 1;

-- Filter by category ID 1 and 2
SELECT e.event_id, e.category_id, e.location_id, e.title, e.starts_at, e.price
FROM events AS e
WHERE e.category_id IN (1, 2);

-- Combined filters category ID and price
SELECT e.event_id, e.category_id, e.location_id, e.title, e.starts_at, e.price
FROM events AS e
WHERE e.category_id = 1
  AND e.price <= 115.00;

-- Filter by location ID 1 or 2
SELECT e.event_id, e.category_id, e.location_id, e.title, e.starts_at, e.price
FROM events AS e
WHERE e.location_id = 1
   OR e.location_id = 2;

-- Sorting start time and event ID ASC
SELECT e.event_id, e.category_id, e.location_id, e.title, e.starts_at, e.price
FROM events AS e
ORDER BY e.starts_at ASC, e.event_id ASC;

-- Sorting order by price DESC and event ID ASC
SELECT e.event_id, e.category_id, e.location_id, e.title, e.starts_at, e.price
FROM events AS e
ORDER BY e.price DESC, e.event_id ASC;

-- Sorting order by title and event ID ASC
SELECT e.event_id, e.category_id, e.location_id, e.title, e.starts_at, e.price
FROM events AS e
ORDER BY e.title ASC, e.event_id ASC;

--  Page 1
SELECT e.event_id, e.category_id, e.location_id, e.title, e.starts_at, e.price
FROM events AS e
ORDER BY e.starts_at ASC, e.event_id ASC
LIMIT 3 OFFSET 0;

-- Page 2
SELECT e.event_id, e.category_id, e.location_id, e.title, e.starts_at, e.price
FROM events AS e
ORDER BY e.starts_at ASC, e.event_id ASC
LIMIT 3 OFFSET 3;

-- Page 3
SELECT e.event_id, e.category_id, e.location_id, e.title, e.starts_at, e.price
FROM events AS e
ORDER BY e.starts_at ASC, e.event_id ASC
LIMIT 3 OFFSET 6;

-- Page 4
SELECT e.event_id, e.category_id, e.location_id, e.title, e.starts_at, e.price
FROM events AS e
ORDER BY e.starts_at ASC, e.event_id ASC
LIMIT 3 OFFSET 9;

-- Count total pages of event
SELECT COUNT(*) AS total_events,
       CEIL(COUNT(*) / 3.0) AS total_pages
FROM events;

-- Search + filter + sort + page together
SELECT e.event_id, e.title, e.starts_at, e.price
FROM events AS e
WHERE e.title LIKE '%o%'
  AND e.price BETWEEN 100.00 AND 500.00
  AND e.starts_at >= '2026-12-01 00:00:00'
ORDER BY e.price ASC, e.event_id ASC
LIMIT 3 OFFSET 0;


-- users ===============================================================================================================
-- Name ends with "son"
SELECT u.user_id, u.full_name, u.email
FROM users AS u
WHERE u.full_name LIKE '%son';

-- Name start with 'Anna%'
SELECT u.user_id, u.full_name, u.email
FROM users AS u
WHERE u.full_name LIKE 'Anna%';

-- Name does not contain '%ia%'
SELECT u.user_id, u.full_name, u.email
FROM users AS u
WHERE u.full_name NOT LIKE '%ia%';

-- Email contain '%son%'
SELECT u.user_id, u.full_name, u.email
FROM users AS u
WHERE u.email LIKE '%son%';

-- Filtering by name and email
SELECT u.user_id, u.full_name, u.email
FROM users AS u
WHERE u.full_name = 'Oscar Berg' AND u.email = 'oscar.berg@example.com';

-- Order by ID DESC
SELECT u.user_id, u.full_name, u.email
FROM users AS u
ORDER BY u.user_id DESC ;

-- Order by name and user ID ASC
SELECT u.user_id, u.full_name, u.email
FROM users AS u
ORDER BY u.full_name ASC, u.user_id ASC;

-- Only some users, picked by id
SELECT u.user_id, u.full_name
FROM users AS u
WHERE u.user_id IN (3, 5, 10);

-- TRIM removes spaces at the start and end of a text
SELECT u.full_name AS original_name,
       TRIM(u.full_name) AS clean_name
FROM users AS u
WHERE u.user_id = 9;

-- CONCAT glues several values into one text, example - "Anna Lindqvist (#1)"
SELECT CONCAT(u.full_name, ' (#', u.user_id, ')') AS user_label
FROM users AS u
ORDER BY u.user_id ASC;

-- Page 1
SELECT u.user_id, u.full_name, u.email
FROM users AS u
ORDER BY u.user_id ASC, u.full_name ASC
LIMIT 3 OFFSET 0;

-- Page 2
SELECT u.user_id, u.full_name, u.email
FROM users AS u
ORDER BY u.user_id ASC, u.full_name ASC
LIMIT 3 OFFSET 3;

-- Page 3
SELECT u.user_id, u.full_name, u.email
FROM users AS u
ORDER BY u.user_id ASC, u.full_name ASC
LIMIT 3 OFFSET 6;

-- Page 4
SELECT u.user_id, u.full_name, u.email
FROM users AS u
ORDER BY u.user_id ASC, u.full_name ASC
LIMIT 3 OFFSET 9;

-- Count page of users
SELECT COUNT(*) AS total_users,
       CEIL(COUNT(*) / 3.0) AS total_pages
FROM users;

-- Search + filter + sort + page together
SELECT u.user_id, u.full_name, u.email
FROM users AS u
WHERE u.full_name LIKE '%son%'
ORDER BY u.user_id ASC, u.full_name ASC
LIMIT 3 OFFSET 0;

-- tickets =============================================================================================================

-- Seat in row A
SELECT t.ticket_id, t.user_id, t.event_id, t.seat_label, t.price
FROM tickets AS t
WHERE t.seat_label LIKE 'A%';

-- Seat in row B
SELECT t.ticket_id, t.user_id, t.event_id, t.seat_label, t.price
FROM tickets AS t
WHERE t.seat_label LIKE 'B%';

-- Seat is not in row A
SELECT t.ticket_id, t.user_id, t.event_id, t.seat_label, t.price
FROM tickets AS t
WHERE t.seat_label NOT LIKE 'A%';

-- Price BETWEEN 100 and 400
SELECT t.ticket_id, t.user_id, t.event_id, t.seat_label, t.price
FROM tickets AS t
WHERE t.price BETWEEN 100.00 AND 400.00;

-- Price more that or equal to 400
SELECT t.ticket_id, t.user_id, t.event_id, t.seat_label, t.price
FROM tickets AS t
WHERE t.price >= 400.00;

-- Tickets of users 1 and 2
SELECT t.ticket_id, t.user_id, t.event_id, t.seat_label, t.price
FROM tickets AS t
WHERE t.user_id IN (1, 2);

-- Tickets for event 1
SELECT t.ticket_id, t.user_id, t.event_id, t.seat_label, t.price
FROM tickets AS t
WHERE t.event_id = 1;

-- Order by price DESC, ticket ID ASC
SELECT t.ticket_id, t.user_id, t.event_id, t.seat_label, t.price
FROM tickets AS t
ORDER BY t.price DESC, t.ticket_id ASC;

-- Order by seat label and ticket ID ASC
SELECT t.ticket_id, t.user_id, t.event_id, t.seat_label, t.price
FROM tickets AS t
ORDER BY t.seat_label ASC, t.ticket_id ASC;

-- Tickets with user name and event title - JOIN + filter + sort
SELECT t.ticket_id, u.full_name AS user_name, e.title AS event_title, t.seat_label, t.price
FROM tickets AS t
JOIN users AS u ON u.user_id = t.user_id
JOIN events AS e ON e.event_id = t.event_id
WHERE t.event_id = 1
ORDER BY t.seat_label ASC, t.ticket_id ASC;

-- Page 1
SELECT t.ticket_id, t.user_id, t.event_id, t.seat_label, t.price
FROM tickets AS t
ORDER BY t.price ASC, t.ticket_id ASC
LIMIT 5 OFFSET 0;

-- Page 2
SELECT t.ticket_id, t.user_id, t.event_id, t.seat_label, t.price
FROM tickets AS t
ORDER BY t.price ASC, t.ticket_id ASC
LIMIT 5 OFFSET 5;

-- Page 3
SELECT t.ticket_id, t.user_id, t.event_id, t.seat_label, t.price
FROM tickets AS t
ORDER BY t.price ASC, t.ticket_id ASC
LIMIT 5 OFFSET 10;

-- Page 4
SELECT t.ticket_id, t.user_id, t.event_id, t.seat_label, t.price
FROM tickets AS t
ORDER BY t.price ASC, t.ticket_id ASC
LIMIT 5 OFFSET 15;

-- Page 5
SELECT t.ticket_id, t.user_id, t.event_id, t.seat_label, t.price
FROM tickets AS t
ORDER BY t.price ASC, t.ticket_id ASC
LIMIT 5 OFFSET 20;

-- Count total pages of tickets
SELECT COUNT(*) AS total_tickets,
       CEIL(COUNT(*) / 5.0) AS total_pages
FROM tickets;

-- Search + filter + sort + page together
SELECT t.ticket_id, t.user_id, t.event_id, t.seat_label, t.price
FROM tickets AS t
WHERE t.seat_label LIKE 'A%'
  AND t.price >= 300.00
ORDER BY t.price DESC, t.ticket_id ASC
LIMIT 3 OFFSET 0;














