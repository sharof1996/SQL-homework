--easy
--1
select min(Price) as MinPrice
from Products;

--2
select max(Salary) as MaxSalary
from Employees;

--3
select count(*) as TotalCustomers
from Customers;

--4
select count(distinct Category) as UniqueCategories
from Products;

--5
select sum(SaleAmount) as totalsales
from Sales
where ProductID = 7;

--6
select AVG(Age) as AverageAge
from Employees;

--7
select DepartmentName, count(*) as EmployeeCount
from Employees
group by DepartmentName;

--8
select Category, 
	min(Price) as MinPrice, 
	max(Price) as MaxPrice 
from Products
group by Category;

--9
select CustomerID, SUM(SaleAmount) as TotalSales
from Sales
group by CustomerID;

--10
select DepartmentName, count(*) as EmployeeCount
from Employees
group by DepartmentName
Having Count(*) > 5;

--Medium
--11
select p.Category, 
	SUM(s.SaleAmount) as TotalSales,
	AVG(s.SaleAmount) as AVGSales
from Sales s
join Products p on s.ProductID = p.ProductID
group by p.Category;

--12
select count(*) as HREmployees
from Employees
where DepartmentName = 'HR';

--13
select DepartmentName,
	max(Salary) as MaxSalary,
	min(Salary) as MinSalary
from Employees
group by DepartmentName;

--4
select DepartmentName,
	AVG(Salary) as AvgSalary
from Employees
group by DepartmentName;

--5
select DepartmentName, 
	AVG(Salary) as AvgSalary
from Employees
group by DepartmentName;

--6
select Category,
	AVG(Price) as AvgPrice
from Products
Group by Category
Having Avg(Price) > 400;

--7
select year(SaleDate) as SaleYear,
	SUM(SaleAmount) as TotalSales
from Sales
group by year(SaleDate);

--8
Select CustomerID,
	count(*) as OrderCount
from Orders
group by CustomerID having count(*) >= 3;

--9
select DepartmentName, 
	AVG(Salary) as AvgSalary
	from Employees
	group by DepartmentName
	having AVG(Salary) > 60000;
