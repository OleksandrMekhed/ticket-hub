USE TicketDB;

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

-- Search + filter + sort + page together
SELECT t.ticket_id, t.user_id, t.event_id, t.seat_label, t.price
FROM tickets AS t
WHERE t.seat_label LIKE 'A%'
  AND t.price >= 300.00
ORDER BY t.price DESC, t.ticket_id ASC
LIMIT 3 OFFSET 0;