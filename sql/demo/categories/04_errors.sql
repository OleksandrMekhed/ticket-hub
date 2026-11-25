USE TicketDB;


-- category ============================================================================================================
-- ERROR - 1062, duplicate categories at the same name (UNIQUE name)
SELECT c.category_id, c.name
FROM categories AS c;
INSERT INTO categories (name)
VALUES ('Cinema');

-- ERROR - 1451, cannot delete categories with FOREIGN KEY events - ON DELETE RESTRICT
SELECT c.category_id, c.name, e.event_id, e.title
FROM categories AS c
JOIN events AS e ON c.category_id = e.category_id
WHERE c.category_id = 1;
DELETE FROM categories AS c
WHERE c.category_id = 1;

-- ERROR - 1048, cannot insert NULL into required column name
SELECT c.category_id, c.name
FROM categories AS c;
INSERT INTO categories (name)
VALUES (NULL);