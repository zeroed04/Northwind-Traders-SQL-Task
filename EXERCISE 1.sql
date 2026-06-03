Use Northwind

-- Identify the if the total sales volume are justified by the provided discounts

SELECT discount, AVG(quantity) AS disc_avg
FROM [Order Details]
GROUP BY Discount
ORDER BY Discount ASC;

-- Find out which sales reps are giving out more discounts

SELECT Employees.FirstName + ' ' + Employees.LastName AS Employee, AVG([Order Details].Discount) AS avg_disc
FROM Employees
INNER JOIN Orders
ON Employees.EmployeeID = orders.EmployeeID
INNER JOIN [Order Details]
ON orders.OrderID = [Order Details].OrderID
GROUP BY Employees.FirstName, Employees.LastName
ORDER BY avg([order details].discount) DESC;

-- Which sales reps are making the company lose the most money?

SELECT 
    Employees.FirstName + ' ' + Employees.LastName AS Employees,
    SUM([Order Details].UnitPrice * [Order Details].Quantity * [Order Details].Discount) AS Total_Lost_Money
FROM Employees
INNER JOIN Orders 
    ON Employees.EmployeeID = Orders.EmployeeID
INNER JOIN [Order Details] 
    ON Orders.OrderID = [Order Details].OrderID
GROUP BY Employees.FirstName, Employees.LastName
ORDER BY Total_Lost_Money DESC;

-- How much money is the company losing overall?

SELECT SUM([order details].unitprice * [order details].quantity * [order details].discount) as Lost_Money
FROM [Order Details];

-- Which products are losing the most money because of the discounts

SELECT Products.ProductName, SUM([order details].unitprice * [order details].quantity * [order details].discount) AS Lost_money
FROM [Order Details]
INNER JOIN Products ON [Order Details].ProductID = Products.ProductID
GROUP BY products.ProductName
ORDER BY Lost_money DESC;
