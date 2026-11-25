USE TicketDB;

-- tickets =============================================================================================================
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