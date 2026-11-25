USE TicketDB;

-- admins ==============================================================================================================

-- Email contains '%admin%'
SELECT a.admin_id, a.email, a.is_active, a.created_at
FROM admins AS a
WHERE a.email LIKE '%admin%';

-- Email does not contain '%test%'
SELECT a.admin_id, a.email, a.is_active, a.created_at
FROM admins AS a
WHERE a.email NOT LIKE '%test%';

-- Filter by is_active = TRUE
SELECT a.admin_id, a.email, a.is_active, a.created_at
FROM admins AS a
WHERE a.is_active = TRUE;

-- Filter by is_active = FALSE
SELECT a.admin_id, a.email, a.is_active, a.created_at
FROM admins AS a
WHERE a.is_active = FALSE;

-- Filter by admin_id less than or equal to 5
SELECT a.admin_id, a.email, a.is_active, a.created_at
FROM admins AS a
WHERE a.admin_id <= 5;

-- Filter by admin_id more than or equal to 2
SELECT a.admin_id, a.email, a.is_active, a.created_at
FROM admins AS a
WHERE a.admin_id >= 2;

-- Filter by created_at range
SELECT a.admin_id, a.email, a.is_active, a.created_at
FROM admins AS a
WHERE a.created_at >= '2026-01-01 00:00:00'
  AND a.created_at < '2026-12-31 23:59:59';

-- Filter by admin_id 1 or 2
SELECT a.admin_id, a.email, a.is_active, a.created_at
FROM admins AS a
WHERE a.admin_id IN (1, 2);

-- Combined filters email pattern and is_active
SELECT a.admin_id, a.email, a.is_active, a.created_at
FROM admins AS a
WHERE a.email LIKE '%@%'
  AND a.is_active = TRUE;

-- Sorting by email ASC and admin_id ASC
SELECT a.admin_id, a.email, a.is_active, a.created_at
FROM admins AS a
ORDER BY a.email ASC, a.admin_id ASC;

-- Sorting by created_at DESC and admin_id ASC
SELECT a.admin_id, a.email, a.is_active, a.created_at
FROM admins AS a
ORDER BY a.created_at DESC, a.admin_id ASC;

-- Search + filter + sort + page together
SELECT a.admin_id, a.email, a.is_active, a.created_at
FROM admins AS a
WHERE a.email LIKE '%@%'
  AND a.is_active = TRUE
  AND a.admin_id >= 1
ORDER BY a.admin_id ASC
LIMIT 3 OFFSET 0;