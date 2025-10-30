--1
declare @StartOfMonth	date = Datefromparts(year(getdate()), month(getdate())
declare @EndOfMonth		date = Eomonth(getdate());

if OBJECT_ID('tempdb..#MonthlySales') is not null drop table #MonthlySales;
create table #MonthlySales (
	ProductID		int Primary key,
	TotalQuantity	int,
	TotalRevenue	decimal(18,2)
	);
insert into #MonthlySales (ProductID, TotalQuantity, TotalRevenue)
select s.ProductID, sum(s.Quantity), sum(s.Quantity * p.price)
from Sales s
join Products p on p.ProductID = s.ProductID
where s.SaleDate >= @StartOfMonth
	and s.SaleDate <= @EndOfMonth
group by s.ProductID;
select * from #MonthlySales order by ProductID;

--2
IF OBJECT_ID('dbo.vw_ProductSalesSummary','V') IS NOT NULL
    DROP VIEW dbo.vw_ProductSalesSummary;
GO
CREATE VIEW dbo.vw_ProductSalesSummary AS
SELECT  p.ProductID,
        p.ProductName,
        p.Category,
        SUM(ISNULL(s.Quantity,0)) AS TotalQuantitySold
FROM Products p
LEFT JOIN Sales s ON s.ProductID = p.ProductID
GROUP BY p.ProductID, p.ProductName, p.Category;


--3
IF OBJECT_ID('dbo.fn_GetTotalRevenueForProduct') IS NOT NULL
    DROP FUNCTION dbo.fn_GetTotalRevenueForProduct;
GO
CREATE FUNCTION dbo.fn_GetTotalRevenueForProduct (@ProductID int)
RETURNS decimal(18,2)
AS
BEGIN
    DECLARE @rev decimal(18,2);
    SELECT @rev = SUM(s.Quantity * p.Price)
    FROM Sales s
    JOIN Products p ON p.ProductID = s.ProductID
    WHERE s.ProductID = @ProductID;

    RETURN ISNULL(@rev, 0);
END;

--4
IF OBJECT_ID('dbo.fn_GetSalesByCategory') IS NOT NULL
    DROP FUNCTION dbo.fn_GetSalesByCategory;
GO
CREATE FUNCTION dbo.fn_GetSalesByCategory (@Category varchar(50))
RETURNS TABLE
AS
RETURN
(
    SELECT  p.ProductName,
            SUM(ISNULL(s.Quantity,0))               AS TotalQuantity,
            SUM(ISNULL(s.Quantity,0) * p.Price)     AS TotalRevenue
    FROM Products p
    LEFT JOIN Sales s ON s.ProductID = p.ProductID
    WHERE p.Category = @Category
    GROUP BY p.ProductName
);

--5
IF OBJECT_ID('dbo.fn_IsPrime') IS NOT NULL
    DROP FUNCTION dbo.fn_IsPrime;
GO
CREATE FUNCTION dbo.fn_IsPrime (@Number int)
RETURNS varchar(3)
AS
BEGIN
    IF @Number IS NULL OR @Number <= 1 RETURN 'No';
    IF @Number IN (2,3) RETURN 'Yes';
    IF @Number % 2 = 0 OR @Number % 3 = 0 RETURN 'No';

    DECLARE @i int = 5, @step int = 2;
    WHILE (@i * @i) <= @Number
    BEGIN
        IF (@Number % @i = 0) RETURN 'No';
        SET @i += @step;                 -- check 6k±1
        SET @step = 6 - @step;
    END
    RETURN 'Yes';
END;

--6
IF OBJECT_ID('dbo.fn_GetNumbersBetween') IS NOT NULL
    DROP FUNCTION dbo.fn_GetNumbersBetween;
GO
CREATE FUNCTION dbo.fn_GetNumbersBetween (@Start int, @End int)
RETURNS @t TABLE (Number int PRIMARY KEY)
AS
BEGIN
    DECLARE @a int = @Start, @b int = @End;

    -- Ensure ascending order; swap if needed
    IF @a > @b
    BEGIN
        DECLARE @tmp int = @a;
        SET @a = @b;
        SET @b = @tmp;
    END

    WHILE @a <= @b
    BEGIN
        INSERT INTO @t(Number) VALUES (@a);
        SET @a += 1;
    END
    RETURN;
END;

--7
IF OBJECT_ID('dbo.getNthHighestSalary') IS NOT NULL
    DROP FUNCTION dbo.getNthHighestSalary;
GO
CREATE FUNCTION dbo.getNthHighestSalary (@N int)
RETURNS TABLE
AS
RETURN
(
    SELECT
        CAST(
            (SELECT MAX(salary) 
             FROM (
                SELECT DISTINCT salary,
                       DENSE_RANK() OVER (ORDER BY salary DESC) AS rk
                FROM Employee
             ) d
             WHERE d.rk = @N
            ) AS int
        ) AS HighestNSalary
);

--8
WITH AllEdges AS (
    SELECT requester_id AS id, accepter_id AS friend FROM RequestAccepted
    UNION ALL
    SELECT accepter_id  AS id, requester_id AS friend FROM RequestAccepted
),
Counts AS (
    SELECT id, COUNT(DISTINCT friend) AS num
    FROM AllEdges
    GROUP BY id
)
SELECT TOP (1) id, num
FROM Counts
ORDER BY num DESC, id ASC;

--9
IF OBJECT_ID('dbo.vw_CustomerOrderSummary','V') IS NOT NULL
    DROP VIEW dbo.vw_CustomerOrderSummary;
GO
CREATE VIEW dbo.vw_CustomerOrderSummary AS
SELECT  c.customer_id,
        c.name,
        COUNT(o.order_id)                          AS total_orders,
        SUM(ISNULL(o.amount,0))                    AS total_amount,
        MAX(o.order_date)                          AS last_order_date
FROM Customers c
LEFT JOIN Orders o ON o.customer_id = c.customer_id
GROUP BY c.customer_id, c.name;

--10
SELECT  RowNumber,
        MAX(TestCase) OVER (
            ORDER BY RowNumber
            ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
        ) AS Workflow
FROM Gaps
ORDER BY RowNumber;

