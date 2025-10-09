--1
select p.firstName, p.lastName, a.city, a.state
from Person p
left join Address a on p.personId = a.personId;

--2
select e.name as Employee
from Employee e
join Employee m on e.managerId = m.id
where e.salary > m.salary;

--3
SELECT email AS Email
FROM Person
GROUP BY email
HAVING COUNT(*) > 1;

--4
DELETE p
FROM Person p
WHERE p.id NOT IN (
    SELECT MIN(id)
    FROM Person
    GROUP BY email
);

--5
select ParentName
from girls
where ParentName not in (select ParentName from boys)
group by ParentName;

--6
select CustomerID, sum(SalesAmount) as TotalSales, min(Weight) as LeastWeight
from Sales.Orders
where Weight > 50
group by CustomerID;

--7
SELECT c1.Item AS [Item Cart 1],
       c2.Item AS [Item Cart 2]
FROM Cart1 c1
FULL OUTER JOIN Cart2 c2
    ON c1.Item = c2.Item;

--8
SELECT c.name AS Customers
FROM Customers c
LEFT JOIN Orders o ON c.id = o.customerId
WHERE o.customerId IS NULL;

--9
SELECT s.student_id,
       s.student_name,
       sub.subject_name,
       COUNT(e.subject_name) AS attended_exams
FROM Students s
CROSS JOIN Subjects sub
LEFT JOIN Examinations e
    ON s.student_id = e.student_id
   AND sub.subject_name = e.subject_name
GROUP BY s.student_id, s.student_name, sub.subject_name
ORDER BY s.student_id, sub.subject_name;
