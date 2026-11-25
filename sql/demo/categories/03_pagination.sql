USE TicketDB;

-- categories ==========================================================================================================
-- Page 1 (first 2 categories)
SELECT c.category_id, c.name
FROM categories AS c
ORDER BY c.name ASC, c.category_id ASC
LIMIT 2 OFFSET 0;

-- Page 2 (next 2 categories)
SELECT c.category_id, c.name
FROM categories AS c
ORDER BY c.name ASC, c.category_id ASC
LIMIT 2 OFFSET 2;

-- Count total pages of categories
SELECT COUNT(*) AS total_categories,
       CEIL(COUNT(*) / 2.0) AS total_pages
FROM categories;