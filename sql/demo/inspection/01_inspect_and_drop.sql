USE TicketDB;

SELECT VERSION() AS mysql_version,
    DATABASE() AS current_database;

SHOW TABLES;

DESCRIBE admins;
DESCRIBE categories;
DESCRIBE events;
DESCRIBE locations;
DESCRIBE tickets;
DESCRIBE users;
DESCRIBE v_event_revenue;
DESCRIBE v_ticket_details;


-- DROP SECTION (run selectively only when you really want to drop objects) ============================================
-- Views first (if needed)
-- DROP VIEW IF EXISTS v_ticket_details;
-- DROP VIEW IF EXISTS v_event_revenue;

-- Child tables first (due to ON DELETE RESTRICT foreign keys)
-- DROP TABLE IF EXISTS tickets;
-- DROP TABLE IF EXISTS events;

-- Parent / independent tables
-- DROP TABLE IF EXISTS users;
-- DROP TABLE IF EXISTS categories;
-- DROP TABLE IF EXISTS locations;
-- DROP TABLE IF EXISTS admins;
