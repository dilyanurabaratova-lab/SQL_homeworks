CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10,2)
);

CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    ProductID INT,
    Quantity INT,
    SaleDate DATE,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

INSERT INTO Products (ProductID, ProductName, Category, Price)
VALUES
(1, 'Samsung Galaxy S23', 'Electronics', 899.99),
(2, 'Apple iPhone 14', 'Electronics', 999.99),
(3, 'Sony WH-1000XM5 Headphones', 'Electronics', 349.99),
(4, 'Dell XPS 13 Laptop', 'Electronics', 1249.99),
(5, 'Organic Eggs (12 pack)', 'Groceries', 3.49),
(6, 'Whole Milk (1 gallon)', 'Groceries', 2.99),
(7, 'Alpen Cereal (500g)', 'Groceries', 4.75),
(8, 'Extra Virgin Olive Oil (1L)', 'Groceries', 8.99),
(9, 'Mens Cotton T-Shirt', 'Clothing', 12.99),
(10, 'Womens Jeans - Blue', 'Clothing', 39.99),
(11, 'Unisex Hoodie - Grey', 'Clothing', 29.99),
(12, 'Running Shoes - Black', 'Clothing', 59.95),
(13, 'Ceramic Dinner Plate Set (6 pcs)', 'Home & Kitchen', 24.99),
(14, 'Electric Kettle - 1.7L', 'Home & Kitchen', 34.90),
(15, 'Non-stick Frying Pan - 28cm', 'Home & Kitchen', 18.50),
(16, 'Atomic Habits - James Clear', 'Books', 15.20),
(17, 'Deep Work - Cal Newport', 'Books', 14.35),
(18, 'Rich Dad Poor Dad - Robert Kiyosaki', 'Books', 11.99),
(19, 'LEGO City Police Set', 'Toys', 49.99),
(20, 'Rubiks Cube 3x3', 'Toys', 7.99);

INSERT INTO Sales (SaleID, ProductID, Quantity, SaleDate)
VALUES
(1, 1, 2, '2025-04-01'),
(2, 1, 1, '2025-04-05'),
(3, 2, 1, '2025-04-10'),
(4, 2, 2, '2025-04-15'),
(5, 3, 3, '2025-04-18'),
(6, 3, 1, '2025-04-20'),
(7, 4, 2, '2025-04-21'),
(8, 5, 10, '2025-04-22'),
(9, 6, 5, '2025-04-01'),
(10, 6, 3, '2025-04-11'),
(11, 10, 2, '2025-04-08'),
(12, 12, 1, '2025-04-12'),
(13, 12, 3, '2025-04-14'),
(14, 19, 2, '2025-04-05'),
(15, 20, 4, '2025-04-19'),
(16, 1, 1, '2025-03-15'),
(17, 2, 1, '2025-03-10'),
(18, 5, 5, '2025-02-20'),
(19, 6, 6, '2025-01-18'),
(20, 10, 1, '2024-12-25'),
(21, 1, 1, '2024-04-20');

-- 1 Create a temporary table named MonthlySales to store the total quantity sold and total revenue for each product in the current month.
-- 1 Return: ProductID, TotalQuantity, TotalRevenue

CREATE TABLE #MonthlySales (
    ProductID INT,
    TotalQuantity INT,
    TotalRevenue DECIMAL(18,2)
);

INSERT INTO #MonthlySales (ProductID, TotalQuantity, TotalRevenue)
SELECT 
    s.ProductID,
    SUM(s.Quantity) AS TotalQuantity,
    SUM(s.Quantity * p.Price) AS TotalRevenue
FROM Sales s
JOIN 
Products p ON s.ProductID = p.ProductID
WHERE MONTH(s.SaleDate) = MONTH(GETDATE())
  AND YEAR(s.SaleDate) = YEAR(GETDATE())
GROUP BY s.ProductID;


SELECT ProductID, TotalQuantity, TotalRevenue
FROM #MonthlySales

--2--Create a view named vw_ProductSalesSummary that returns product info along with total sales quantity across all time.
--Return: ProductID, ProductName, Category, TotalQuantitySold

SELECT * FROM Products
CREATE VIEW vw_ProductSalesSummary AS
SELECT 
    p.ProductID,
    p.ProductName,
    p.Category,
    ISNULL(SUM(s.Quantity), 0) AS TotalQuantitySold
FROM Products p
LEFT JOIN Sales s ON p.ProductID = s.ProductID
GROUP BY p.ProductID, p.ProductName, p.Category;

SELECT * FROM vw_ProductSalesSummary;

--3--Create a function named fn_GetTotalRevenueForProduct(@ProductID INT)
--Return: total revenue for the given product ID

CREATE FUNCTION fn_GetTotalRevenueForProduct (@ProductID INT)
RETURNS DECIMAL(18,2)
AS
BEGIN
    DECLARE @TotalRevenue DECIMAL(18,2);

    SELECT @TotalRevenue = SUM(s.Quantity * p.Price)
    FROM Sales s
    INNER JOIN Products p ON s.ProductID = p.ProductID
    WHERE s.ProductID = @ProductID;

    RETURN ISNULL(@TotalRevenue, 0);
END;

SELECT dbo.fn_GetTotalRevenueForProduct(1) AS TotalRevenue;

--4 Create an function fn_GetSalesByCategory(@Category VARCHAR(50))
--Return: ProductName, TotalQuantity, TotalRevenue for all products in that category.

CREATE FUNCTION fn_GetSalesByCategory (@Category VARCHAR(50))
RETURNS TABLE
AS
RETURN
(
    SELECT 
        p.ProductName,
        ISNULL(SUM(s.Quantity), 0) AS TotalQuantity,
        ISNULL(SUM(s.Quantity * p.Price), 0) AS TotalRevenue
    FROM Products p
    LEFT JOIN Sales s ON p.ProductID = s.ProductID
    WHERE p.Category = @Category
    GROUP BY p.ProductName, p.Price
);

SELECT * FROM dbo.fn_GetSalesByCategory('Electronics');

SELECT * FROM dbo.fn_GetSalesByCategory('Groceries')

--5--You have to create a function that get one argument as input from user and the function should return 'Yes' if the input number is a prime number and 'No' otherwise. You can start it like this:

CREATE FUNCTION dbo.fn_IsPrime (@Number INT)
RETURNS VARCHAR(3)
AS
BEGIN
    DECLARE @i INT = 2;
    DECLARE @IsPrime BIT = 1;  

   
    IF @Number <= 1
        RETURN 'No';

    
    WHILE @i * @i <= @Number
    BEGIN
        IF @Number % @i = 0
        BEGIN
            SET @IsPrime = 0; 
            BREAK;
        END
        SET @i = @i + 1;
    END

    IF @IsPrime = 1
        RETURN 'Yes';
    ELSE
        RETURN 'No';
END;

--6--Create a table-valued function named fn_GetNumbersBetween that accepts two integers as input

CREATE FUNCTION fn_GetNumbersBetween
(
    @Start INT,
    @End INT
)
RETURNS @Numbers TABLE (Number INT)
AS
BEGIN
    DECLARE @i INT = @Start;

    WHILE @i <= @End
    BEGIN
        INSERT INTO @Numbers (Number) VALUES (@i);
        SET @i = @i + 1;
    END

    RETURN;
END;

SELECT * FROM dbo.fn_GetNumbersBetween(5, 12)

--7--Write a SQL query to return the Nth highest distinct salary from the Employee table. If there are fewer than N distinct salaries, return NULL.

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    DepartmentID INT,
    Salary DECIMAL(10, 2),
    EmployeeName VARCHAR(100)
);

INSERT INTO Employees (EmployeeID, DepartmentID, Salary, EmployeeName) VALUES
(1, 1, 55000.00, 'John Doe'),
(2, 2, 60000.00, 'Jane Smith'),
(3, 1, 45000.00, 'James Brown'),
(4, 3, 70000.00, 'Mary Johnson'),
(5, 2, 75000.00, 'Linda Williams'),
(6, 3, 80000.00, 'Michael Jones'),
(7, 1, 65000.00, 'Robert Miller'),
(8, 4, 58000.00, 'Patricia Davis'),
(9, 5, 68000.00, 'William Martínez'),
(10, 4, 52000.00, 'Jennifer García'),
(11, 3, 54000.00, 'David Lopez'),
(12, 2, 63000.00, 'Helen Harris'),
(13, 1, 46000.00, 'Charles Taylor'),
(14, 5, 55000.00, 'Nancy Allen'),
(15, 4, 60000.00, 'Edward Clark'),
(16, 1, 50000.00, 'Sarah Lewis'),
(17, 2, 70000.00, 'Jessica Young'),
(18, 3, 76000.00, 'Kevin White'),
(19, 4, 67000.00, 'Laura King'),
(20, 5, 59000.00, 'Joseph Scott'),
(21, 1, 61000.00, 'Karen Adams'),
(22, 3, 54000.00, 'James Nelson'),
(23, 2, 58000.00, 'Christopher Perez'),
(24, 1, 65000.00, 'Matthew Hill'),
(25, 3, 49000.00, 'Rachel Jackson'),
(26, 5, 64000.00, 'Daniel Walker'),
(27, 4, 57000.00, 'Ashley Young'),
(28, 1, 60000.00, 'Helen Anderson'),
(29, 2, 63000.00, 'Brian Wright'),
(30, 5, 52000.00, 'Michael Green'),
(31, 1, 67000.00, 'Jessica Hall'),
(32, 4, 55000.00, 'Joshua Carter'),
(33, 2, 72000.00, 'Sarah Mitchell'),
(34, 3, 46000.00, 'George Perez'),
(35, 5, 50000.00, 'Rachel Collins'),
(36, 1, 54000.00, 'John Rivera'),
(37, 4, 56000.00, 'Orlando Robinson'),
(38, 3, 65000.00, 'Luis Davis'),
(39, 2, 68000.00, 'Barbara Moore'),
(40, 1, 71000.00, 'David Harris');

DECLARE @N INT = 3;  -- Example: get the 3rd highest salary

SELECT Salary
FROM (
    SELECT DISTINCT Salary,
           DENSE_RANK() OVER (ORDER BY Salary DESC) AS rnk
    FROM Employees
) AS t
WHERE rnk = @N

--8--Write a SQL query to find the person who has the most friends.

CREATE TABLE RequestAccepted (
   requester_id INT ,
    accepter_id INT,
    accept_date DATE,
   
);



INSERT INTO RequestAccepted (requester_id, accepter_id, accept_date) VALUES
(1,2,'2016/06/03'),
(1,3,'2016/06/08'),
(2,3,'2016/06/08'),
(3,4,'2016/06/09');


SELECT TOP 1 id, COUNT(*) AS num
FROM (
   
    SELECT requester_id AS id, accepter_id AS friend
    FROM RequestAccepted
    UNION ALL
   
    SELECT accepter_id AS id, requester_id AS friend
    FROM RequestAccepted
) AS AllFriends
GROUP BY id
ORDER BY COUNT(*) DESC;

--9--Create a View for Customer Order Summary.

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    city VARCHAR(50)
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT FOREIGN KEY REFERENCES Customers(customer_id),
    order_date DATE,
    amount DECIMAL(10,2)
);

-- Customers
INSERT INTO Customers (customer_id, name, city)
VALUES
(1, 'Alice Smith', 'New York'),
(2, 'Bob Jones', 'Chicago'),
(3, 'Carol White', 'Los Angeles');

-- Orders
INSERT INTO Orders (order_id, customer_id, order_date, amount)
VALUES
(101, 1, '2024-12-10', 120.00),
(102, 1, '2024-12-20', 200.00),
(103, 1, '2024-12-30', 220.00),
(104, 2, '2025-01-12', 120.00),
(105, 2, '2025-01-20', 180.00);

CREATE VIEW vw_CustomerOrderSummary AS
SELECT 
    c.customer_id,
    c.name,
    COUNT(o.order_id) AS total_orders,
    ISNULL(SUM(o.amount), 0) AS total_amount,
    MAX(o.order_date) AS last_order_date
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name

--10Write an SQL statement to fill in the missing gaps. You have to write only select statement, no need to modify the table

CREATE TABLE Gaps
(
RowNumber   INTEGER PRIMARY KEY,
TestCase    VARCHAR(100) NULL
);

INSERT INTO Gaps (RowNumber, TestCase) VALUES
(1,'Alpha'),(2,NULL),(3,NULL),(4,NULL),
(5,'Bravo'),(6,NULL),(7,NULL),(8,NULL),(9,NULL),(10,'Charlie'), (11, NULL), (12, NULL)

SELECT 
    g.RowNumber,
    g.TestCase,
    (
        SELECT TOP 1 g2.TestCase
        FROM Gaps g2
        WHERE g2.RowNumber <= g.RowNumber
          AND g2.TestCase IS NOT NULL
        ORDER BY g2.RowNumber DESC
    ) AS FilledTestCase
FROM Gaps g
ORDER BY g.RowNumber;
