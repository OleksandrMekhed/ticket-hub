USE TicketDB;

-- users ===============================================================================================================
-- Page 1
SELECT u.user_id, u.full_name, u.email
FROM users AS u
ORDER BY u.user_id ASC, u.full_name ASC
LIMIT 3 OFFSET 0;

-- Page 2
SELECT u.user_id, u.full_name, u.email
FROM users AS u
ORDER BY u.user_id ASC, u.full_name ASC
LIMIT 3 OFFSET 3;

-- Page 3
SELECT u.user_id, u.full_name, u.email
FROM users AS u
ORDER BY u.user_id ASC, u.full_name ASC
LIMIT 3 OFFSET 6;

-- Page 4
SELECT u.user_id, u.full_name, u.email
FROM users AS u
ORDER BY u.user_id ASC, u.full_name ASC
LIMIT 3 OFFSET 9;

-- Count page of users
SELECT COUNT(*) AS total_users,
       CEIL(COUNT(*) / 3.0) AS total_pages
FROM users;