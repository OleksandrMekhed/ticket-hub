USE TicketDB;

-- events ==============================================================================================================
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