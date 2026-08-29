CREATE DATABASE QACS_CH02;
USE QACS_CH02;

-- A 
SELECT * 
FROM CUSTOMER, ITEM, SALE, SALE_ITEM

-- B
SELECT LastName, FirstName, Phone
FROM CUSTOMER

-- C
SELECT LastName, FirstName, Phone
FROM CUSTOMER
WHERE FirstName = 'john'

-- D
SELECT C.LastName, C.FirstName, C.Phone, S.SaleDate
FROM CUSTOMER AS C, SALE AS S
WHERE C.CustomerID = S.CustomerID AND Total > 100

-- E
SELECT LastName, FirstName, Phone
FROM CUSTOMER
WHERE FirstName LIKE "D%";

-- F
SELECT LastName, FirstName, Phone
FROM CUSTOMER
WHERE LastName LIKE "_%	ne";

-- F
-- SELECT LastName, FirstName, Phone
-- FROM CUSTOMER
-- WHERE LastName LIKE 567;

-- G
SELECT
	MAX(Total),
    MIN(Total)
FROM SALE;

-- H
SELECT
	AVG(Total)
FROM SALE

-- I 
SELECT 
	COUNT(*)
FROM CUSTOMER

-- J
-- SELECT 	LastName, FirstName
-- FROM CUSTOMER
-- WHERE GROUP BY LastName  
-- GROUP BY FirstName

-- K 
SELECT LastName, FirstName, Phone
FROM CUSTOMER
WHERE CustomerID in (
	SELECT CustomerID
    FROM SALE
    WHERE Total > 100
)
ORDER BY LastName ASC, FirstName DESC;

SELECT LastName, FirstName, Phone, Total
FROM CUSTOMER AS C
JOIN SALE AS S USING (CustomerID)
WHERE Total > 100;

SELECT C.LastName, C.FirstName, C.Phone, S.Total
FROM CUSTOMER AS C 
JOIN SALE AS S ON C.CustomerID = S.CustomerID
WHERE Total > 100
ORDER BY LastName ASC, FirstName DESC

-- desk lamp
SELECT C.LastName, C.FirstName, C.Phone, I.ItemDescription 
FROM CUSTOMER C, ITEM I
WHERE ItemDescription = 'Desk Lamp'
ORDER BY LastName ASC, FirstName DESC


SELECT LastName, FirstName, Phone
FROM CUSTOMER
WHERE CustomerID IN (
	SELECT CustomerID
    FROM ITEM
    WHERE ItemDescription = 'Desk Lamp'
)  	
ORDER BY LastName ASC, FirstName DESC
 
-- USE A JOIN SYNTAX
SELECT C.LastName, C.FirstName, C.Phone, I.ItemDescription 
FROM CUSTOMER AS C
JOIN SALE AS SS ON C.CustomerID = SS.CustomerID
JOIN SALE_ITEM AS S ON SS.SaleID = S.SaleID
JOIN ITEM AS I ON S.ItemID = I.ItemID
WHERE ItemDescription = 'Desk Lamp'
ORDER BY LastName ASC, FirstName DESC

-- use join on syntax with a sub-query
-- SELECT C.LastName, C.FirstName, C.Phone, I.ItemDescription 
-- FROM CUSTOMER AS C
-- JOIN SALE AS SS ON C.CustomerID = SS.CustomerID
-- WHERE SS.SaleID IN (
-- 	SELECT  S.SaleID
--     FROM SALE_ITEM S
-- 	JOIN ITEM AS T ON S.ItemID = I.ItemID
-- 	WHERE I.ItemDescription = 'Desk Lamp'
-- )
-- ORDER BY LastName ASC, FirstName DESC




















