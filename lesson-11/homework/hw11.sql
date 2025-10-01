--easy
--1
select o.OrderID, c.FirstName + ' ' + c.LastName as CustomerName, o.OrderDate
from Orders o
join Customers c on o.CustomerID = c.CustomerID
where YEAR (o.OrderDate) > 2022;

--2
select e.Name as EmployeeName, d.DepartmentName
from Employees e
join Departments d on e.DepartmentID = d.DepartmentID
where d.DepartmentName in ('Sales', 'Marketing');

--3
select d.DepartmentName, max(e.salary) as MaxSalary
from Employees e
join Departments d on e.DepartmentID = d.DepartmentID
group by d.DepartmentName;

--4
select c.FirstName + ' ' + c.LastName as CustomerName, o.OrderID, o.OrderDate
from Customers c
join Orders o on c.CustomerID = o.CustomerID
where c.Country = 'USA' and YEAR(o.OrderDate) = 2023;

--5
select c.FirstName + ' ' + c.LastName as CustomerName, COUNT(o.OrderID) as TotalOrders
from Customers c
left join Orders o on c.CustomerID = o.CustomerID
group by c.FirstName, c.LastName;

--6
select p.ProductName, s.SupplierName
from Products p
join Suppliers s on p.SupplierID = s.SupplierID
where s.SupplierName in ('Gadget Supplies', 'Clothing Mart');

--7
select c.FirstName + ' ' + c.LastName as CustomerName, max(o.OrderDate) as MostRecentOrderDate
from Customers c
left join Orders o on c.CustomerID = o.CustomerID
group by c.FirstName, c.LastName;

--Medium
--8
select c.FirstName + ' ' + c.LastName as CustomerName, o.TotalAmount as OrderTotal 
from Customers c
join Orders o on c.CustomerID = o.CustomerID
where o.TotalAmount > 500;

--9
select p.ProductName, s.SaleDate, s.SaleAmount
from Products p
join Sales s on p.ProductID = s.ProductID
where YEAR(s.SaleDate) = 2022 or s.SaleAmount > 400;

--10
select p.ProductName, SUM(s.SaleAmount)
from Products p
join Sales s on p.ProductID = s.ProductID
group by p.ProductName;

--11
select e.Name as EmployeeName, d.DepartmentName, e.Salary
from Employees e
join Departments d on e.DepartmentID = d.DepartmentID
where d.DepartmentName = 'Human Resources' and e.Salary > 60000;

--12
select p.productName, s.SaleDate, p.StockQuantity
from Products p
join Sales s on p.ProductID = s.ProductID
where YEAR(s.SaleDate) = 2023 and p.StockQuantity > 100;

--13
select e.Name as EmployeeName, d.DepartmentName, e.HireDate
from Employees e
join Departments d on e.DepartmentID = d.DepartmentID
where d.DepartmentName = 'Sales' or YEAR(e.HireDate) > 2020;

--14
select c.FirstName + ' ' + c.LastName as CustomerName, o.OrderID, c.Address, o.OrderDate
from Customers c
join Orders o on c.CustomerID = o.CustomerID
where c.Country = 'USA' and c.Address like '[0-9][0-9][0-9][0-9]%';

--15
select p.ProductName, p.Category, s.SaleAmount
from Products p
join Sales s on p.ProductID = s.ProductID
where p.Category = (select CategoryID from Categories where CategoryName = 'Electronics') or s.SaleAmount > 350;

--16
select c.CategoryName, COUNT(p.ProductID) as ProductCount
from Products p
join Categories c on p.Category = c.CategoryID
group by c.CategoryName;

--17
select c.FirstName + ' ' + c.LastName as CustomerName, c.City, o.OrderID, o.TotalAmount as Amount
from Customers c
join Orders o on c.CustomerID = o.CustomerID
where c.City = 'Los Angeles' and o.TotalAmount > 300;

--18
SELECT e.Name AS EmployeeName,
       d.DepartmentName
FROM Employees e
JOIN Departments d ON e.DepartmentID = d.DepartmentID
WHERE d.DepartmentName IN ('Human Resources', 'Finance')
   OR LEN(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(LOWER(e.Name),'a',''),'e',''),'i',''),'o',''),'u','')) <= LEN(e.Name) - 4;

--19
SELECT e.Name AS EmployeeName,
       d.DepartmentName,
       e.Salary
FROM Employees e
JOIN Departments d ON e.DepartmentID = d.DepartmentID
WHERE d.DepartmentName IN ('Sales', 'Marketing')
  AND e.Salary > 60000;
