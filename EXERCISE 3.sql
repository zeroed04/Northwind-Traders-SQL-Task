
-- Identify the average freight cost per order per country

SELECT Orders.ShipCountry, AVG(ORDERS.FREIGHT) AS AVG_FREIGHT_COST
FROM Orders
WHERE Orders.ShippedDate IS NOT NULL
GROUP BY Orders.ShipCountry
ORDER BY AVG(ORDERS.FREIGHT);

-- Identify the average freight cost the delivery company charges per country and per order

SELECT Shippers.CompanyName, Orders.ShipCountry, AVG(ORDERS.FREIGHT) AS AVG_FREIGHT_COST
FROM Orders
INNER JOIN Shippers ON Orders.ShipVia = Shippers.ShipperID
WHERE Orders.ShippedDate IS NOT NULL
GROUP BY ORDERS.SHIPCOUNTRY, SHIPPERS.COMPANYNAME
ORDER BY ORDERS.SHIPCOUNTRY ASC, AVG(ORDERS.FREIGHT) DESC;
