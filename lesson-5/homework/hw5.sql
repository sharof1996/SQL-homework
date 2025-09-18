--Easy
--1
select productname as Name
from Products

--2
select *
from Customers as Client

--3
select ProductName from Products
union
select ProductName from Products_Discounted

--4
select ProductName from Products
intersect
select ProductName from Products_Discounted

--5
select distinct FirstName + ' ' + LastName as CustomerName, Country
from Customers

--6
select ProductName, Price, 
		Case 
			when Price > 1000 then 'High'
			else 'Low'
			End as PriceCategory
from Products;

--7
select ProductName, StockQuantity,
		IIF(StockQuantity > 100, 'Yes', 'No') as LargeStock
from Products_Discounted

--Medium
--8
select ProductName from Products
union
select ProductName from Products_Discounted

--9
select ProductName from Products
except
select ProductName from Products_Discounted

--10
select ProductName, Price,
		IIF (Price > 1000, 'Expensive', 'Affordable') as PriceLevel
from Products;

--11
select * 
from Employees
where Age < 25 or Salary > 60000;

--12
update Employees
set Salary = Salary * 1.10
where DepartmentName = 'HR' or EmployeeID = 5;

--Hard
--13
select SaleID, SaleAmount,
		CASE 
		when SaleAmount > 500 then 'Mid Tier'
		when SaleAmount between 200 and 500 then 'Mid Tier'
		else 'Low Tier'
		END as SaleTier
from Sales;

--14
select distinct CustomerID from Orders
except
select distinct CustomerID from Sales;

--15
select CustomerID, Quantity,
		CASE 
			when Quantity = 1 then '3%'
			when Quantity between 1 and 3 then '5%'
			else '7%'
		END as DiscountPercent
from Orders;
