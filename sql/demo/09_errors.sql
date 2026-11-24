USE TicketDB;

-- ERRORS ==============================================================================================================

-- ERROR category ------------------------------------------------------------------------------------------------------
-- ERROR - 1062, duplicate categories at the same name (UNIQUE name)
SELECT c.category_id, c.name
FROM categories AS c;
INSERT INTO categories (name)
VALUES ('Cinema');

-- ERROR - 1451, cannot delete categories with FOREIGN KEY events
SELECT c.category_id, c.name, e.event_id, e.title
FROM categories AS c
JOIN events AS e ON c.category_id = e.category_id
WHERE c.category_id = 1;
DELETE FROM categories AS c
WHERE c.category_id = 1;

-- ERROR - 1048, cannot insert NULL into required column name
SELECT c.category_id, c.name
FROM categories AS c;
INSERT INTO categories (name)
VALUES (NULL);


-- ERROR locations -----------------------------------------------------------------------------------------------------
-- ERROR - 1062, duplicate location at the same name and city (UNIQUE name, city)
SELECT l.location_id, l.name, l.city, l.address
FROM locations AS l;
INSERT INTO locations (name, city, address)
VALUES ('Malmo Live', 'Malmo', 'Test');

-- ERROR - 1451, cannot delete a location that has events (FOREIGN KEY in events)
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


-- ERROR events --------------------------------------------------------------------------------------------------------
-- ERROR - 1062: duplicate event at the same location and start time (UNIQUE location_id, title, starts_at)
SELECT e.event_id, e.category_id, e.location_id, e.title, e.starts_at, e.price
FROM events AS e
WHERE e.location_id = 1
  AND e.title = 'Dune: Part Two'
  AND e.starts_at = '2026-12-01 18:00:00';
INSERT INTO events (category_id, location_id, title, starts_at, price)
VALUES (1, 1, 'Dune: Part Two', '2026-12-01 18:00:00', 120.00);

-- ERROR - 1451, cannot delete an event that has tickets (FOREIGN KEY in tickets
SELECT e.event_id, e.title, t.ticket_id, t.seat_label, t.price
FROM events AS e
JOIN tickets AS t ON e.event_id = t.event_id
WHERE e.event_id = 1;
DELETE FROM events
WHERE event_id = 1;

-- ERROR - 1452: cannot add event with non-existent category_id (FOREIGN KEY to categories)
SELECT c.category_id, c.name
FROM categories AS c;
INSERT INTO events (category_id, location_id, title, starts_at, price)
VALUES (999, 1, 'Invalid Category Event', '2026-12-20 18:00:00', 150.00);

-- ERROR - 1452: cannot add event with non-existent location_id (FOREIGN KEY to locations)
SELECT l.location_id, l.name, l.city
FROM locations AS l;
INSERT INTO events (category_id, location_id, title, starts_at, price)
VALUES (1, 999, 'Invalid Location Event', '2026-12-20 19:00:00', 150.00);

-- ERROR - 1048: cannot insert NULL into required column title (NOT NULL)
SELECT e.event_id, e.title
FROM events AS e;
INSERT INTO events (category_id, location_id, title, starts_at, price)
VALUES (1, 1, NULL, '2026-12-20 20:00:00', 150.00);


-- ERROR tickets -------------------------------------------------------------------------------------------------------
-- ERROR - 1062: prevents double selling: the same seat cannot be sold twice for the same event (UNIQUE event_id, seat_label)
SELECT t.ticket_id, t.user_id, t.event_id, t.seat_label, t.price
FROM tickets AS t
WHERE t.event_id = 1
  AND t.seat_label = 'A1';
INSERT INTO tickets (user_id, event_id, seat_label, price)
VALUES (2, 1, 'A1', 120.00);

-- ERROR - 1452: cannot create ticket for non-existent user_id (FOREIGN KEY to users)
SELECT u.user_id, u.full_name, u.email
FROM users AS u;
INSERT INTO tickets (user_id, event_id, seat_label, price)
VALUES (999, 6, 'A1', 120.00);

-- ERROR - 1452: cannot create ticket for non-existent event_id (FOREIGN KEY to events)
SELECT e.event_id, e.title
FROM events AS e;
INSERT INTO tickets (user_id, event_id, seat_label, price)
VALUES (1, 999, 'A1', 120.00);

-- ERROR - 1048: cannot insert NULL into required column seat_label (NOT NULL)
SELECT t.ticket_id, t.event_id, t.seat_label
FROM tickets AS t;
INSERT INTO tickets (user_id, event_id, seat_label, price)
VALUES (1, 6, NULL, 120.00);


-- ERROR users ---------------------------------------------------------------------------------------------------------
-- ERROR - 1062: duplicate email address is not allowed (UNIQUE email)
SELECT u.user_id, u.full_name, u.email
FROM users AS u
WHERE u.email = 'anna.lindqvist@example.com';
INSERT INTO users (full_name, email)
VALUES ('Duplicate Anna', 'anna.lindqvist@example.com');

-- ERROR - 1451: cannot delete user that already has purchased tickets (FOREIGN KEY in tickets)
SELECT u.user_id, u.full_name, t.ticket_id, t.event_id, t.seat_label, t.price
FROM users AS u
JOIN tickets AS t ON u.user_id = t.user_id
WHERE u.user_id = 1;
DELETE FROM users
WHERE user_id = 1;

-- ERROR - 1048: cannot insert NULL into required column email (NOT NULL)
SELECT u.user_id, u.full_name, u.email
FROM users AS u;
INSERT INTO users (full_name, email)
VALUES ('No Email User', NULL);