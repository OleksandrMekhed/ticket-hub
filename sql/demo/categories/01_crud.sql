USE TicketDB;


-- categories ==========================================================================================================

-- All categories
SELECT c.category_id, c.name
FROM categories AS c;

-- Get one categories 'Cinema'
SELECT c.category_id, c.name
FROM categories AS c
WHERE c.name = 'Cinema';

-- Add new name to categories
SELECT c.category_id, c.name
FROM categories AS c;
INSERT INTO categories (name)
VALUES ('Test Categories');
SELECT c.category_id, c.name
FROM categories AS c;

-- Update categori
SELECT c.category_id, c.name
FROM categories AS c
WHERE c.name = 'Test Categories';
UPDATE categories AS c
SET name = 'Test Update New'
WHERE c.name = 'Test Categories';
SELECT c.category_id, c.name
FROM categories AS c;

-- Delete category
SELECT c.category_id, c.name
FROM categories AS c
WHERE c.name = 'Test Update New';
DELETE FROM categories AS  c
WHERE c.name = 'Test Update New';
SELECT c.category_id, c.name
FROM categories AS c;