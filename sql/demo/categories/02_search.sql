USE TicketDB;


-- categories ==========================================================================================================

-- Name start with 'The'
SELECT c.category_id, c.name
FROM categories AS c
WHERE c.name LIKE 'The%';

-- Name contains '%n%'
SELECT c.category_id, c.name
FROM categories AS c
WHERE c.name LIKE '%n%';

-- Name ends with '%rt'
SELECT c.category_id, c.name
FROM categories AS c
WHERE c.name LIKE '%rt';

-- Name does not start with '%C%' and order by ID DESC
SELECT c.category_id, c.name
FROM categories AS c
WHERE c.name NOT LIKE 'C%'
ORDER BY c.category_id DESC ;

-- Order by name Desc
SELECT c.category_id, c.name
FROM categories AS c
ORDER BY c.name DESC ;

-- Order by ID ASC
SELECT c.category_id, c.name
FROM categories AS c
ORDER BY c.category_id ASC ;