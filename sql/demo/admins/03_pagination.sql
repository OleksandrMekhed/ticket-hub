USE TicketDB;

-- admins ==============================================================================================================
-- Page 1
SELECT a.admin_id, a.email, a.is_active, a.created_at
FROM admins AS a
ORDER BY a.admin_id ASC
LIMIT 3 OFFSET 0;

-- Page 2
SELECT a.admin_id, a.email, a.is_active, a.created_at
FROM admins AS a
ORDER BY a.admin_id ASC
LIMIT 3 OFFSET 3;

-- Count total pages of admins
SELECT COUNT(*) AS total_admins,
       CEIL(COUNT(*) / 3.0) AS total_pages
FROM admins;