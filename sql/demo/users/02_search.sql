USE TicketDB;

-- users ===============================================================================================================
-- Name ends with "son"
SELECT u.user_id, u.full_name, u.email
FROM users AS u
WHERE u.full_name LIKE '%son';

-- Name start with 'Anna%'
SELECT u.user_id, u.full_name, u.email
FROM users AS u
WHERE u.full_name LIKE 'Anna%';

-- Name does not contain '%ia%'
SELECT u.user_id, u.full_name, u.email
FROM users AS u
WHERE u.full_name NOT LIKE '%ia%';

-- Email contain '%son%'
SELECT u.user_id, u.full_name, u.email
FROM users AS u
WHERE u.email LIKE '%son%';

-- Filtering by name and email
SELECT u.user_id, u.full_name, u.email
FROM users AS u
WHERE u.full_name = 'Oscar Berg' AND u.email = 'oscar.berg@example.com';

-- Order by ID DESC
SELECT u.user_id, u.full_name, u.email
FROM users AS u
ORDER BY u.user_id DESC ;

-- Order by name and user ID ASC
SELECT u.user_id, u.full_name, u.email
FROM users AS u
ORDER BY u.full_name ASC, u.user_id ASC;

-- Only some users, picked by id
SELECT u.user_id, u.full_name
FROM users AS u
WHERE u.user_id IN (3, 5, 10);

-- TRIM removes spaces at the start and end of a text
SELECT u.full_name AS original_name,
       TRIM(u.full_name) AS clean_name
FROM users AS u
WHERE u.user_id = 9;

-- CONCAT glues several values into one text, example - "Anna Lindqvist (#1)"
SELECT CONCAT(u.full_name, ' (#', u.user_id, ')') AS user_label
FROM users AS u
ORDER BY u.user_id ASC;

-- Search + filter + sort + page together
SELECT u.user_id, u.full_name, u.email
FROM users AS u
WHERE u.full_name LIKE '%son%'
ORDER BY u.user_id ASC, u.full_name ASC
LIMIT 3 OFFSET 0;