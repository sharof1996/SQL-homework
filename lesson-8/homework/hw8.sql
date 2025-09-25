--easy
--1
select category, 
	count(*) as TotalProducts
from Products
group by category;

--2
select AVG(Price) as AvgPrice
	from Products
	where Category = 'Electronics';

--3
select * from Customers
where City like 'L%';

--4
select * from Products
where ProductName like '%er';

--5
select * from Customers
where Country like '%A';

--6
select Max(Price) as MaxPrice
from Products;

--7
select ProductName, StockQuantity,	
	Case when StockQuantity < 30 then 'Low Stock' else 'Sufficient'
	End as StockStatus
	from Products;

--8
select Country,
	count(*) as TotalCustomers
	from Customers
group by Country;

--9
select min(Quantity) as MinQuantity,
		max(Quantity) as MaxQuantity
		from Orders;


--Middle
--10
select distinct o.CustomerId 
from Orders o
where o.OrderDate >= '2023-01-01'
and o.OrderDate < '2023-02-01'
and o.CustomerID not in (
	select distinct i.CustomerID
	from Invoices i
	where i.InvoiceDate >= '2023-01-01'
	and i.InvoiceDate < '2023-02-01');

--11
select ProductName from Products
Union all
select ProductName from Products_Discounted;

--12
select ProductName from Products
Union 
select ProductName from Products_Discounted;

--13
select YEAR(OrderDate) as OrderYear,
	AVG(TotalAmount) as AvgOrderAmount
	from Orders
	group by year(OrderDate)
	Order by OrderYear;

--14
select ProductName,
	case when price < 100 then 'LOW'
	when Price between 100 and 500 then 'Mid'
	else 'High'
	end as PriceGroup
	from Products;

--15
select district_name, [2012], [2013]
into Population_Each_Year
from (
select district_name, population, year
from city_population
) as src
PIVOT (
	sum(population) for year in ([2012], [2013])
) as pvt;

--16
SELECT ProductID,
       SUM(SaleAmount) AS TotalSales
FROM Sales
GROUP BY ProductID;

--17
SELECT ProductName
FROM Products
WHERE ProductName LIKE '%oo%';

--18
SELECT year, [Bektemir], [Chilonzor], [Yakkasaroy]
INTO Population_Each_City
FROM (
    SELECT district_name, population, year
    FROM city_population
) AS src
PIVOT (
    SUM(population) FOR district_name IN ([Bektemir],[Chilonzor],[Yakkasaroy])
) AS pvt;


	
