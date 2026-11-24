USE TicketDB;

-- Pagination
-- LIMIT + OFFSET (pagination), COUNT + CEIL (number of pages)

-- categories ==========================================================================================================
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


-- users ===============================================================================================================
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

-- tickets =============================================================================================================
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