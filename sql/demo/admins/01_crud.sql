USE TicketDB;

-- admins ==============================================================================================================
-- All admins
SELECT a.admin_id, a.email, a.is_active, a.created_at
FROM admins AS a;

-- Get one admin
SELECT a.admin_id, a.email, a.is_active, a.created_at
FROM admins AS a
WHERE a.admin_id = 1;

-- Add new admin
SELECT a.admin_id, a.email, a.is_active, a.created_at
FROM admins AS a;
INSERT INTO admins (email, password_hash)
VALUES ('test.admin@ticketdb.local', SHA2('TestAdminPass123!', 256));
SELECT a.admin_id, a.email, a.is_active, a.created_at
FROM admins AS a;

-- Update admin (TRUE -> FALSE)
SELECT a.admin_id, a.email, a.is_active, a.created_at
FROM admins AS a
WHERE a.email = 'test.admin@ticketdb.local';
UPDATE admins AS a
SET a.is_active = FALSE
WHERE a.email = 'test.admin@ticketdb.local';
SELECT a.admin_id, a.email, a.is_active, a.created_at
FROM admins AS a
WHERE a.email = 'test.admin@ticketdb.local';

-- Delete test admin
SELECT a.admin_id, a.email, a.is_active, a.created_at
FROM admins AS a
WHERE a.email = 'test.admin@ticketdb.local';
DELETE FROM admins AS a
WHERE a.email = 'test.admin@ticketdb.local';
SELECT a.admin_id, a.email, a.is_active, a.created_at
FROM admins AS a;