CREATE TABLE Suppliers (
    SupplierID INT PRIMARY KEY,
    SupplierName VARCHAR(100),
    ContactName VARCHAR(100),
    Email VARCHAR(150)
);

INSERT INTO Suppliers (SupplierID, SupplierName, ContactName, Email) VALUES
(1, 'Tech Distributors', 'Alice Johnson', 'alice@techdist.com'),
(2, 'Gadget Supplies', 'Bob Smith', 'bob@gadgetsupplies.com'),
(3, 'Office Essentials', 'Charlie Davis', 'charlie@officeessentials.com'),
(4, 'Furniture Hub', 'Diana Adams', 'diana@furniturehub.com'),
(5, 'Clothing Mart', 'Ethan Clark', 'ethan@clothingmart.com'),
(6, 'Car Parts', 'Tom Hanks', 'tom@carparts.com'),
(7, 'Toys', 'John Adams', 'john@toysff.com');

CREATE TABLE Product (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Price DECIMAL(10, 2),
    Category VARCHAR(50),
    StockQuantity INT,
    SupplierID INT,
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID)
);

INSERT INTO Product(ProductID, ProductName, Price, Category, StockQuantity, SupplierID) VALUES
(1, 'Laptop', 1200.00, 'Electronics', 30, 1),
(2, 'Smartphone', 800.00, 'Electronics', 50, 1),
(3, 'Tablet', 400.00, 'Electronics', 40, 1),
(4, 'Monitor', 250.00, 'Electronics', 60, 1),
(5, 'Keyboard', 50.00, 'Accessories', 100, 2),
(6, 'Mouse', 30.00, 'Accessories', 120, 2),
(7, 'Chair', 150.00, 'Furniture', 80, 4),
(8, 'Desk', 200.00, 'Furniture', 75, 4),
(9, 'Pen', 5.00, 'Stationery', 300, 3),
(10, 'Notebook', 10.00, 'Stationery', 500, 3),
(11, 'Printer', 180.00, 'Electronics', 25, 1),
(12, 'Camera', 500.00, 'Electronics', 40, 1),
(13, 'Flashlight', 25.00, 'Tools', 200, 2),
(14, 'Shirt', 30.00, 'Clothing', 150, 5),
(15, 'Jeans', 45.00, 'Clothing', 120, 5),
(16, 'Jacket', 80.00, 'Clothing', 70, 5),
(17, 'Shoes', 60.00, 'Clothing', 100, 5),
(18, 'Hat', 20.00, 'Accessories', 50, 2),
(19, 'Socks', 10.00, 'Clothing', 200, 5),
(20, 'T-Shirt', 25.00, 'Clothing', 150, 5),
(21, 'Lamp', 60.00, 'Furniture', 40, 4),
(22, 'Coffee Table', 100.00, 'Furniture', 35, 4),
(23, 'Book', 15.00, 'Stationery', 250, 3),
(24, 'Rug', 90.00, 'Furniture', 60, 4),
(25, 'Cup', 5.00, 'Accessories', 500, 2),
(26, 'Bag', 25.00, 'Accessories', 300, 2),
(27, 'Couch', 450.00, 'Furniture', 15, 4),
(28, 'Fridge', 600.00, 'Electronics', 20, 1),
(29, 'Stove', 500.00, 'Electronics', 15, 1),
(30, 'Microwave', 120.00, 'Electronics', 25, 1),
(31, 'Air Conditioner', 350.00, 'Electronics', 10, 1),
(32, 'Washing Machine', 450.00, 'Electronics', 15, 1),
(33, 'Dryer', 400.00, 'Electronics', 10, 1),
(34, 'Hair Dryer', 30.00, 'Accessories', 100, 2),
(35, 'Iron', 40.00, 'Electronics', 50, 1),
(36, 'Coffee Maker', 50.00, 'Electronics', 60, 1),
(37, 'Blender', 35.00, 'Electronics', 40, 1),
(38, 'Juicer', 55.00, 'Electronics', 30, 1),
(39, 'Toaster', 40.00, 'Electronics', 70, 1),
(40, 'Dishwasher', 500.00, 'Electronics', 20, 1);

--Using Products, Suppliers table List all combinations of product names and supplier names.

SELECT 
    ProductName,
    SupplierName
FROM Product
CROSS JOIN Suppliers;

drop table employees

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(100),
    DepartmentID INT,
    Salary DECIMAL(10, 2),
    HireDate DATE,
    ManagerID INT,
    FOREIGN KEY (ManagerID) REFERENCES Employees(EmployeeID)
);

INSERT INTO Employees (EmployeeID, Name, DepartmentID, Salary, HireDate, ManagerID) VALUES
(1, 'John Doe', 1, 55000.00, '2020-01-01', NULL),  
(2, 'Jane Smith', 2, 65000.00, '2019-03-15', 1),
(3, 'Mary Johnson', 3, 45000.00, '2021-05-10', 2),
(4, 'James Brown', 5, 60000.00, '2018-07-22', 1),
(5, 'Patricia Davis', 4, 70000.00, '2017-08-30', 4),
(6, 'Michael Miller', 2, 75000.00, '2020-12-12', 2),
(7, 'Linda Wilson', 3, 48000.00, '2016-11-02', 3),
(8, 'David Moore', 4, 85000.00, '2021-09-01', 5),
(9, 'Elizabeth Taylor', 1, 60000.00, '2019-05-18', 1),
(10, 'William Anderson', 2, 64000.00, '2020-04-10', 2),
(11, 'Susan Thomas', 3, 47000.00, '2017-01-25', 3),
(12, 'Joseph Jackson', 4, 78000.00, '2016-09-30', 5),
(13, 'Karen White', 1, 59000.00, '2018-06-10', 9),
(14, 'Steven Harris', 2, 71000.00, '2021-07-15', 6),
(15, 'Nancy Clark', 3, 45000.00, '2020-02-20', 7),
(16, 'George Lewis', 4, 80000.00, '2019-11-10', 8),
(17, 'Betty Lee', 5, 55000.00, '2017-04-05', 4),
(18, 'Samuel Walker', 2, 72000.00, '2021-03-22', 6),
(19, 'Helen Hall', 3, 49000.00, '2018-10-16', 7),
(20, 'Charles Allen', 4, 90000.00, '2015-08-11', 12),
(21, 'Betty Young', 1, 53000.00, '2020-05-17', 9),
(22, 'Frank King', 2, 67000.00, '2021-02-02', 10),
(23, 'Deborah Scott', 3, 47000.00, '2019-07-09', 11),
(24, 'Matthew Green', 4, 76000.00, '2021-01-15', 16),
(25, 'Sandra Adams', 1, 54000.00, '2020-06-21', 21),
(26, 'Paul Nelson', 2, 71000.00, '2018-12-03', 10),
(27, 'Margaret Carter', 3, 46000.00, '2020-08-19', 19),
(28, 'Anthony Mitchell', 4, 82000.00, '2021-04-10', 16),
(29, 'Lisa Perez', 1, 60000.00, '2021-03-05', 21),
(30, 'Christopher Roberts', 2, 69000.00, '2019-09-24', 22),
(31, 'Jessica Gonzalez', 3, 47000.00, '2017-12-13', 23),
(32, 'Brian Moore', 5, 85000.00, '2018-11-05', 17),
(33, 'Dorothy Evans', 1, 59000.00, '2019-06-11', 25),
(34, 'Matthew Carter', 2, 70000.00, '2020-01-29', 26),
(35, 'Rachel Martinez', 3, 51000.00, '2021-06-06', 27),
(36, 'Daniel Perez', 4, 83000.00, '2021-07-01', 28),
(37, 'Catherine Roberts', 1, 60000.00, '2020-09-19', 29),
(38, 'Ronald Murphy', 2, 68000.00, '2017-02-04', 30),
(39, 'Angela Jenkins', 3, 52000.00, '2018-04-23', 31),
(40, 'Gary Wright', 4, 87000.00, '2021-01-10', 36),
(41, 'Kevin Turner', 6, 55000.00, '2022-02-14', NULL), 
(42, 'Laura Phillips', 7, 62000.00, '2023-05-22', 41),
(43, 'Eric Collins', 8, 58000.00, '2020-10-30', 41),
(44, 'Megan Edwards', 9, 70000.00, '2019-11-25', 41);

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100)
);

INSERT INTO Departments (DepartmentID, DepartmentName) VALUES
(1, 'Sales'),
(2, 'Human Resources'),
(3, 'IT'),
(4, 'Marketing'),
(5, 'Finance');

--Using Departments, Employees table Get all combinations of departments and employees.

SELECT 
    DepartmentName,
    Name
FROM Departments
CROSS JOIN Employees

--Using Products, Suppliers table List only the combinations where the supplier actually supplies the product. Return supplier name and product name

SELECT 
    s.SupplierName,
    p.ProductName
FROM Products p
INNER JOIN Suppliers s 
    ON p.SupplierID = s.SupplierID

	DROP TABLE Customers

	CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(100),
    LastName VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(50),
    Address VARCHAR(255),
    City VARCHAR(100),
    State VARCHAR(100),
    PostalCode VARCHAR(20),
    Country VARCHAR(100)
);


INSERT INTO Customers (CustomerID, FirstName, LastName, Email, Phone, Address, City, State, PostalCode, Country) VALUES
(1, 'John', 'Doe', 'johndoe@gmail.com', '555-1234', '123 Elm St', 'New York', 'NY', '10001', 'USA'),
(2, 'Jane', 'Smith', 'janesmith@yahoo.com', '555-2345', '456 Oak St', 'Los Angeles', 'CA', '90001', 'USA'),
(3, 'Alice', 'Johnson', 'alicej@outlook.com', '555-3456', '789 Pine St', 'Toronto', 'ON', 'M4B1B3', 'Canada'),
(4, 'Bob', 'Brown', 'bobbrown@hotmail.com', '555-4567', '101 Maple St', 'Vancouver', 'BC', 'V5K0A1', 'Canada'),
(5, 'Charlie', 'Davis', 'charliedavis@gmail.com', '555-5678', '202 Birch St', 'Sydney', 'NSW', '2000', 'Australia'),
(6, 'David', 'Martinez', 'davidm@live.com', '555-6789', '303 Cedar St', 'Melbourne', 'VIC', '3000', 'Australia'),
(7, 'Emily', 'Garcia', 'emilyg@yahoo.com', '555-7890', '404 Redwood St', 'London', 'England', 'SW1A 1AA', 'UK'),
(8, 'Frank', 'Hernandez', 'frankh@outlook.com', '555-8901', '505 Willow St', 'Manchester', 'England', 'M1 1AE', 'UK'),
(9, 'Grace', 'Lopez', 'gracel@gmail.com', '555-9012', '606 Aspen St', 'Birmingham', 'England', 'B1 1AA', 'UK'),
(10, 'Helen', 'Gonzalez', 'heleng@yahoo.com', '555-0123', '707 Fir St', 'Berlin', 'BE', '10117', 'Germany'),
(11, 'Irene', 'Perez', 'irenep@hotmail.com', '555-1234', '808 Maple Ave', 'Munich', 'BY', '80331', 'Germany'),
(12, 'Jack', 'Wilson', 'jackw@live.com', '555-2345', '909 Oak Ave', 'Hamburg', 'HH', '20095', 'Germany'),
(13, 'Kim', 'Anderson', 'kima@gmail.com', '555-3456', '111 Pine Ave', 'Paris', 'Île-de-France', '75001', 'France'),
(14, 'Liam', 'Thomas', 'liamt@yahoo.com', '555-4567', '222 Cedar Ave', 'Lyon', 'Auvergne-Rhône-Alpes', '69001', 'France'),
(15, 'Megan', 'Taylor', 'megant@outlook.com', '555-5678', '333 Redwood Ave', 'Marseille', 'Provence-Alpes-Côte Azur', '13001', 'France'),
(16, 'Nathan', 'Moore', 'nathanm@hotmail.com', '555-6789', '444 Willow Ave', 'Tokyo', 'TK', '100-0001', 'Japan'),
(17, 'Olivia', 'Jackson', 'oliviaj@gmail.com', '555-7890', '555 Birch Ave', 'Osaka', 'OS', '530-0001', 'Japan'),
(18, 'Paul', 'White', 'paulw@yahoo.com', '555-8901', '666 Maple Blvd', 'Kyoto', 'KY', '600-8001', 'Japan'),
(19, 'Quincy', 'Lee', 'quincyl@outlook.com', '555-9012', '777 Oak Blvd', 'Seoul', 'SO', '04547', 'South Korea'),
(20, 'Rachel', 'Harris', 'rachelh@hotmail.com', '555-0123', '888 Pine Blvd', 'Busan', 'BU', '48058', 'South Korea'),
(21, 'Sam', 'Clark', 'samc@gmail.com', '555-1234', '999 Cedar Blvd', 'Incheon', 'IC', '22382', 'South Korea'),
(22, 'Tina', 'Allen', 'tinaallen@yahoo.com', '555-2345', '1010 Redwood Blvd', 'Mexico City', 'CMX', '01000', 'Mexico'),
(23, 'Ursula', 'Scott', 'ursulas@outlook.com', '555-3456', '1111 Willow Blvd', 'Guadalajara', 'JAL', '44100', 'Mexico'),
(24, 'Victor', 'Adams', 'victora@hotmail.com', '555-4567', '1212 Birch Blvd', 'Monterrey', 'NLE', '64000', 'Mexico'),
(25, 'Walter', 'Baker', 'walterb@live.com', '555-5678', '1313 Oak Blvd', 'New York', 'NY', '10001', 'USA'),
(26, 'Xander', 'Nelson', 'xandern@gmail.com', '555-6789', '1414 Cedar Blvd', 'Los Angeles', 'CA', '90001', 'USA'),
(27, 'Yvonne', 'Carter', 'yvonnec@yahoo.com', '555-7890', '1515 Maple Dr', 'Chicago', 'IL', '60601', 'USA'),
(28, 'Zane', 'Mitchell', 'zanem@outlook.com', '555-8901', '1616 Redwood Dr', 'Houston', 'TX', '77001', 'USA'),
(29, 'Anna', 'Roberts', 'annar@hotmail.com', '555-9012', '1717 Willow Dr', 'Sydney', 'NSW', '2000', 'Australia'),
(30, 'Ben', 'King', 'benk@live.com', '555-0123', '1818 Birch Dr', 'Melbourne', 'VIC', '3000', 'Australia'),
(31, 'Chloe', 'Green', 'chloeg@gmail.com', '555-1234', '1919 Oak Dr', 'Toronto', 'ON', 'M4B1B3', 'Canada'),
(32, 'Daniel', 'Evans', 'daniele@yahoo.com', '555-2345', '2020 Cedar Dr', 'Vancouver', 'BC', 'V5K0A1', 'Canada'),
(33, 'Ella', 'Collins', 'ellac@outlook.com', '555-3456', '2121 Redwood Dr', 'London', 'England', 'SW1A 1AA', 'UK'),
(34, 'Finn', 'Morris', 'finnm@hotmail.com', '555-4567', '2222 Willow St', 'Manchester', 'England', 'M1 1AE', 'UK'),
(35, 'Grace', 'Lee', 'gracel@live.com', '555-5678', '2323 Birch St', 'Berlin', 'BE', '10117', 'Germany'),
(36, 'Holly', 'Martinez', 'hollym@gmail.com', '555-6789', '2424 Oak St', 'Munich', 'BY', '80331', 'Germany'),
(37, 'Ian', 'Robinson', 'ianr@yahoo.com', '555-7890', '2525 Cedar St', 'Warsaw', 'WA', '00-001', 'Poland'),
(38, 'Jasmine', 'Walker', 'jasminew@outlook.com', '555-8901', '2626 Redwood St', 'Lisbon', 'LI', '1100-148', 'Portugal'),
(39, 'Kyle', 'Young', 'kyley@hotmail.com', '555-9012', '2727 Willow St', 'Pittsburgh', 'PA', '15201','USA'),
(40, 'Liam', 'Harris', 'liamh@live.com', '555-0123', '2828 Birch St', 'Richmond', 'VA', '23220','USA');
	SELECT 
    c.FirstName,
    o.OrderID
FROM Orders o
INNER JOIN Customers c
    ON o.CustomerID = c.CustomerID

	CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100),
    Instructor VARCHAR(100)
);

CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(100),
    Age INT,
    Major VARCHAR(50)
);

INSERT INTO Students (StudentID, Name, Age, Major) VALUES
(1, 'Alice Johnson', 20, 'Computer Science'),
(2, 'Bob Smith', 21, 'Mathematics'),
(3, 'Charlie Brown', 22, 'Physics'),
(4, 'David Wilson', 19, 'Engineering'),
(5, 'Emma Davis', 20, 'Biology'),
(6, 'Frank Moore', 23, 'Business'),
(7, 'Grace Taylor', 21, 'Mathematics'),
(8, 'Henry Anderson', 20, 'Economics'),
(9, 'Isabella Thomas', 22, 'Chemistry'),
(10, 'Jack White', 19, 'Computer Science'),
(11, 'Karen Harris', 20, 'Mathematics'),
(12, 'Liam Martin', 21, 'Engineering'),
(13, 'Mia Clark', 22, 'Biology'),
(14, 'Noah Lewis', 20, 'Physics'),
(15, 'Olivia Walker', 19, 'Business'),
(16, 'Paul Hall', 22, 'Computer Science'),
(17, 'Quinn Young', 21, 'Economics'),
(18, 'Rachel King', 20, 'Chemistry'),
(19, 'Samuel Allen', 23, 'Engineering'),
(20, 'Taylor Scott', 21, 'Mathematics'),
(21, 'Ursula Green', 20, 'Biology'),
(22, 'Victor Adams', 22, 'Physics'),
(23, 'Wendy Baker', 19, 'Business'),
(24, 'Xavier Cooper', 20, 'Computer Science'),
(25, 'Yvonne Nelson', 21, 'Mathematics'),
(26, 'Zachary Carter', 22, 'Engineering'),
(27, 'Amelia Wright', 20, 'Biology'),
(28, 'Benjamin Mitchell', 19, 'Physics'),
(29, 'Charlotte Perez', 22, 'Business'),
(30, 'Daniel Roberts', 21, 'Economics'),
(31, 'Eleanor Stewart', 20, 'Chemistry'),
(32, 'Frederick Reed', 23, 'Engineering'),
(33, 'Gabriella Howard', 21, 'Mathematics'),
(34, 'Harrison Bell', 20, 'Biology'),
(35, 'Ivy Collins', 22, 'Physics'),
(36, 'Jason Murphy', 19, 'Business'),
(37, 'Kylie Foster', 21, 'Computer Science'),
(38, 'Lucas Jenkins', 20, 'Economics'),
(39, 'Madeline Perry', 22, 'Chemistry'),
(40, 'Nathan Griffin', 19, 'Engineering');

INSERT INTO Courses (CourseID, CourseName, Instructor) VALUES
(1, 'Math 101', 'Dr. Adams'),
(2, 'Physics 101', 'Dr. Brown'),
(3, 'Biology 101', 'Dr. Carter'),
(4, 'Computer Science 101', 'Dr. Davis'),
(5, 'Business 101', 'Dr. Evans');

SELECT 
    s.Name,
    c.CourseName
FROM Students s
CROSS JOIN Courses c;

SELECT 
    p.ProductName,
    o.OrderID
FROM Products p
INNER JOIN Orders o
    ON p.ProductID = o.ProductID;

	SELECT 
    e.Name,
    d.DepartmentName
FROM Employees e
INNER JOIN Departments d
    ON e.DepartmentID = d.DepartmentID;

	CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY IDENTITY,
    StudentID INT,
    CourseID INT,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

INSERT INTO Enrollments (StudentID, CourseID) VALUES
(1, 1), (2, 1), (7, 1), (11, 1), (20, 1), (25, 1), (33, 1),
(3, 2), (9, 2), (14, 2), (22, 2), (28, 2), (35, 2),
(5, 3), (13, 3), (21, 3), (27, 3), (34, 3),
(10, 4), (16, 4), (24, 4), (30, 4), (37, 4),
(6, 5), (15, 5), (23, 5), (29, 5), (36, 5);

	SELECT 
    s.Name,
    e.CourseID
FROM Students s
INNER JOIN Enrollments e
    ON s.StudentID = e.StudentID;


	CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY,
    OrderID INT NULL,
    PaymentDate DATE,
    Amount DECIMAL(10, 2),
    PaymentMethod VARCHAR(50),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

INSERT INTO Payments VALUES
(501, 102, '2023-05-15', 800.00, 'Credit Card'),
(502, 205, '2024-09-08', 800.00, 'PayPal'),
(503, 311, '2022-11-23', 250.00, 'Bank Transfer'),
(504, NULL, '2024-01-05', 500.00, 'Cash'),
(505, 421, '2021-03-31', 150.00, 'Credit Card'),
(506, 610, '2022-08-26', 300.00, 'Debit Card'),
(507, 728, '2024-06-11', 200.00, 'PayPal'),
(508, NULL, '2023-12-20', 75.00, 'Bank Transfer'),
(509, 915, '2023-02-19', 10.00, 'Cash'),
(510, 1003, '2025-09-28', 360.00, 'Credit Card'),
(511, 1108, '2023-10-12', 500.00, 'PayPal'),
(512, 1205, '2024-04-04', 25.00, 'Debit Card'),
(513, 1354, '2022-07-30', 60.00, 'Credit Card'),
(514, NULL, '2024-02-17', 1200.00, 'Wire Transfer'), 
(515, 1411, '2021-01-23', 135.00, 'Bank Transfer'),
(516, NULL, '2023-06-29', 150.00, 'PayPal'), 
(517, 1622, '2022-10-09', 60.00, 'Cash'),
(518, 1710, '2023-06-22', 40.00, 'Debit Card'),
(519, 1845, '2021-09-14', 50.00, 'Credit Card'),
(520, NULL, '2025-01-18', 95.00, 'Bank Transfer'); 


	SELECT 
    o.OrderID,
    p.PaymentID,
    p.Amount
FROM Orders o
INNER JOIN Payments p
    ON o.OrderID = p.OrderID;



	SELECT 
    o.OrderID,
    p.ProductName,
    p.Price
FROM Orders o
INNER JOIN Products p
    ON o.ProductID = p.ProductID
WHERE p.Price > 100;


SELECT 
    e.Name,
    d.DepartmentName
FROM Employees e
CROSS JOIN Departments d
WHERE e.DepartmentID <> d.DepartmentID;

SELECT 
    o.OrderID,
    p.ProductName,
    od.Quantity AS OrderedQuantity,
    p.StockQuantity AS StockQuantity
FROM Orders o
INNER JOIN Orders od 
    ON o.OrderID = od.OrderID
INNER JOIN Product p 
    ON od.ProductID = p.ProductID
WHERE od.Quantity > p.StockQuantity;

SELECT 
    c.FirstName,
    s.ProductID,
    s.SaleAmount
FROM Customers c
INNER JOIN Sales s
    ON c.CustomerID = s.CustomerID
WHERE s.SaleAmount >= 500;

SELECT 
    s.Name,
    c.CourseName
FROM Students s
INNER JOIN Enrollments e 
    ON s.StudentID = e.StudentID
INNER JOIN Courses c 
    ON e.CourseID = c.CourseID;

	SELECT 
    p.ProductName,
    s.SupplierName
FROM Products p
INNER JOIN Suppliers s 
    ON p.SupplierID = s.SupplierID
WHERE s.SupplierName LIKE '%Tech%';

SELECT 
    o.OrderID,
    o.TotalAmount,
    p.PaymentID,
    p.Amount AS PaymentAmount
FROM Orders o
INNER JOIN Payments p 
    ON o.OrderID = p.OrderID
WHERE p.Amount < o.TotalAmount;

SELECT 
    e.Name,
    d.DepartmentName
FROM Employees e
INNER JOIN Departments d
    ON e.DepartmentID = d.DepartmentID;

	CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY IDENTITY,
    CategoryName VARCHAR(50) UNIQUE
);

INSERT INTO Categories (CategoryName) VALUES 
('Electronics'),
('Accessories'),
('Furniture'),
('Stationery'),
('Tools'),
('Clothing');

	SELECT 
    p.ProductName,
    c.CategoryName
FROM Products p
INNER JOIN Categories c
    ON p.CategoryID = c.CategoryID
WHERE c.CategoryName IN ('Electronics', 'Furniture');

UPDATE P 
SET P.Category = C.CategoryID
FROM Products P  JOIN Categories C ON P.Category=C.CategoryName

SELECT 
    s.SaleID,
    s.ProductID,
    s.SaleAmount,
    c.FirstName,
    c.Country
FROM Sales s
INNER JOIN Customers c
    ON s.CustomerID = c.CustomerID
WHERE c.Country = 'USA';

SELECT 
    o.OrderID,
    o.TotalAmount,
    c.FirstName,
    c.Country
FROM Orders o
INNER JOIN Customers c
    ON o.CustomerID = c.CustomerID
WHERE c.Country = 'Germany'
  AND o.TotalAmount > 100;

  SELECT 
    e1.Name AS Employee1,
    e2.Name AS Employee2,
    e1.DepartmentID AS Dept1,
    e2.DepartmentID AS Dept2
FROM Employees e1
INNER JOIN Employees e2
    ON e1.EmployeeID < e2.EmployeeID   
   AND e1.DepartmentID <> e2.DepartmentID;

   SELECT 
    p.PaymentID,
    p.Amount AS PaidAmount,
    o.OrderID,
    od.Quantity,
    pr.Price AS ProductPrice,
    (od.Quantity * pr.Price) AS ExpectedAmount
FROM Payments p
INNER JOIN Orders o 
    ON p.OrderID = o.OrderID
INNER JOIN Orders od 
    ON o.OrderID = od.OrderID
INNER JOIN Products pr 
    ON od.ProductID = pr.ProductID
WHERE p.Amount <> (od.Quantity * pr.Price);

SELECT 
    s.StudentID,
    s.Name
FROM Students s
LEFT JOIN Enrollments e 
    ON s.StudentID = e.StudentID
WHERE e.CourseID IS NULL;

SELECT 
    m.EmployeeID AS ManagerID,
    m.Name AS ManagerName,
    m.Salary AS ManagerSalary,
    e.EmployeeID AS EmployeeID,
    e.Name AS EmployeeName,
    e.Salary AS EmployeeSalary
FROM Employees e
INNER JOIN Employees m 
    ON e.ManagerID = m.EmployeeID   
WHERE m.Salary <= e.Salary;

SELECT 
    c.CustomerID,
    c.FirstName,
    o.OrderID
FROM Customers c
INNER JOIN Orders o 
    ON c.CustomerID = o.CustomerID
LEFT JOIN Payments p 
    ON o.OrderID = p.OrderID
WHERE p.PaymentID IS NULL;

