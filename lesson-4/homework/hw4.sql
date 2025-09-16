--Easy-Level

--1
select TOP (5) * FROM Employees;

--2
SELECT DISTINCT Category 
FROM Products;

--3
select * from Products
where Price > 100;

--4
select * from Customers
where FirstName like 'A%';

--5
select * from Products
order by Price ASC;

--6
select * from Employees
where Salary >= 60000 and DepartmentName = 'HR';

--7
select EmployeeID, FirstName, LastName, departmentname, salary, hiredate, age, ISNULL (Email, 'noemail@example.com') AS Email, Country
from employees

--8
select * from Products
where Price between 50 and 100;

--9
select distinct Category, ProductName
from Products;

--10
select distinct Category, ProductName
from Products
order by ProductName desc;

--Medium-Level
--1
SELECT TOP (10) *
FROM Products
ORDER BY Price DESC;

--2
SELECT EmployeeID,
       COALESCE(FirstName, LastName) AS Name
FROM Employees;

--3
SELECT DISTINCT Category, Price
FROM Products;

--4
SELECT DISTINCT Category, Price
FROM Products;

--5
SELECT *
FROM Employees
ORDER BY Salary DESC
OFFSET 10 ROWS FETCH NEXT 10 ROWS ONLY;

--6
SELECT *
FROM Products
WHERE Price <= 1000 AND StockQuantity > 50
ORDER BY StockQuantity ASC;

--7
SELECT *
FROM Products
WHERE ProductName LIKE '%e%';

--8
SELECT *
FROM Employees
WHERE DepartmentName IN ('HR', 'IT', 'Finance');

--9
SELECT *
FROM Customers
ORDER BY City ASC, PostalCode DESC;

select * from Orders
