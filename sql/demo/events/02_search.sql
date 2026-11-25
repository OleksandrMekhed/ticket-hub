USE TicketDB;

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

-- Search + filter + sort + page together
SELECT e.event_id, e.title, e.starts_at, e.price
FROM events AS e
WHERE e.title LIKE '%o%'
  AND e.price BETWEEN 100.00 AND 500.00
  AND e.starts_at >= '2026-12-01 00:00:00'
ORDER BY e.price ASC, e.event_id ASC
LIMIT 3 OFFSET 0;