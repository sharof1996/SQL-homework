--easy
--1
select id, left(Name, charindex(',', Name) - 1) as FirstName,
Right(Name, Len(Name) - CHARINDEX(',', Name)) as LastName
from TestMultipleColumns;

--2
select * from TestPercent
where Strs like '%[%]%';

--3
select id, 
parsename(replace(Vals, '.', '.'), 2) as [Part 1],
parsename(replace(Vals, '.', '.'), 1) as [Part 2]
from splitter;

--4
select * from testDots
where len(Vals) - len(replace(Vals, '.', '')) > 2;

--5
select texts,
len(texts) - len(replace(texts, ' ', '')) as SpaceCount
from CountSpaces;

--6
select e.Name as Employee, e.Salary as EmpSalary, m.Name as Manager, m.Salary as ManSalary
from Employee e
join Employee m on e.ManagerId = m.Id
where e.Salary > m.Salary;

--7
select Employee_ID as [Employee ID], First_Name as [First Name] , Last_Name as [Last Name], Hire_Date as [Hire Date],
datediff(year, Hire_date, Getdate()) as YearsOfService
from employees
where datediff(year, Hire_Date, Getdate()) between 10 and 15;

--Medium
--8
select w2.Id, w2.RecordDate, w2.Temperature
from weather w2
join weather w1 on w2.RecordDate = DATEADD(DAY, 1, w1.RecordDate)
where w2.Temperature > w1.Temperature;

--9
select player_id, min(event_date) as FirstLoginDate
from Activity
group by player_id;

--10
select value as ThirdFruit
from string_split((select fruit_list from fruits), ',', 1)
where ordinal = 3;

--11
select Employee_Id as [Employee ID], First_Name as [First Name], Last_Name as [Last Name], Hire_date as [Hire Date],
DATEDIFF(year, Hire_Date, getdate()) as YearsWorked,
Case
	when DATEDIFF(Year, Hire_date, getdate()) < 1 then 'New Hire'
	when DATEDIFF(YEAR, Hire_date, GETDATE()) between 1 and 5 then 'Junior'
	when DATEDIFF(Year, Hire_date, GETDATE()) between 5 and 10 then 'Mid-Level'
	when DATEDIFF(Year, Hire_date, GETDATE()) between 10 and 20 then 'Senior'
	else 'Veteran'
end as EmploymentStage
from Employees;

--12
SELECT Id,
       VALS,
       LEFT(VALS, PATINDEX('%[^0-9]%', VALS + 'x') - 1) AS LeadingInteger
FROM GetIntegers
WHERE VALS IS NOT NULL AND VALS LIKE '[0-9]%';
