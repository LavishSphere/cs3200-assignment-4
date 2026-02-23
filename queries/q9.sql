/*
Query 9: Creative addition: Define a new meaningful query using at least three tables, and some window function. Explain clearly what your query achieves, and what the results mean.
*/


-- Top Genres by Country

-- This query identifies every genre sold in each country, counts the total tracks sold for that genre, and then uses a Window Function to rank them from #1 (most popular) downwards for every country.

WITH GenreSales AS (
    SELECT 
        c.Country,
        g.Name AS GenreName,
        COUNT(ii.TrackId) AS TracksSold
    FROM customers AS c
    JOIN invoices AS i ON c.CustomerId = i.CustomerId
    JOIN invoice_items AS ii ON i.InvoiceId = ii.InvoiceId
    JOIN tracks AS t ON ii.TrackId = t.TrackId
    JOIN genres AS g ON t.GenreId = g.GenreId
    WHERE c.Country IS NOT NULL 
      AND g.Name IS NOT NULL
    GROUP BY c.Country, g.Name
)
SELECT 
    Country,
    GenreName,
    TracksSold,
    RANK() OVER (PARTITION BY Country ORDER BY TracksSold DESC) as SalesRank
FROM GenreSales
ORDER BY Country, SalesRank;

-- Explanation of the Query:
/* 
5 Tables Used:
customers: To get the location of the buyer.
invoices & invoice_items: To link the customer to the specific items they bought.
tracks: To identify what was on the invoice.
genres: To get the human-readable name of the music style.
The WITH GenreSales block acts as a temporary table that pre-calculates the " Totals" for every country/genre combination.
The Window Function (RANK() OVER)
PARTITION BY Country: This tells SQL to re-do the ranking every time it hits a new country.
ORDER BY TracksSold DESC: This makes sure that the genre with the highest sales gets the #1 rank.
*/

-- What the Results Mean:
/*
This result set provides a regional market analysis. Instead of just seeing what sells best globally, a manager can look at this and see, for example:
In Brazil, Rock is #1 (81 sales), but Latin is a very strong #2 (53 sales).
In Canada, Rock is also #1, but Alternative & Punk (Rank #4) is much more popular than it is in other regions.
This type of data can be used by digital stores to decide which albums to feature on the homepage for users logging in from different countries!
*/
