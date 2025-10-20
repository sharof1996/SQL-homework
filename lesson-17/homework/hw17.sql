--1
;with Regions as (
	select distinct Region 
	from #RegionSales
	),
	Distributors as (
	select distinct Distributor
	from #RegionSales
	)
select r.Region, d.Distributor, ISNULL(rs.sales, 0) as Sales
from Regions r
cross join Distributors d
left join #RegionSales rs
	on r.Region = rs.Region and d.Distributor = rs.Distributor
order by r.Region, d.Distributor;

--2
select e1.name
from Employee e1
join Employee e2 on e1.id = e2.managerId
group by e1.id, e1.name
having count(e2.id) >= 5;

--3
select p.product_name, sum(o.unit) as unit
from Products p
join Orders o on p.product_id = o.product_id
where year (o.order_date) = 2020 and month(o.order_date) = 2
group by p.product_name
having sum(o.unit) >= 100;

--4
;with 
VendorCount as (
	select CustomerID, Vendor, count(*) as cnt
	from Orders
	group by CustomerID, Vendor
	),
Ranked as (
	select *, ROW_NUMBER() over (partition by CustomerID order by cnt desc) as rn
	from VendorCount
	)
select CustomerID, Vendor
from Ranked
where rn = 1;

--5
DECLARE @Check_Prime INT = 91;
DECLARE @i INT = 2, @flag BIT = 0;

WHILE @i <= SQRT(@Check_Prime)
BEGIN
    IF @Check_Prime % @i = 0
    BEGIN
        SET @flag = 1;
        BREAK;
    END
    SET @i += 1;
END

IF @Check_Prime <= 1
    PRINT 'This number is not prime';
ELSE IF @flag = 0
    PRINT 'This number is prime';
ELSE
    PRINT 'This number is not prime';

--6
select
	Device_id, count(distinct Locations) as no_of_location,
	(select top 1 Locations
	from Device d2
	where d2.Device_id = d1.Device_id
	group by Locations
	order by count(*) desc) as [max signal location],
	count(*) as [no of signals]
from Device d1
group by Device_id;

--7
select e.EmpID, EmpName, Salary
from Employee e
join (select DeptID, avg(Salary) as AvgSal
		from Employee
		group by DeptID) a on e.DeptID = a.DeptID
		where e.Salary > a.AvgSal;

--8
declare @winning_count INT;
select @winning_count = count(*) from Numbers;

;with TicketMatches as (
	select t.TicketID, count(n.Number) as matched_count
	from Tickets t
	left join Numbers n on t.Number = n.Number
	group by t.TicketID
	)
select sum (
			case
				when matched_count = (select count(*) from Numbers) then 100
				when matched_count > 0 then 10
				else 0
			end
			) as [Total Winnings]
from TicketMatches;

--9
;with Base as (
	select Spend_date, User_id,
			sum(case when Platform = 'Mobile' then Amount else 0 end) as mobile_amt,
			sum(case when Platform = 'Desktop' then Amount else 0 end) as desktop_amt
	from Spending
	group by Spend_date, User_id
	)
select Spend_date, 'Mobile' as Platform, 
		sum(mobile_amt) as Total_Amount,
		count(*) as Total_users
from Base
where mobile_amt > 0 and desktop_amt = 0
group by Spend_date
union all
select Spend_date, 'Desktop',
		sum(desktop_amt), count(*)
from Base
where desktop_amt > 0 and mobile_amt = 0
group by Spend_date
union all
select Spend_date, 'Both',
		sum(mobile_amt + desktop_amt), count(*)
from Base
where mobile_amt > 0 and desktop_amt > 0
group by Spend_date
order by Spend_date, Platform;

--10
WITH Numbers AS (
    SELECT 1 AS n 
	UNION ALL 
	SELECT 2 
	UNION ALL 
	SELECT 3 
	UNION ALL 
    SELECT 4 
	UNION ALL 
	SELECT 5 
	UNION ALL 
	SELECT 6 
	UNION ALL 
	SELECT 7 
	UNION ALL 
	SELECT 8 
	UNION ALL 
	SELECT 9 
	UNION ALL 
	SELECT 10
)
SELECT g.Product, 1 AS Quantity
FROM Grouped g
JOIN Numbers n ON n.n <= g.Quantity
ORDER BY g.Product;

