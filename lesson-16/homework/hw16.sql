--1 Create a numbers table using a recursive query from 1 to 1000.

;with cte as(
select 1 as num
UNION ALL
select num + 1 as num from cte
where num < 105
)
select * from cte
where num % 2 = 1
option(maxrecursion 1000)



--2-Write a query to find the total sales per employee using a derived table.(Sales, Employees)

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    DepartmentID INT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Salary DECIMAL(10, 2)
);

INSERT INTO Employees (EmployeeID, DepartmentID, FirstName, LastName, Salary) VALUES
(1, 1, 'John', 'Doe', 60000.00),
(2, 1, 'Jane', 'Smith', 65000.00),
(3, 2, 'James', 'Brown', 70000.00),
(4, 3, 'Mary', 'Johnson', 75000.00),
(5, 4, 'Linda', 'Williams', 80000.00),
(6, 2, 'Michael', 'Jones', 85000.00),
(7, 1, 'Robert', 'Miller', 55000.00),
(8, 3, 'Patricia', 'Davis', 72000.00),
(9, 4, 'Jennifer', 'García', 77000.00),
(10, 1, 'William', 'Martínez', 69000.00);

CREATE TABLE Sales (
    SalesID INT PRIMARY KEY,
    EmployeeID INT,
    ProductID INT,
    SalesAmount DECIMAL(10, 2),
    SaleDate DATE
);
INSERT INTO Sales (SalesID, EmployeeID, ProductID, SalesAmount, SaleDate) VALUES
-- January 2025
(1, 1, 1, 1550.00, '2025-01-02'),
(2, 2, 2, 2050.00, '2025-01-04'),
(3, 3, 3, 1250.00, '2025-01-06'),
(4, 4, 4, 1850.00, '2025-01-08'),
(5, 5, 5, 2250.00, '2025-01-10'),
(6, 6, 6, 1450.00, '2025-01-12'),
(7, 7, 1, 2550.00, '2025-01-14'),
(8, 8, 2, 1750.00, '2025-01-16'),
(9, 9, 3, 1650.00, '2025-01-18'),
(10, 10, 4, 1950.00, '2025-01-20'),
(11, 1, 5, 2150.00, '2025-02-01'),
(12, 2, 6, 1350.00, '2025-02-03'),
(13, 3, 1, 2050.00, '2025-02-05'),
(14, 4, 2, 1850.00, '2025-02-07'),
(15, 5, 3, 1550.00, '2025-02-09'),
(16, 6, 4, 2250.00, '2025-02-11'),
(17, 7, 5, 1750.00, '2025-02-13'),
(18, 8, 6, 1650.00, '2025-02-15'),
(19, 9, 1, 2550.00, '2025-02-17'),
(20, 10, 2, 1850.00, '2025-02-19'),
(21, 1, 3, 1450.00, '2025-03-02'),
(22, 2, 4, 1950.00, '2025-03-05'),
(23, 3, 5, 2150.00, '2025-03-08'),
(24, 4, 6, 1700.00, '2025-03-11'),
(25, 5, 1, 1600.00, '2025-03-14'),
(26, 6, 2, 2050.00, '2025-03-17'),
(27, 7, 3, 2250.00, '2025-03-20'),
(28, 8, 4, 1350.00, '2025-03-23'),
(29, 9, 5, 2550.00, '2025-03-26'),
(30, 10, 6, 1850.00, '2025-03-29'),
(31, 1, 1, 2150.00, '2025-04-02'),
(32, 2, 2, 1750.00, '2025-04-05'),
(33, 3, 3, 1650.00, '2025-04-08'),
(34, 4, 4, 1950.00, '2025-04-11'),
(35, 5, 5, 2050.00, '2025-04-14'),
(36, 6, 6, 2250.00, '2025-04-17'),
(37, 7, 1, 2350.00, '2025-04-20'),
(38, 8, 2, 1800.00, '2025-04-23'),
(39, 9, 3, 1700.00, '2025-04-26'),
(40, 10, 4, 2000.00, '2025-04-29'),
(41, 1, 5, 2200.00, '2025-05-03'),
(42, 2, 6, 1650.00, '2025-05-07'),
(43, 3, 1, 2250.00, '2025-05-11'),
(44, 4, 2, 1800.00, '2025-05-15'),
(45, 5, 3, 1900.00, '2025-05-19'),
(46, 6, 4, 2000.00, '2025-05-23'),
(47, 7, 5, 2400.00, '2025-05-27'),
(48, 8, 6, 2450.00, '2025-05-31'),
(49, 9, 1, 2600.00, '2025-06-04'),
(50, 10, 2, 2050.00, '2025-06-08'),
(51, 1, 3, 1550.00, '2025-06-12'),
(52, 2, 4, 1850.00, '2025-06-16'),
(53, 3, 5, 1950.00, '2025-06-20'),
(54, 4, 6, 1900.00, '2025-06-24'),
(55, 5, 1, 2000.00, '2025-07-01'),
(56, 6, 2, 2100.00, '2025-07-05'),
(57, 7, 3, 2200.00, '2025-07-09'),
(58, 8, 4, 2300.00, '2025-07-13'),
(59, 9, 5, 2350.00, '2025-07-17'),
(60, 10, 6, 2450.00, '2025-08-01');

SELECT e.EmployeeID,
       e.FirstName,
       s.total_sales
FROM Employees e
JOIN (
    SELECT EmployeeID, SUM(SalesAmount) AS total_sales
    FROM Sales
    GROUP BY EmployeeID
) s
  ON e.EmployeeID = s.EmployeeID;

 --3--Create a CTE to find the average salary of employees.(Employees)

 WITH AvgSalaryCTE AS (
    SELECT AVG(salary) AS avg_salary
    FROM Employees
)
SELECT avg_salary
FROM AvgSalaryCTE

--4-Write a query using a derived table to find the highest sales for each product.(Sales, Products)

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    CategoryID INT,
    ProductName VARCHAR(100),
    Price DECIMAL(10, 2)
);

INSERT INTO Products (ProductID, CategoryID, ProductName, Price) VALUES
(1, 1, 'Laptop', 1000.00),
(2, 1, 'Smartphone', 800.00),
(3, 2, 'Tablet', 500.00),
(4, 2, 'Monitor', 300.00),
(5, 3, 'Headphones', 150.00),
(6, 3, 'Mouse', 25.00),
(7, 4, 'Keyboard', 50.00),
(8, 4, 'Speaker', 200.00),
(9, 5, 'Smartwatch', 250.00),
(10, 5, 'Camera', 700.00);

SELECT p.ProductID,
       p.ProductName,
       s.max_sale
FROM Products p
JOIN (
    SELECT ProductID, MAX(SalesAmount) AS max_sale
    FROM Sales
    GROUP BY ProductID
) s
  ON p.ProductID = s.ProductID

  --5--Beginning at 1, write a statement to double the number for each record, the max value you get should be less than 1000000.


  WITH nums(n) AS (
  SELECT CAST(1 AS BIGINT)
  UNION ALL
  SELECT n * 2
  FROM nums
  WHERE n * 2 < 1000000
)
SELECT n
FROM nums
ORDER BY n
OPTION (MAXRECURSION 0)

--6-Use a CTE to get the names of employees who have made more than 5 sales.(Sales, Employees)

WITH SalesCount AS (
    SELECT 
        s.EmployeeID,
        COUNT(*) AS TotalSales
    FROM Sales s
    GROUP BY s.EmployeeID
)
SELECT e.FirstName, sc.TotalSales
FROM SalesCount sc
JOIN Employees e ON e.EmployeeID = sc.EmployeeID
WHERE sc.TotalSales > 5

--7--Write a query using a CTE to find all products with sales greater than $500.(Sales, Products)

WITH ProductSales AS (
    SELECT 
        s.ProductID,
        SUM(s.SalesAmount) AS TotalSales
    FROM Sales s
    GROUP BY s.ProductID
)
SELECT p.ProductName, ps.TotalSales
FROM ProductSales ps
JOIN Products p ON p.ProductID = ps.ProductID
WHERE ps.TotalSales > 500

--8--Create a CTE to find employees with salaries above the average salary.(Employees)

WITH AvgSalary AS (
    SELECT AVG(Salary) AS AvgSal
    FROM Employees
)
SELECT e.EmployeeID, e.FirstName, e.Salary
FROM Employees e
JOIN AvgSalary a ON e.Salary > a.AvgSal

-- medium -- 
--1-- Write a query using a derived table to find the top 5 employees by the number of orders made.(Employees, Sales)

SELECT TOP 5 dt.EmployeeID, e.FirstName, dt.OrderCount
FROM (
    SELECT EmployeeID, COUNT(*) AS OrderCount
    FROM Sales
    GROUP BY EmployeeID
) AS dt
JOIN Employees e ON dt.EmployeeID = e.EmployeeID
ORDER BY dt.OrderCount DESC


 --2-Write a query using a derived table to find the sales per product category.(Sales, Products)

 SELECT 
    p.CategoryID,
    SUM(sales_by_product.total_sales) AS total_sales_per_category
FROM Products p
JOIN (
    SELECT 
        ProductID,
        SUM(SalesAmount) AS total_sales
    FROM Sales
    GROUP BY ProductID
) AS sales_by_product
    ON p.ProductID = sales_by_product.ProductID
GROUP BY p.CategoryID

--3-Write a script to return the factorial of each value next to it.(Numbers1)

CREATE TABLE Numbers1(Number INT)

INSERT INTO Numbers1 VALUES (5),(9),(8),(6),(7)
select * from Numbers1



;WITH FactorialCTE AS (
   
    SELECT 
        Number,
        1 AS i,
        1 AS fact
    FROM Numbers1

    UNION ALL

    
    SELECT 
        f.Number,
        f.i + 1,
        f.fact * (f.i + 1)
    FROM FactorialCTE f
    WHERE f.i < f.Number
)
SELECT 
    Number,
    MAX(fact) AS factorial
FROM FactorialCTE
GROUP BY Number
ORDER BY Number
OPTION (MAXRECURSION 0);


--4 This script uses recursion to split a string into rows of substrings for each character in the string.(Example)


WITH SplitCTE AS (
   
    SELECT 
        1 AS pos,
        SUBSTRING('Example', 1, 1) AS ch
    UNION ALL
   
    SELECT 
        pos + 1,
        SUBSTRING('Example', pos + 1, 1)
    FROM SplitCTE
    WHERE pos < LEN('Example')
)
SELECT pos, ch
FROM SplitCTE
OPTION (MAXRECURSION 0)

--5-Use a CTE to calculate the sales difference between the current month and the previous month.(Sales)

WITH MonthlySales AS (
    SELECT
        DATEPART(YEAR, SaleDate) AS yr,
        DATEPART(MONTH, SaleDate) AS mn,
        SUM(SalesAmount) AS total_sales
    FROM Sales
    GROUP BY DATEPART(YEAR, SaleDate), DATEPART(MONTH, SaleDate)
)
SELECT
    yr,
    mn,
    total_sales,
    total_sales - LAG(total_sales) OVER (ORDER BY yr, mn) AS sales_diff
FROM MonthlySales
ORDER BY yr, mn

--6-Create a derived table to find employees with sales over $45000 in each quarter.(Sales, Employees)

SELECT 
    e.EmployeeID,
    e.FirstName,
    q.yr,
    q.qtr,
    q.total_sales
FROM Employees e
JOIN (
    SELECT 
        EmployeeID,
        DATEPART(YEAR, SaleDate) AS yr,
        DATEPART(QUARTER, SaleDate) AS qtr,
        SUM(SalesAmount) AS total_sales
    FROM Sales
    GROUP BY EmployeeID, DATEPART(YEAR, SaleDate), DATEPART(QUARTER, SaleDate)
    HAVING SUM(SalesAmount) > 45000
) AS q
    ON e.EmployeeID = q.EmployeeID
ORDER BY q.yr, q.qtr, q.total_sales DESC

--harder 
--1 -- This script uses recursion to calculate Fibonacci numbers

; with cte as 
(
select 0 as fibbonaci_num, 1 as incr
UNION ALL
select fibbonaci_num + incr as num, fibbonaci_num as incr from cte
where fibbonaci_num < 100
)
select * from cte
where fibbonaci_num >=5

--2-- Find a string where all characters are the same and the length is greater than 1.(FindSameCharacters)

CREATE TABLE FindSameCharacters
(
     Id INT
    ,Vals VARCHAR(10)
)
 
INSERT INTO FindSameCharacters VALUES
(1,'aa'),
(2,'cccc'),
(3,'abc'),
(4,'aabc'),
(5,NULL),
(6,'a'),
(7,'zzz'),
(8,'abc')

SELECT Vals
FROM FindSameCharacters
WHERE LEN(Vals) > 1
  AND Vals NOT LIKE '%[^' + LEFT(Vals,1) + ']%'

  --3--Create a numbers table that shows all numbers 1 through n and their order gradually increasing by the next number in the sequence.(Example:n=5 | 1, 12, 123, 1234, 12345)


;with cte as(
select 1 as my_num, cast('1' as varchar(90)) as my_char
union all
select my_num + 1 as my_num, cast((my_char + cast((my_num + 1) as varchar(90))) as varchar(90)) as my_char from cte
where my_num < 21
)
select * from cte

-- 4 Write a query using a derived table to find the employees who have made the most sales in the last 6 months.(Employees,Sales)

SELECT 
    e.EmployeeID,
    e.FirstName,
    t.total_sales
FROM Employees e
JOIN (
    SELECT 
        s.EmployeeID,
        SUM(SalesAmount) AS total_sales
    FROM Sales s
    WHERE s.SaleDate >= DATEADD(MONTH, -6, GETDATE())
    GROUP BY s.EmployeeID
) AS t
    ON e.EmployeeID = t.EmployeeID
WHERE t.total_sales = (
    SELECT MAX(total_sales)
    FROM (
        SELECT EmployeeID, SUM(SalesAmount) AS total_sales
        FROM Sales
        WHERE SaleDate >= DATEADD(MONTH, -6, GETDATE())
        GROUP BY EmployeeID
    ) AS x
);

-- 5 - Write a T-SQL query to remove the duplicate integer values present in the string column. Additionally, remove the single integer character that appears in the string.(RemoveDuplicateIntsFromNames)

CREATE TABLE RemoveDuplicateIntsFromNames
(
      PawanName INT
    , Pawan_slug_name VARCHAR(1000)
)
 
 
INSERT INTO RemoveDuplicateIntsFromNames VALUES
(1,  'PawanA-111'  ),
(2, 'PawanB-123'   ),
(3, 'PawanB-32'    ),
(4, 'PawanC-4444' ),
(5, 'PawanD-3'  )

select * from RemoveDuplicateIntsFromNames

;WITH SplitInts AS (
    SELECT 
        PawanName,
        TRIM([value]) AS part
    FROM RemoveDuplicateIntsFromNames
    CROSS APPLY STRING_SPLIT(Pawan_slug_name, '') 
),
Filtered AS (
    SELECT 
        PawanName,
        part
    FROM SplitInts
    WHERE part NOT LIKE '[0-9]'  
       OR LEN(part) > 1          
)
SELECT 
    r.PawanName,
    (
        SELECT DISTINCT f.part
        FROM Filtered f
        WHERE f.PawanName = r.PawanName
        FOR XML PATH(''), TYPE
    ).value('.', 'nvarchar(50)') AS cleaned_val
FROM RemoveDuplicateIntsFromNames r
GROUP BY r.PawanName;
