-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.

SELECT p.ProductName, c.CategoryName FROM Product AS p 
JOIN Category AS c ON p.categoryid = c.id;

-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.

select [Order].Id as OrderId, Shipper.CompanyName from [Order] 
join Shipper on [Order].ShipVia = Shipper.Id where ShippedDate < '2012-08-09';

-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.

SELECT ProductName , Quantity FROM OrderDetail AS o JOIN Product AS p ON o.ProductID = p.id WHERE OrderID = 10251 ORDER BY ProductName;

-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.

SELECT o.Id, c.CompanyName, e.LastName
FROM [Order] as o
JOIN Customer as c, Employee as e
WHERE o.CustomerId = c.Id AND o.EmployeeId = e.Id