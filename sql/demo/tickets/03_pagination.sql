USE TicketDB;

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