USE TicketDB;

-- SELECT, INSERT INTO, WHERE, UPDATE, DELETE, WHERE + AND, JOIN - tickets (events, tickets, users) for user_id = 2

-- categories ==========================================================================================================

-- All categories
SELECT c.category_id, c.name
FROM categories AS c;

-- Get one categories 'Cinema'
SELECT c.category_id, c.name
FROM categories AS c
WHERE c.name = 'Cinema';

-- Add new name to categories
SELECT c.category_id, c.name
FROM categories AS c;
INSERT INTO categories (name)
VALUES ('Test Categories');
SELECT c.category_id, c.name
FROM categories AS c;

-- Update categori
SELECT c.category_id, c.name
FROM categories AS c
WHERE c.name = 'Test Categories';
UPDATE categories AS c
SET name = 'Test Update New'
WHERE c.name = 'Test Categories';
SELECT c.category_id, c.name
FROM categories AS c;

-- Delete category
SELECT c.category_id, c.name
FROM categories AS c
WHERE c.name = 'Test Update New';
DELETE FROM categories AS  c
WHERE c.name = 'Test Update New';
SELECT c.category_id, c.name
FROM categories AS c;


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


-- tickets =============================================================================================================
-- All list of tickets
SELECT t.ticket_id, t.user_id, t.event_id, t.seat_label, t.price
FROM tickets AS t;

-- Tickets for user_id = 2
SELECT e.event_id, e.title, t.ticket_id, t.user_id, t.seat_label, t.price
FROM tickets AS t
JOIN events AS e ON e.event_id = t.event_id
WHERE t.user_id = 2;

-- Add new ticket
SELECT t.ticket_id, t.user_id, t.event_id, t.seat_label, t.price
FROM tickets AS t;
INSERT INTO tickets (user_id, event_id, seat_label, price)
VALUES (2, 6, 'A1', 100.00);
SELECT t.ticket_id, t.user_id, t.event_id, t.seat_label, t.price
FROM tickets AS t;

-- Update ticket
SELECT t.ticket_id, t.user_id, t.event_id, t.seat_label, t.price
FROM tickets AS t
WHERE t.event_id = 6 AND t.seat_label = 'A1';
UPDATE tickets AS t
SET price = 130.00
WHERE t.event_id = 6 AND t.seat_label = 'A1';
SELECT t.ticket_id, t.user_id, t.event_id, t.seat_label, t.price
FROM tickets AS t
WHERE t.event_id = 6 AND t.seat_label = 'A1';

-- Delete ticket
SELECT t.ticket_id, t.user_id, t.event_id, t.seat_label, t.price
FROM tickets AS t
WHERE t.event_id = 6 AND t.seat_label ='A1';
DELETE FROM tickets AS t
WHERE t.event_id = 6 AND t.seat_label = 'A1';
SELECT t.ticket_id, t.user_id, t.event_id, t.seat_label, t.price
FROM tickets AS t
WHERE t.event_id = 6 AND t.seat_label = 'A1';
SELECT t.ticket_id, t.user_id, t.event_id, t.seat_label, t.price
FROM tickets AS t;


-- users ===============================================================================================================
-- All users
SELECT u.user_id, u.full_name, u.email
FROM users AS u;

-- Add new user
SELECT u.user_id, u.full_name, u.email
FROM users AS u;
INSERT INTO users (full_name, email)
VALUES ('Test Person', 'test.person@example.com');
SELECT u.user_id, u.full_name, u.email
FROM users AS u
WHERE u.full_name = 'Test Person';
SELECT u.user_id, u.full_name, u.email
FROM users AS u;


-- Update user
SELECT u.user_id, u.full_name, u.email
FROM users AS u
WHERE u.full_name = 'Anna Lindqvist' AND u.email = 'anna.lindqvist@example.com';
UPDATE users AS u
SET email = 'anna.new@example.com'
WHERE u.full_name = 'Anna Lindqvist' AND u.email = 'anna.lindqvist@example.com';
SELECT u.user_id, u.full_name, u.email
FROM users AS u
WHERE u.full_name = 'Anna Lindqvist' AND u.email = 'anna.new@example.com';
UPDATE users AS u
SET email = 'anna.lindqvist@example.com'
WHERE u.full_name = 'Anna Lindqvist' AND u.email = 'anna.new@example.com';
SELECT u.user_id, u.full_name, u.email
FROM users AS u
WHERE u.full_name = 'Anna Lindqvist' AND u.email = 'anna.lindqvist@example.com';



-- Delete user
SELECT u.user_id, u.full_name, u.email
FROM users AS u
WHERE u.email = 'test.person@example.com' AND u.full_name = 'Test Person';
DELETE FROM users AS u
WHERE u.email = 'test.person@example.com' AND u.full_name = 'Test Person';
SELECT u.user_id, u.full_name, u.email
FROM users AS u
WHERE u.email = 'test.person@example.com' AND u.full_name = 'Test Person';
SELECT u.user_id, u.full_name, u.email
FROM users AS u;









