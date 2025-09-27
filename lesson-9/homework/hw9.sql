--easy
--1
select p.productname, s.suppliername
from Products p
cross join suppliers s;

--2
select d.departmentname, e.name
from Departments d
cross join Employees e;

--3
select s.suppliername, p.productname
from Products p
join Suppliers s on p.SupplierID = s.SupplierID;

--4
select c.FirstName + ' ' + c.LastName as CustomerName, o.OrderId
from Orders o
join Customers c on o.CustomerID = c.CustomerID;

--5
select s.Name as StudentName, c.CourseName
from Students s
cross join Courses c;

--6
select p.ProductName, o.OrderId
from Orders o
join Products p on o.ProductID = p.ProductID; 

--7
select e.Name, d.departmentname
from Departments d
join Employees e on e.DepartmentID = d.DepartmentID;

--8
select s.Name, e.CourseId
from Students s
join Enrollments e on s.StudentID = e.StudentID;

--9
select p.OrderId, p.PaymentDate, p.Amount
from Payments p
join Orders o on p.OrderID = o.OrderID;

--10
select o.OrderID, p.ProductName, p.Price
from Products p
join Orders o on p.ProductID = o.ProductID
where p.Price > 100;

--Medium
--11
select e.Name, d.DepartmentName
from Employees e
cross join Departments d
where e.DepartmentID <> d.DepartmentID;

--12
select o.OrderID, p.ProductName, o.Quantity, p.StockQuantity
from Orders o
join Products p on o.ProductID = p.ProductID
where o.Quantity > p.StockQuantity;

--13
select c.FirstName + ' ' + c.LastName as CustomerName, s.ProductId
from Customers c
join Sales s on c.CustomerID = s.CustomerID
where s.SaleAmount >= 500;

--14
select s.Name as StudentName, c.CourseName
from Enrollments e
join Students s on e.StudentID = s.StudentID
join Courses c on e.CourseID = e.CourseID;

--15
select p.ProductName, s.SupplierName
from Products p
join Suppliers s on p.SupplierID = s.SupplierID
where s.SupplierName like '%Tech%';

--16
select o.OrderId, o.TotalAmount, p.Amount as PaymentAmount
from Orders o
join Payments p on o.OrderID = p.OrderID
where p.Amount < o.TotalAmount;

--17
select e.Name, d.DepartmentName
from Employees e
join Departments d on e.DepartmentID = d.DepartmentID;

--18
select p.ProductName, c.CategoryName
from Products p
join Categories c on p.Category = c.CategoryID
where c.CategoryName in ('Electronics','Furniture');

--19
select c.FirstName + ' ' + c.LastName as CustomerName, s.SaleAmount
from Customers c
join Sales s on c.CustomerID = s.CustomerID
where c.Country = 'USA';

--20
select c.FirstName + ' ' + c.LastName as CustomerName, o.TotalAmount
from Orders o
join Customers c on c.CustomerID = o.CustomerID
where c.Country = 'Germany' and o.TotalAmount > 100;

--Hard
--21
select e1.Name as Employee1, e2.Name as Employee2
from Employees e1
join Employees e2 on e1.EmployeeID < e2.EmployeeID
and e1.DepartmentID <> e2.DepartmentID;

--22
select pay.PaymentID, pay.OrderID, pay.Amount, (o.Quantity * p.Price) as ExpectedAmount
from Payments pay
join Orders o on pay.OrderID = o.OrderID
join Products p on o.ProductID = p.ProductID
where pay.Amount <> o.Quantity * p.Price;

--23
select s.Name
from Students s
left Join Enrollments e on s.StudentID = e.StudentID
where e.StudentID IS NULL;

--24
select distinct m.Name as ManagerName, e.Name as Employeename
from Employees m
join Employees e on e.ManagerID = m.ManagerID
where m.Salary <= e.Salary;

--25
select distinct c.FirstName + ' ' + c.LastName as CustomerName, o.orderID
from Orders o
join Customers c on o.CustomerID = c.CustomerID
join Payments p on o.OrderID = p.OrderID
where p.OrderID is null;



