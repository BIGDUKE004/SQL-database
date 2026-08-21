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

 