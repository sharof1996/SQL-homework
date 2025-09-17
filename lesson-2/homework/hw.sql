create database homework2
go
use homework2
--Easy
--1
CREATE TABLE Employees (
    EmpID INT,
    Name VARCHAR(50),
    Salary DECIMAL(10,2)
);

--2 
-- Одиночная вставка
INSERT INTO Employees (EmpID, Name, Salary)
VALUES (1, 'Ali', 6000.00);

-- Вставка с указанием всех колонок
INSERT INTO Employees VALUES (2, 'Aziza', 5500.00);

-- Множественная вставка
INSERT INTO Employees (EmpID, Name, Salary)
VALUES 
(3, 'Bek', 4000.00),
(4, 'Dina', 3000.00);

--3
UPDATE Employees
SET Salary = 7000.00
WHERE EmpID = 1;

--4
DELETE FROM Employees
WHERE EmpID = 2;

--5
Разница между DELETE, TRUNCATE, DROP

DELETE — удаляет данные построчно, можно с условием (WHERE), структура таблицы остаётся.

TRUNCATE — удаляет все строки сразу (без условий), быстрее, структура остаётся.

DROP — полностью удаляет таблицу вместе с её структурой.

--6
ALTER TABLE Employees
ALTER COLUMN Name VARCHAR(100);

--7
ALTER TABLE Employees
ADD Department VARCHAR(50);

--8
ALTER TABLE Employees
ALTER COLUMN Salary FLOAT;

--9
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);

--10
TRUNCATE TABLE Employees;

--Medium
--11
-- Создаём временную таблицу со списком отделов
insert into Departments values (1, 'sharofiddin'), (2, 'jasur'), (3, 'nodir'), (4, 'javoxir'), (5, 'isnkander');
select * from Departments

--12
UPDATE Employees
SET Department = 'Management'
WHERE Salary > 5000;

select * from staffmembers

--13
TRUNCATE TABLE Employees;

--14
ALTER TABLE Employees
DROP COLUMN Department;

--15
EXECUTE sp_rename 'Employees', 'StaffMembers';

--16
DROP TABLE Departments;

--Hard
--17
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10,2),
    Manufacturer VARCHAR(50)
);

--18
ALTER TABLE Products
ADD CONSTRAINT CHK_Price CHECK (Price > 0);

--19
ALTER TABLE Products
ADD StockQuantity INT DEFAULT 50;

--20
EXEC sp_rename 'Products.Category', 'ProductCategory', 'COLUMN';

--21
INSERT INTO Products (ProductID, ProductName, ProductCategory, Price, Manufacturer, StockQuantity)
VALUES
(1, 'Laptop', 'Electronics', 1200.00, 'Dell', 100),
(2, 'Phone', 'Electronics', 800.00, 'Samsung', 200),
(3, 'Tablet', 'Electronics', 600.00, 'Apple', 150),
(4, 'Printer', 'Office', 300.00, 'HP', 50),
(5, 'Router', 'Networking', 150.00, 'TP-Link', 70);

--22
SELECT * INTO Products_Backup
FROM Products;

--23
EXEC sp_rename 'Products', 'Inventory';

--24
ALTER TABLE Inventory
ALTER COLUMN Price FLOAT;

--25
-- Создаём новую таблицу с IDENTITY
CREATE TABLE Inventory_New (
    ProductCode INT IDENTITY(1000,5),
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    ProductCategory VARCHAR(50),
    Price FLOAT,
    Manufacturer VARCHAR(50),
    StockQuantity INT
);

-- Переносим данные
INSERT INTO Inventory_New (ProductID, ProductName, ProductCategory, Price, Manufacturer, StockQuantity)
SELECT ProductID, ProductName, ProductCategory, Price, Manufacturer, StockQuantity FROM Inventory;

-- Удаляем старую таблицу и переименовываем новую
DROP TABLE Inventory;
EXEC sp_rename 'Inventory_New', 'Inventory';



select * from Inventory
