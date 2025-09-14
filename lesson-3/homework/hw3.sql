--1
BULK  INSERT - перенос больших объемов данных из файлов .txt .csv

--2
.txt - блокнот
.csv - таблицы с разделителями в excel
.xls - excel файл
.xml - excel файл с поддержкой макросов

--3
create TABLE Products (ProductID INT primary key, ProductName varchar(50), Price Decimal(10,2))

--4
INSERT into Products (ProductID, ProductName, Price) VALUES
(1, 'House', 500000.0),
(2, 'Appartment', 100000.0),
(3, 'Car', 25000.0);


--5
NULL - неизвестное значение
NOT NULL - должно содержать какое-то значение

--6
ALTER TABLE Products
ADD CONSTRAINT UQ_ProductName UNIQUE (ProductName);

--7
select * FROM Products

--8
ALTER TABLE Products
ADD CategoryID INT;

--9
CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(50) UNIQUE
);

--10
IDENTITY позволяет создавать уникальные последовательные значения для заполнения столбца ID 

-- MEDIUM
--11
BULK INSERT Products
FROM '/var/opt/mssql/import/text.txt'
WITH (
    FIELDTERMINATOR = ',',  
    ROWTERMINATOR = '\r\n',   
    FIRSTROW = 2
);

--12
ALTER TABLE Products
ADD CONSTRAINT ForeignKey_Products_Categories
FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID);

--13
primary key - может быть только один, значения должны быть уникальными, без NULL
unique key - может быть несколько, значения должны быть уникальными, допускается 1 NULL

--14
ALTER table Products
ADD CONSTRAINT ForeignKey_Products_Price_Positive CHECK (price > 0);

--15
ALTER TABLE Products
ADD stock INT NOT NULL DEFAULT (0);

--16
SELECT ProductID, ProductName, ISNULL(Price, 0) AS Price
FROM Products;

UPDATE Products
set Price = ISNULL(Price, 0);

--17
FOREIGN KEY - используется для ссылочной целостности между таблицам
