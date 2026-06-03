
-- Identify the efficiency in the delivery time per order (>0 = INEFFICIENT AND REQUIRES ATTENTION, <0 OR 0 = EFFICIENT)

SELECT Shippers.CompanyName, DATEDIFF(DAY, ORDERS.REQUIREDDATE, ORDERS.SHIPPEDDATE) AS DELIVERY_TIME
FROM Orders
INNER JOIN Shippers ON Orders.ShipVia = Shippers.ShipperID
WHERE Orders.ShippedDate IS NOT NULL
ORDER BY DELIVERY_TIME ASC;

-- Identify the difference between the delievered orders and the expected delivery date, and the most delayed order

SELECT Shippers.CompanyName, AVG(DATEDIFF(DAY, ORDERS.REQUIREDDATE, ORDERS.SHIPPEDDATE)) AS AVG_DELIVERY_TIME, 
MAX(DATEDIFF(DAY, ORDERS.REQUIREDDATE, ORDERS.SHIPPEDDATE)) AS MAX_DELAYED_TIME
FROM Orders
INNER JOIN Shippers ON Orders.ShipVia = Shippers.ShipperID
WHERE Orders.ShippedDate IS NOT NULL
GROUP BY Shippers.CompanyName;

-- Identify the countries where there are the most delayed orders

SELECT Orders.ShipCountry, 
AVG(DATEDIFF(DAY, ORDERS.REQUIREDDATE, ORDERS.SHIPPEDDATE)) AS AVG_DELIVERY_TIME, 
MAX(DATEDIFF(DAY, ORDERS.REQUIREDDATE, ORDERS.SHIPPEDDATE)) AS MAX_DELAYED_TIME
FROM Orders
WHERE Orders.ShippedDate IS NOT NULL
GROUP BY Orders.ShipCountry
ORDER BY AVG(DATEDIFF(DAY, ORDERS.REQUIREDDATE, ORDERS.SHIPPEDDATE)) DESC;