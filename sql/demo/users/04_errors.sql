USE TicketDB;

-- users ===============================================================================================================
-- ERROR - 1062: duplicate email address is not allowed (UNIQUE email)
SELECT u.user_id, u.full_name, u.email
FROM users AS u
WHERE u.email = 'anna.lindqvist@example.com';
INSERT INTO users (full_name, email)
VALUES ('Duplicate Anna', 'anna.lindqvist@example.com');

-- ERROR - 1451: cannot delete user that already has purchased tickets FOREIGN KEY in tickets - ON DELETE RESTRICT
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