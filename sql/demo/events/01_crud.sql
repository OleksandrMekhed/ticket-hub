USE TicketDB;

-- events ==============================================================================================================
-- All events
SELECT e.event_id, e.category_id, e.location_id, e.title, e.starts_at, e.price
FROM events AS e;

-- Get one event
SELECT e.event_id, e.category_id, e.location_id, e.title, e.starts_at, e.price
FROM events AS e
WHERE e.event_id = 1;

-- Add new event
SELECT e.event_id, e.category_id, e.location_id, e.title, e.starts_at, e.price
FROM events AS e;
INSERT INTO events (category_id, location_id, title, starts_at, price)
VALUES (1, 1, 'Test', '2026-12-31 18:00:00', 150.00);
SELECT e.event_id, e.category_id, e.location_id, e.title, e.starts_at, e.price
FROM events AS e;

-- Update event
SELECT e.event_id, e.category_id, e.location_id, e.title, e.starts_at, e.price
FROM events AS e
WHERE e.title = 'Test' AND e.price = 150.00;
UPDATE events AS e
SET title = 'New Title'
WHERE e.title = 'Test' AND e.price = 150.00;
SELECT e.event_id, e.category_id, e.location_id, e.title, e.starts_at, e.price
FROM events AS e;

-- Delete event
SELECT e.event_id, e.category_id, e.location_id, e.title, e.starts_at, e.price
FROM events AS e
WHERE e.title = 'New Title';
DELETE FROM events AS e
WHERE e.title = 'New Title' AND e.price = 150.00;
SELECT e.event_id, e.category_id, e.location_id, e.title, e.starts_at, e.price
FROM events AS e;