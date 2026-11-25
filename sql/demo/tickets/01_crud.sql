USE TicketDB;

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