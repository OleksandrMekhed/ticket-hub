USE TicketDB;

-- admins ==============================================================================================================
-- ERROR - 1062: duplicate email address is not allowed (UNIQUE email)
SELECT a.admin_id, a.email, a.is_active, a.created_at
FROM admins AS a
WHERE a.email = 'admin@test.com';
INSERT INTO admins (email, password_hash)
VALUES ('admin@test.com', SHA2('0000', 256));

-- ERROR - 1048: cannot insert NULL into required column email (NOT NULL)
SELECT a.admin_id, a.email, a.is_active, a.created_at
FROM admins AS a;
INSERT INTO admins (email, password_hash)
VALUES (NULL, SHA2('NoEmailPass123!', 256));

-- ERROR - 1048: cannot insert NULL into required column password_hash (NOT NULL)
SELECT a.admin_id, a.email, a.is_active, a.created_at
FROM admins AS a;
INSERT INTO admins (email, password_hash)
VALUES ('nopass.admin@ticketdb.local', NULL);
