--Easy
--1
select CAST(EMPLOYEE_ID AS varchar) + '-' + First_Name + ' ' + Last_Name as Rusult
from Employees
where EMPLOYEE_ID = 100;

--2
update Employees
set PHONE_NUMBER = REPLACE(PHONE_NUMBER, '124', '999');

--3
select First_Name as [First Name], len(First_Name) as [Name Length]
from Employees
where left(First_Name, 1) in ('A','J','M')
order by FIRST_NAME;

--4
select Manager_ID, sum(Salary) as TotalSalary
from Employees
group by Manager_ID;

--5
select Year1,
GREATEST(max1, max2, max3) as highestvalue
from TestMax;

--6
select movie, description
from cinema
where id % 2 = 1 and description <> 'boring';

--7
select * from SingleOrder
order by case when Id = 0 then 1 else 0 end, Id;

--8
select id, coalesce(ssn, passportid, itin) as FirstNotNull
from person;

--Medium
--1
select left(FullName, charindex(' ', FullName) - 1) as FirstName,
substring(FullName, charindex(' ', FullName) + 1, charindex(' ', fullname, charindex(' ', fullname) +1) - charindex(' ', fullname) - 1) as MiddleName,
right(FullName, charindex(' ', reverse(FullName)) - 1) as LastName
from Students;

--2
select o.CustomerID, o.OrderId, o.DeliveryState, o.Amount
from Orders o
where o.DeliveryState = 'TX' and o.CustomerID in (select CustomerID 
													from Orders 
													where DeliveryState = 'CA');
--3
select string_agg(String, ' ')
within group (order by SequenceNumber) as FullQuery
from DMLTable;

--4
Select First_Name, Last_Name
from Employees
where len(replace(First_Name +  Last_Name, 'a', '')) <= len(First_Name + Last_Name) - 3;

--5
select Department_ID, count(*) as TotalEmployees, 100.0 * sum(case when DatedIFF(Year, Hire_Date, GetDate()) > 3 then 1 else 0 end) / count(*) as More3Years
from Employees
group by DEPARTMENT_ID;
