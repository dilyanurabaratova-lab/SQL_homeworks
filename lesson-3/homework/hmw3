--Define and explain the purpose of BULK INSERT in SQL Server

BULK INSERT is a SQL Server command used to efficiently load a large amount of data from a flat file (like a .csv or .txt file) into a database table. Its primary purpose is to provide a fast, optimized method for mass data import, bypassing the row-by-row processing that would occur with standard INSERT statements.

--List four file formats that can be imported into SQL Server.

Here are four common types:

Comma-Separated Values (CSV)

XML (Extensible Markup Language)
JSON (JavaScript Object Notation)
Excel Spreadsheets (XLS/XLSX)

create database Homeworklessonthree

Create table Products (ProductID INT PRIMARY KEY, ProductName VARCHAR(50), Price DECIMAL(10,2))

select * from Products

insert into Products values (1,'apple', 55),(2,'tangerina',65),(3,'banana',50) 

--Explain the difference between NULL and NOT NULL

The core difference between NULL and NOT NULL is that NULL represents a missing or unknown value, while NOT NULL enforces that a column must always contain a value

ALTER TABLE Products ADD CONSTRAINT UQ_Products_ProductName UNIQUE (ProductName);

--Write a comment in a SQL query explaining its purpose.

-- Adding a comment to a SQL query is simple. You can use two hyphens (--) for a single-line comment.

ALTER TABLE Products add  CategoryID int

Create  table Categories (CategoryID int PRIMARY KEY , CategoryName varchar(30) UNIQUE)

DROP TABLE Products;

-- Medium-Level Tasks (10)

Create table Products (ProductID int,ProductName varchar (30),Category varchar (30),Price int)

Bulk Insert Products
from 'C:\Users\User\Desktop\products.csv'
with(
firstrow = 2,
fieldterminator = ',',
rowterminator = '\n'
)

select * from Products


Alter table Products add foreign key (ProductID) References Categories (CategoryID)

--Explain the differences between PRIMARY KEY and UNIQUE KEY

--The key difference between a PRIMARY KEY and a UNIQUE KEY is their purpose and what they allow. Both are constraints that ensure uniqueness, but they have a few crucial distinctions.

PRIMARY KEY: Its main purpose is to uniquely identify each record in a table. It's the "official" identifier for a row, and a table can only have one PRIMARY KEY.

UNIQUE KEY: Its purpose is simply to enforce uniqueness on a column, ensuring that no two rows have the same value in that column. A table can have multiple UNIQUE KEY constraints.

ALTER TABLE Products
ADD CONSTRAINT Price CHECK (Price > 0)

ALTER TABLE Products
ADD Stock INT Default 'notnull'

SELECT ProductID, ISNULL(Price, 0) AS Price FROM Products

--Describe the purpose and usage of FOREIGN KEY constraints in SQL Server

A FOREIGN KEY is a constraint in SQL used to link two tables together. It establishes a relationship between the data in one table (the child table) and the data in another table (the parent table)

---Hard-Level Tasks

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Age INT,
    CONSTRAINT CHK_Age CHECK (Age >= 18)
);


CREATE TABLE Employees (
    EmployeeID INT IDENTITY(100, 10) PRIMARY KEY,
    Name VARCHAR(255) NOT NULL
);

CREATE TABLE OrderDetails (
    OrderID INT NOT NULL,
    ProductID INT NOT NULL,
    Quantity INT,
    CONSTRAINT PK_OrderDetails PRIMARY KEY (OrderID, ProductID)
);

--Explain the use of COALESCE and ISNULL functions for handling NULL values.
COALESCE and ISNULL are both functions used in SQL to handle NULL values by replacing them with a specified value. However, there are some important differences between them in terms of functionality and database compatibility.

CREATE TABLE Employees (
    EmployeeID INT IDENTITY(100, 10) PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Email VARCHAR(255) UNIQUE
);

CREATE TABLE EmployeeProjects (
    ProjectID INT PRIMARY KEY,
    EmployeeID INT,
    ProjectName VARCHAR(255),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);




