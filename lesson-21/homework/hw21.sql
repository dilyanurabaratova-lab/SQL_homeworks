CREATE TABLE ProductSales (
    SaleID INT PRIMARY KEY,
    ProductName VARCHAR(50) NOT NULL,
    SaleDate DATE NOT NULL,
    SaleAmount DECIMAL(10, 2) NOT NULL,
    Quantity INT NOT NULL,
    CustomerID INT NOT NULL
);
INSERT INTO ProductSales (SaleID, ProductName, SaleDate, SaleAmount, Quantity, CustomerID)
VALUES 
(1, 'Product A', '2023-01-01', 148.00, 2, 101),
(2, 'Product B', '2023-01-02', 202.00, 3, 102),
(3, 'Product C', '2023-01-03', 248.00, 1, 103),
(4, 'Product A', '2023-01-04', 149.50, 4, 101),
(5, 'Product B', '2023-01-05', 203.00, 5, 104),
(6, 'Product C', '2023-01-06', 252.00, 2, 105),
(7, 'Product A', '2023-01-07', 151.00, 1, 101),
(8, 'Product B', '2023-01-08', 205.00, 8, 102),
(9, 'Product C', '2023-01-09', 253.00, 7, 106),
(10, 'Product A', '2023-01-10', 152.00, 2, 107),
(11, 'Product B', '2023-01-11', 207.00, 3, 108),
(12, 'Product C', '2023-01-12', 249.00, 1, 109),
(13, 'Product A', '2023-01-13', 153.00, 4, 110),
(14, 'Product B', '2023-01-14', 208.50, 5, 111),
(15, 'Product C', '2023-01-15', 251.00, 2, 112),
(16, 'Product A', '2023-01-16', 154.00, 1, 113),
(17, 'Product B', '2023-01-17', 210.00, 8, 114),
(18, 'Product C', '2023-01-18', 254.00, 7, 115),
(19, 'Product A', '2023-01-19', 155.00, 3, 116),
(20, 'Product B', '2023-01-20', 211.00, 4, 117),
(21, 'Product C', '2023-01-21', 256.00, 2, 118),
(22, 'Product A', '2023-01-22', 157.00, 5, 119),
(23, 'Product B', '2023-01-23', 213.00, 3, 120),
(24, 'Product C', '2023-01-24', 255.00, 1, 121),
(25, 'Product A', '2023-01-25', 158.00, 6, 122),
(26, 'Product B', '2023-01-26', 215.00, 7, 123),
(27, 'Product C', '2023-01-27', 257.00, 3, 124),
(28, 'Product A', '2023-01-28', 159.50, 4, 125),
(29, 'Product B', '2023-01-29', 218.00, 5, 126),
(30, 'Product C', '2023-01-30', 258.00, 2, 127);

--1 Write a query to assign a row number to each sale based on the SaleDate.

SELECT * FROM ProductSales

SELECT *,
    ROW_NUMBER() OVER (ORDER BY SaleDate) AS RowNum
FROM ProductSales;
-- 2 Write a query to rank products based on the total quantity sold. give the same rank for the same amounts without skipping numbers.

SELECT
    ProductName,
    SUM(Quantity) AS TotalQuantitySold,
    DENSE_RANK() OVER (ORDER BY SUM(Quantity) DESC) AS ProductRank
FROM ProductSales
GROUP BY ProductName
ORDER BY ProductRank;

-- 3 Write a query to identify the top sale for each customer based on the SaleAmount. 

SELECT
    *
FROM (
    SELECT
        *,
        ROW_NUMBER() OVER (PARTITION BY CustomerID ORDER BY SaleAmount DESC) AS rn
    FROM ProductSales
) AS RankedSales
WHERE rn = 1;

--4 Write a query to display each sale's amount along with the next sale amount in the order of SaleDate.

SELECT
    SaleID,
    ProductName,
    SaleDate,
    SaleAmount,
    LEAD(SaleAmount) OVER (ORDER BY SaleDate) AS NextSaleAmount
FROM ProductSales
ORDER BY SaleDate;

--5 Write a query to display each sale's amount along with the previous sale amount in the order of SaleDate.

SELECT
    SaleID,
    ProductName,
    SaleDate,
    SaleAmount,
    LAG(SaleAmount) OVER (ORDER BY SaleDate) AS PreviousSaleAmount
FROM ProductSales
ORDER BY SaleDate;

--6 Write a query to identify sales amounts that are greater than the previous sale's amount

;with cte as (SELECT *,
    LAG(SaleAmount) OVER (ORDER BY SaleDate) AS PreviousSaleAmount
FROM ProductSales )
select * from cte
WHERE SaleAmount > PreviousSaleAmount
ORDER BY SaleDate;

--7 Write a query to calculate the difference in sale amount from the previous sale for every product

SELECT
   *,
    LAG(SaleAmount) OVER (PARTITION BY ProductName ORDER BY SaleDate) AS PreviousSaleAmount,
    SaleAmount - LAG(SaleAmount) OVER (PARTITION BY ProductName ORDER BY SaleDate) AS DifferenceFromPrevious
FROM ProductSales
ORDER BY ProductName, SaleDate;
-- 8 Write a query to compare the current sale amount with the next sale amount in terms of percentage change.

SELECT
    SaleID,
    ProductName,
    SaleDate,
    SaleAmount,
    LEAD(SaleAmount) OVER (ORDER BY SaleDate) AS NextSaleAmount,
    ROUND(
        ((LEAD(SaleAmount) OVER (ORDER BY SaleDate) - SaleAmount) / SaleAmount) * 100, 
        2
    ) AS PercentageChange
FROM ProductSales
ORDER BY SaleDate;

-- 9 Write a query to calculate the ratio of the current sale amount to the previous sale amount within the same product.

SELECT
    SaleID,
    ProductName,
    SaleDate,
    SaleAmount,
    LAG(SaleAmount) OVER (PARTITION BY ProductName ORDER BY SaleDate) AS PreviousSaleAmount,
    ROUND(
        SaleAmount / LAG(SaleAmount) OVER (PARTITION BY ProductName ORDER BY SaleDate),
        2
    ) AS SaleRatio
FROM ProductSales
ORDER BY ProductName, SaleDate;

--10 Write a query to calculate the difference in sale amount from the very first sale of that product.

SELECT
    SaleID,
    ProductName,
    SaleDate,
    SaleAmount,
    FIRST_VALUE(SaleAmount) OVER (PARTITION BY ProductName ORDER BY SaleDate) AS FirstSaleAmount,
    SaleAmount - FIRST_VALUE(SaleAmount) OVER (PARTITION BY ProductName ORDER BY SaleDate) AS DifferenceFromFirst
FROM ProductSales
ORDER BY ProductName, SaleDate;

-- 11 Write a query to find sales that have been increasing continuously for a product (i.e., each sale amount is greater than the previous sale amount for that product).

; with cte as  (
    SELECT
      *,
        LAG(SaleAmount) OVER (PARTITION BY ProductName ORDER BY SaleDate) AS PrevSaleAmount
    FROM ProductSales
)
select * from cte
WHERE SaleAmount > PrevSaleAmount
ORDER BY ProductName, SaleDate;

--12 Write a query to calculate a "closing balance"(running total) for sales amounts which adds the current sale amount to a running total of previous sales.

SELECT * ,
    SUM(SaleAmount) OVER (
        ORDER BY SaleDate
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS ClosingBalance
FROM ProductSales
ORDER BY SaleDate;

-- 13 Write a query to calculate the moving average of sales amounts over the last 3 sales.

select * , AVG (saleamount) over (order by saledate) AS MovingAvg_Last3Sales 
from ProductSales
order by SaleDate

-- 14  Write a query to show the difference between each sale amount and the average sale amount.

SELECT * , 
    SaleAmount - AVG(SaleAmount) OVER () AS DifferenceFromAvg
FROM ProductSales
ORDER BY SaleDate;




CREATE TABLE Employees1 (
    EmployeeID   INT PRIMARY KEY,
    Name         VARCHAR(50),
    Department   VARCHAR(50),
    Salary       DECIMAL(10,2),
    HireDate     DATE
);

INSERT INTO Employees1 (EmployeeID, Name, Department, Salary, HireDate) VALUES
(1, 'John Smith', 'IT', 60000.00, '2020-03-15'),
(2, 'Emma Johnson', 'HR', 50000.00, '2019-07-22'),
(3, 'Michael Brown', 'Finance', 75000.00, '2018-11-10'),
(4, 'Olivia Davis', 'Marketing', 55000.00, '2021-01-05'),
(5, 'William Wilson', 'IT', 62000.00, '2022-06-12'),
(6, 'Sophia Martinez', 'Finance', 77000.00, '2017-09-30'),
(7, 'James Anderson', 'HR', 52000.00, '2020-04-18'),
(8, 'Isabella Thomas', 'Marketing', 58000.00, '2019-08-25'),
(9, 'Benjamin Taylor', 'IT', 64000.00, '2021-11-17'),
(10, 'Charlotte Lee', 'Finance', 80000.00, '2016-05-09'),
(11, 'Ethan Harris', 'IT', 63000.00, '2023-02-14'),
(12, 'Mia Clark', 'HR', 53000.00, '2022-09-05'),
(13, 'Alexander Lewis', 'Finance', 78000.00, '2015-12-20'),
(14, 'Amelia Walker', 'Marketing', 57000.00, '2020-07-28'),
(15, 'Daniel Hall', 'IT', 61000.00, '2018-10-13'),
(16, 'Harper Allen', 'Finance', 79000.00, '2017-03-22'),
(17, 'Matthew Young', 'HR', 54000.00, '2021-06-30'),
(18, 'Ava King', 'Marketing', 56000.00, '2019-04-16'),
(19, 'Lucas Wright', 'IT', 65000.00, '2022-12-01'),
(20, 'Evelyn Scott', 'Finance', 81000.00, '2016-08-07');

-- 15 Find Employees Who Have the Same Salary Rank

WITH Ranked AS (
    SELECT *,
        DENSE_RANK() OVER (ORDER BY Salary DESC) AS SalaryRank
    FROM Employees1
)
SELECT *
   FROM Ranked r1
WHERE r1.SalaryRank IN (
    SELECT SalaryRank
    FROM Ranked
    GROUP BY SalaryRank
    HAVING COUNT(*) > 1
)
ORDER BY r1.SalaryRank, r1.Salary DESC;

-- 16 Identify the Top 2 Highest Salaries in Each Department

SELECT * 
FROM (
    SELECT
     *,
        DENSE_RANK() OVER (PARTITION BY Department ORDER BY Salary DESC) AS SalaryRank
    FROM Employees1
) AS Ranked
WHERE SalaryRank <= 2
ORDER BY Department, Salary DESC;

-- 17 Find the Lowest-Paid Employee in Each Department

SELECT * 
   FROM (SELECT *, ROW_NUMBER() OVER (PARTITION BY Department ORDER BY Salary ASC) AS SalaryRank
    FROM Employees1
) AS Ranked
WHERE SalaryRank = 1
ORDER BY Department;

-- 18 Calculate the Running Total of Salaries in Each Department

SELECT * ,
    SUM(Salary) OVER (
        PARTITION BY Department
        ORDER BY HireDate
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS RunningTotal
FROM Employees1
ORDER BY Department, HireDate;

-- 19 Find the Total Salary of Each Department Without GROUP BY

SELECT *, 
    SUM(Salary) OVER (PARTITION BY Department) AS TotalDepartmentSalary
FROM Employees1
ORDER BY Department;

-- 20 Calculate the Average Salary in Each Department Without GROUP BY

SELECT *, 
    AVG(Salary) OVER (PARTITION BY Department) AS AVGDepartmentSalary
FROM Employees1
ORDER BY Department;

-- 21 Find the Difference Between an Employee’s Salary and Their Department’s Average

SELECT *,
    AVG(Salary) OVER (PARTITION BY Department) AS AvgDepartmentSalary,
    Salary - AVG(Salary) OVER (PARTITION BY Department) AS SalaryDifference
FROM Employees1
ORDER BY Department, Salary;

--22 Calculate the Moving Average Salary Over 3 Employees (Including Current, Previous, and Next)
SELECT *, 
    AVG(Salary) OVER (
        PARTITION BY Department
        ORDER BY HireDate
        ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING
    ) AS MovingAvgSalary
FROM Employees1
ORDER BY Department, HireDate;

-- 23 Find the Sum of Salaries for the Last 3 Hired Employees

SELECT *,
    SUM(Salary) OVER (
        ORDER BY HireDate DESC
        ROWS BETWEEN CURRENT ROW AND 2 FOLLOWING
    ) AS Last3HiresSalarySum
FROM Employees1
ORDER BY HireDate DESC;
