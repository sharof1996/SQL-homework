--Easy
--1
with Numbers as (
	select 1 as Num
	union all
	select Num + 1
	from Numbers
	where Num < 1000
	)
select * from Numbers
option (maxrecursion 1000);

--2
select e.FirstName, e.LastName, t.TotalSales
from Employees e
join (
	select EmployeeID, Sum(SalesAmount) as TotalSales
	from Sales
	group by EmployeeID
	)
as t on e.EmployeeID = t.EmployeeID;

--3
;with AvgSalary as (
	select avg(Salary) as AvgSal
	from Employees
	)
	select e.FirstName, e.LastName, e.Salary, a.AvgSal
	from Employees e cross join AvgSalary a;

--4
select p.ProductName, t.MaxSale
from Products p
join (
	select productID, max(SalesAmount) as MaxSale
	from Sales
	group by ProductID
	) as t on p.productID = t.ProductID;

--5
;with Doubles as (
	select 1 as Num
	union all
	select Num * 2
	from Doubles
	where Num * 2 < 1000000
	)
	select * from Doubles
	option (maxrecursion 100);

--6
;with SalesCount as (
	select EmployeeID, count(*) as SaleCount
	from Sales
	group by EmployeeID
	)
	select e.FirstName, e.LastName, s.SaleCount
	from Employees e
	join SalesCount s on e.EmployeeID = s.EmployeeID
	where s.SaleCount > 5;

--7
;with GreaterSales as (
	select ProductID, sum(SalesAmount) as MaxSale
	from Sales 
	group by ProductID
	)
	select p.ProductID, p.ProductName, g.MaxSale
	from Products p
	join GreaterSales g on p.ProductID = g.ProductID
	where MaxSale > 500;

--8
;with AvgSalary as (
	select avg(salary) as AvgSal
	from Employees
	)
	select FirstName, LastName, Salary
	from Employees
	where Salary > (select AvgSal from AvgSalary);

--Medium
--9
select top 5 e.FirstName, e.LastName, t.OrderCount
from Employees e
join (
	select EmployeeID, count(*) as OrderCount
	from Sales
	group by EmployeeID
	) as t on e.EmployeeID = t.EmployeeID
	Order by t.OrderCount desc;

--10
select p.CategoryID, sum(s.SalesAmount) as TotalSales
from Sales s
join Products p on s.ProductID = p.ProductID
group by p.CategoryID

--11
;with FactorialCTE as (
	select Number, 1 as Fact, Number as Counter
	from Numbers1
	union all
	select f.Number, f.Fact * f.Counter, f.Counter - 1
	from FactorialCTE f
	where f.Counter > 1
	)
	select Number, Max(Fact) as Factorial
	from FactorialCTE
	group by Number
	order by Number;

--12
with SplitCTE as (
	select Id, left(string,1) as char, right (string, len(string)-1) as Remainder
	from Example
	union all
	select Id, left(Remainder,1), right(Remainder, len(Remainder)-1)
	from SplitCTE
	where len(Remainder) > 0
	)
	select Id, char
	from SplitCTE
	option(Maxrecursion 0);

--13
;with MonthlySales as (
	select
		format(SaleDate, 'yyyy-MM') as Month,
		sum(SalesAmount) as TotalSales
	from Sales
	group by FORMAT(SaleDate, 'yyyy-MM')
	),
SalesDiff as (
	select
		Month, TotalSales,
		LAG(TotalSales) over (order by Month) as PrevMonthSales,
		TotalSales - LAG(TotalSales) over (order by Month) as Diff
	from MonthlySales
	)
	select * from SalesDiff;

--14
select e.FirstName, e.LastName,t.Quarter, t.TotalSales
from Employees e
join (
	select EmployeeID, DATEPART(Quarter, SaleDate) as Quarter,
			sum(SalesAmount) as TotalSales
	from Sales
	group by EmployeeID, DATEPART(Quarter, SaleDate)
	) as t on e.EmployeeID = t.EmployeeID
	where t.TotalSales > 45000;

--Diff
--15
;with Fibonacci as (
	select 1 as n, 0 as a, 1 as b
	union all
	select n + 1, b, a + b
	from Fibonacci
	where n < 20
	)
	select n, a as FibonacciNumber from Fibonacci;
