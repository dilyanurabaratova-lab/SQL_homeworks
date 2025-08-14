-- EASY 
--Define the following terms: data, database, relational database, and table.

Data: A collection of raw, unorganized facts, such as numbers, text, or symbols, that lack context or meaning on their own. When processed and organized, data becomes information.

Database: A structured, organized collection of data. A database is designed to efficiently store, manage, and retrieve large amounts of information. It acts as a central repository for data, allowing for easy access and manipulation.

Relational Database: A type of database that organizes data into one or more tables (also called relations). In a relational database, data is structured with predefined relationships between the tables, which are established using common columns. This model allows for the data to be queried and combined in various ways without reorganizing the entire database.

Table: A fundamental structure within a relational database, similar to a spreadsheet. It consists of rows and columns to store specific information. Each row represents a single record or entity, while each column represents a specific attribute or field for that entity. For example, a table named "Employees" might have columns like EmployeeID, FirstName, and LastName, with each row representing a different employee.

--List five key features of SQL Server.

SQL Server, a popular relational database management system (RDBMS) from Microsoft, offers a wide range of features. Five key features include:

T-SQL (Transact-SQL): An extension of the standard SQL language that adds additional programming constructs like control-of-flow statements, variables, and error handling. T-SQL allows for more powerful and complex logic to be implemented directly within the database.

High Availability and Disaster Recovery: Features like Always On Availability Groups and failover clustering ensure that databases remain accessible even in the event of hardware or software failures. This is crucial for mission-critical applications that require continuous uptime.

Security: SQL Server provides robust security features to protect data. These include transparent data encryption (TDE) to encrypt data at rest, dynamic data masking to obscure sensitive data from unauthorized users, and row-level security (RLS) to control access to specific rows in a table based on user credentials.

Performance Optimization: Tools and features like the Query Store, which captures a history of query plans and runtime statistics, and automatic tuning, which can identify and fix potential performance issues, help database administrators optimize database performance.

Business Intelligence (BI) Services: SQL Server includes a suite of services designed for business intelligence, such as SQL Server Integration Services (SSIS) for data integration and transformation (ETL), SQL Server Analysis Services (SSAS) for data analysis and reporting, and SQL Server Reporting Services (SSRS) for creating and managing reports.


--What are the different authentication modes available when connecting to SQL Server? (Give at least 2)

When connecting to SQL Server, there are two primary authentication modes:

Windows Authentication: This is the default and most secure mode. With Windows Authentication, SQL Server uses the user's existing Windows operating system credentials to verify their identity. There's no need for a separate username and password for the database. This mode is often preferred in corporate environments where users are part of an Active Directory domain.

SQL Server Authentication: In this mode, users must provide a specific SQL Server login and password that are separate from their Windows credentials. These credentials are created and managed directly within SQL Server. This mode is useful when connecting from non-Windows clients, or for applications that need to connect using a dedicated login account.

    ##Medium

-- Create a new database in SSMS named SchoolDB.
-- Write and execute a query to create a table called Students with columns: StudentID (INT, PRIMARY KEY), Name (VARCHAR(50)), Age (INT).

    
Create databese SchoolDB 

Create table Styudents(StudentID int, Name VARCHAR(50), Age int)

    
    -6- Describe the differences between SQL Server, SSMS, and SQL.

While the names sound similar, SQL, SQL Server, and SSMS are three distinct components of a database system, each with a different role. Think of it like a car: SQL is the language you use to give instructions, SQL Server is the engine that does the work, and SSMS is the dashboard and steering wheel you use to control everything.

     #HARD# 
    
    --7.Research and explain the different SQL commands: DQL, DML, DDL, DCL, TCL with examples.

SQL commands are grouped into five main categories based on their function: Data Definition Language (DDL), Data Manipulation Language (DML), Data Query Language (DQL), Data Control Language (DCL), and Transaction Control Language (TCL). Understanding these categories is crucial for managing and interacting with a database.

DDL commands are used to create and modify the structure of a database and its objects. They define the schema of the database. Think of them as the commands you'd use to build or change the blueprint of a house.

CREATE: Used to create new database objects like tables, views, or indexes.

Example: CREATE TABLE Employees (EmployeeID INT, FirstName VARCHAR(50));

ALTER: Used to modify the structure of an existing object. You can add, delete, or modify columns.

Example: ALTER TABLE Employees ADD LastName VARCHAR(50);

DROP: Used to permanently delete a database object and all the data within it.

Example: DROP TABLE Employees;

TRUNCATE: Used to delete all data from a table, but it keeps the table's structure intact. It's much faster than DELETE for removing all rows.

Example: TRUNCATE TABLE Employees;

DML (Data Manipulation Language)
DML commands are used to manage and manipulate the data within a database. They affect the data stored inside the tables, not the table structure itself. These are the commands you use to furnish the house after the blueprint is complete.

INSERT: Used to add new rows (records) to a table.

Example: INSERT INTO Employees (EmployeeID, FirstName) VALUES (1, 'John');

UPDATE: Used to modify existing data in one or more rows of a table.

Example: UPDATE Employees SET FirstName = 'Jon' WHERE EmployeeID = 1;

DELETE: Used to remove one or more rows from a table.

Example: DELETE FROM Employees WHERE EmployeeID = 1;

DQL (Data Query Language)
DQL commands are used to retrieve data from a database. This is a very common command and is often what people mean when they talk about a "SQL query." Its sole purpose is to get information without changing the data.

SELECT: The primary DQL command used to retrieve data from a table based on specified conditions.

Example: SELECT FirstName, LastName FROM Employees WHERE EmployeeID = 1;


DCL (Data Control Language)
DCL commands are used to manage user permissions and access control to a database. They are essential for security and are typically used by database administrators.

GRANT: Used to give specific privileges to a user or role, such as the ability to select, insert, or update data.

Example: GRANT SELECT ON Employees TO user_A;

REVOKE: Used to remove previously granted privileges from a user or role.

Example: REVOKE INSERT ON Employees FROM user_A;

TCL (Transaction Control Language)
TCL commands are used to manage transactions in a database, ensuring data integrity. A transaction is a single unit of work that contains one or more SQL statements. Either all statements in a transaction are executed successfully, or none of them are.

COMMIT: Used to permanently save a transaction to the database. Once you commit, the changes cannot be undone with ROLLBACK.

Example: COMMIT;

ROLLBACK: Used to undo changes made during the current transaction. This is useful for reverting to a previous state if an error occurs.

Example: ROLLBACK;

SAVEPOINT: Used to create a temporary point within a transaction to which you can later roll back. This allows you to undo only a portion of a larger transaction.

Example: SAVEPOINT savepoint_A;

    -8- Write a query to insert three records into the Students table.

    create DATABASE UNIVERSITY  

    CREATE TABLE STUDENTS (ID int, name varchar(30), group_name varchar(20), Age int)

    select * from STUDENTS 

    insert into STUDENTS (ID,name,group_name,age)values 

    (1,'TOM', 'MATH', 20)

     select * from STUDENTS 

    insert into STUDENTS (ID,name,group_name,age)values 

    (2,'ADAM', 'PHYSICS', 20)

    select * from STUDENTS 

    insert into STUDENTS (ID,name,group_name,age)values 

    (3,'ANNA', 'CHEMISTRY', 21)
    
-- 2ND OPTION 
    
    select * from STUDENTS 

    insert into STUDENTS (ID,name,group_name,age)values 

    (1,'TOM', 'MATH', 20), 

    insert into STUDENTS values (2,'ADAM', 'PHYSICS', 20), (3,'ANNA', 'CHEMISTRY', 21)



-9- Restore AdventureWorksDW2022.bak file to your server. (write its steps to submit)

   --  The first doc should be save in following file  :  
    
    C disk  - Microsoft SQL server - MSSQL - BACKUP  SAVE  

    -- The second  doc will be dowloaded in SQL server 
    
    SSML - restoredatabase - General - Device - Add - doc will be choosen and finally OK 

    

