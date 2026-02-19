/*
Query 1: What are the last names and emails of all customer who made purchased in the store?
*/

SELECT DISTINCT 
    c.LastName, 
    c.Email
FROM customers AS c
JOIN invoices AS i ON c.CustomerId = i.CustomerId
WHERE c.LastName IS NOT NULL 
  AND c.Email IS NOT NULL;
