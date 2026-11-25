USE TicketDB;

-- events ==============================================================================================================
-- ERROR - 1062: duplicate event at the same location and start time (UNIQUE location_id, title, starts_at)
SELECT e.event_id, e.category_id, e.location_id, e.title, e.starts_at, e.price
FROM events AS e
WHERE e.location_id = 1
  AND e.title = 'Dune: Part Two'
  AND e.starts_at = '2026-12-01 18:00:00';
INSERT INTO events (category_id, location_id, title, starts_at, price)
VALUES (1, 1, 'Dune: Part Two', '2026-12-01 18:00:00', 120.00);

-- ERROR - 1451, cannot delete an event that has tickets FOREIGN KEY in tickets - ON DELETE RESTRICT
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