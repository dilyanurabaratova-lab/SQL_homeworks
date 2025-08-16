create table Employees (ID INT, EmpName VARCHAR(50), Salary DECIMAL(10,2))

select * from Employees

INSERT INTO Employees values (1, 'TOM', 5000), (2,'ANDREW', 5500), (3, 'ALEX', 6000)

update Employees
set Salary = 7000 
where ID = 1 

delete from Employees
where ID = 2

Alter table Employees
Alter column EmpName VARCHAR(100)

Alter table Employees
add Department VARCHAR(50)

Alter table Employees 
alter column Salary Float 

Create table Departments (DepartmentID INT PRIMARY KEY , DepartmentName VARCHAR(50)) 

select * from Departments 

TRUNCATE TABLE Employees

Alter table Departments 
add salary int, age int, professions varchar

Alter table Departments
Alter column professions varchar (50)

Select * from Departments

Insert into Departments values (1, 'finance', 5000, 30, 'accountant'), (2, 'finance', 5500, 31, 'accountant'),
(3, 'finance', 3000, 25, 'accountant'), (4, 'sells', 5200, 28, 'manager'), (5, 'sells', 6000, 30, 'main manager')


update Departments
set DepartmentName = 'Management'
where Salary > 5000


TRUNCATE TABLE Departments 

alter table Departments 
drop column DepartmentName


EXEC sp_rename 'Employees', 'StaffMembers';

DROP TABLE Departments;

DELETE, TRUNCATE, and DROP
The main difference between DELETE, TRUNCATE, and DROP is their scope and how they affect data and database objects.

DELETE is a Data Manipulation Language (DML) command used to remove rows from a table. It's a precise operation, allowing you to specify which rows to delete using a WHERE clause. It performs a row-by-row removal, which is logged, and can be rolled back. This command is typically slower for large numbers of rows because of this logging and the overhead of removing each row individually.

TRUNCATE is a Data Definition Language (DDL) command used to remove all rows from a table. It's much faster than DELETE for mass deletion because it deallocates the data pages used by the table, effectively resetting it to its initial empty state. It does not log individual row deletions and cannot be rolled back. You cannot use a WHERE clause with TRUNCATE.

DROP is a DDL command used to remove an entire database object, such as a table, an index, or a view. When you DROP a table, it deletes the table structure, all its data, its indexes, and any associated constraints. This action is irreversible and cannot be rolled back.
