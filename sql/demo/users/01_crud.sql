USE TicketDB;

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