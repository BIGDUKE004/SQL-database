USE cape_codd;

SELECT SKU, SKU_Description
FROM INVENTORY

SELECT SKU_Description, SKU
FROM INVENTORY

SELECT WarehouseID
FROM INVENTORY

SELECT distinct WarehouseID
FROM INVENTORY

SELECT WarehouseID, SKU, SKU_Description, QuantityOnHand, QuantityOnOrder
FROM INVENTORY

SELECT *
FROM INVENTORY

SELECT *
FROM INVENTORY
WHERE QuantityOnHand > 0

SELECT SKU, SKU_Description
FROM INVENTORY
WHERE QuantityOnHand = 0

SELECT SKU, SKU_Description, WarehouseID
FROM INVENTORY
WHERE QuantityOnHand = 0
ORDER BY WarehouseID ASC

SELECT SKU, SKU_Description, WarehouseID
FROM INVENTORY
WHERE QuantityOnHand > 0
ORDER BY WarehouseID DESC, SKU ASC

SELECT SKU, SKU_Description, WarehouseID
FROM INVENTORY
WHERE QuantityOnHand = 0 AND QuantityOnOrder > 0
ORDER BY WarehouseID DESC, SKU ASC

SELECT SKU, SKU_Description, WarehouseID
FROM INVENTORY
WHERE QuantityOnHand = 0 OR QuantityOnOrder = 0


SELECT SKU, SKU_Description, WarehouseID, QuantityOnHand
FROM INVENTORY
WHERE QuantityOnHand > 1 AND QuantityOnHand < 10


SELECT SKU, SKU_Description, WarehouseID, QuantityOnHand
FROM INVENTORY
WHERE QuantityOnHand BETWEEN 1 AND 10

SELECT distinct SKU, SKU_Description
FROM INVENTORY
WHERE SKU_Description LIKE "%Half-Dome"

SELECT distinct SKU, SKU_Description
FROM INVENTORY
WHERE SKU_Description LIKE "%Climb%"

SELECT distinct SKU, SKU_Description
FROM INVENTORY
WHERE SKU_Description LIKE "__d%"

SELECT 
COUNT(QuantityOnHand),
SUM(QuantityOnHand),
AVG(QuantityOnHand),
MAX(QuantityOnHand),
MIN(QuantityOnHand)
FROM INVENTORY;

-- COUNT count all the values in the column while sum takes all the value in the particular column and sum it up-- 




SELECT WarehouseID, SUM(QuantityOnHand) AS TotalItemsOnHand
FROM INVENTORY
GROUP BY WarehouseID
order by TotalItemsOnHand DESC


SELECT WarehouseID, SUM(QuantityOnHand) AS TotalItemsOnHandLT3
FROM INVENTORY
WHERE QuantityOnHand < 3 
GROUP BY WarehouseID
ORDER BY TotalItemsOnHandLT3 DESC


SELECT WarehouseID, SUM(QuantityOnHand) AS TotalItemsOnHandLT3
FROM INVENTORY
WHERE QuantityOnHand < 3 
GROUP BY WarehouseId
HAVING COUNT(SKU) < 2
ORDER BY TotalItemsOnHandLT3 DESC

-- the where clause was applied first why is because we need to check for the sum first because it came first then we check for the sku because we need to have the sum first before we filter out the sku--  


SELECT INVENTORY.SKU, INVENTORY.SKU_Description, WAREHOUSE.WarehouseID, WAREHOUSE.WarehouseCity, WAREHOUSE.WarehouseState 
FROM INVENTORY
JOIN WAREHOUSE 
ON INVENTORY.WarehouseID = WAREHOUSE.WarehouseID 
WHERE WAREHOUSE.WarehouseCity = 'Atlanta' 
OR WAREHOUSE.WarehouseCity = 'Bangor' 
OR WAREHOUSE.WarehouseCity = 'Chicago';

SELECT INVENTORY.SKU, INVENTORY.SKU_Description, WAREHOUSE.WarehouseID, WAREHOUSE.WarehouseCity, WAREHOUSE.WarehouseState 
FROM INVENTORY
JOIN WAREHOUSE 
ON INVENTORY.WarehouseID = WAREHOUSE.WarehouseID 
WHERE WAREHOUSE.WarehouseCity 
IN ('Atlanta', 'Bangor', 'Chicago');

SELECT INVENTORY.SKU, INVENTORY.SKU_Description, WAREHOUSE.WarehouseID, WAREHOUSE.WarehouseCity, WAREHOUSE.WarehouseState 
FROM INVENTORY
JOIN WAREHOUSE 
ON INVENTORY.WarehouseID = WAREHOUSE.WarehouseID 
WHERE WAREHOUSE.WarehouseCity <> 'Atlanta' 
AND WAREHOUSE.WarehouseCity <> 'Bangor' AND WAREHOUSE.WarehouseCity <> 'Chicago';

SELECT INVENTORY.SKU, INVENTORY.SKU_Description, WAREHOUSE.WarehouseID, WAREHOUSE.WarehouseCity, WAREHOUSE.WarehouseState 
FROM INVENTORY
JOIN WAREHOUSE 
ON INVENTORY.WarehouseID = WAREHOUSE.WarehouseID 
WHERE WAREHOUSE.WarehouseCity NOT IN ('Atlanta', 'Bangor', 'Chicago');

SELECT CONCAT(SKU_Description, ' is located in ', WarehouseCity) 
AS ItemLocation 
FROM INVENTORY 
JOIN WAREHOUSE 
ON INVENTORY.WarehouseID = WAREHOUSE.WarehouseID;

SELECT SKU, SKU_Description, WarehouseID 
FROM INVENTORY 
WHERE WarehouseID 
IN (SELECT WarehouseID FROM WAREHOUSE WHERE Manager = 'Lucille Smith');

SELECT INVENTORY.SKU, INVENTORY.SKU_Description, INVENTORY.WarehouseID 
FROM INVENTORY, WAREHOUSE 
WHERE INVENTORY.WarehouseID = WAREHOUSE.WarehouseID 
AND WAREHOUSE.Manager = 'Lucille Smith';

SELECT INVENTORY.SKU, INVENTORY.SKU_Description, INVENTORY.WarehouseID 
FROM INVENTORY 
JOIN WAREHOUSE 
ON INVENTORY.WarehouseID = WAREHOUSE.WarehouseID 
WHERE WAREHOUSE.Manager = 'Lucille Smith';

SELECT WarehouseID, AVG(QuantityOnHand) AS AverageQuantityOnHand 
FROM INVENTORY 
WHERE WarehouseID 
IN (SELECT WarehouseID FROM WAREHOUSE WHERE Manager = 'Lucille Smith') 
GROUP BY WarehouseID;



SELECT INVENTORY.WarehouseID, AVG(INVENTORY.QuantityOnHand) AS AverageQuantityOnHand 
FROM INVENTORY
JOIN WAREHOUSE 
ON INVENTORY.WarehouseID = WAREHOUSE.WarehouseID 
WHERE WAREHOUSE.Manager = 'Lucille Smith' 
GROUP BY INVENTORY.WarehouseID;
 