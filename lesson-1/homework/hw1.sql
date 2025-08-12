create database READBOOKSDB2  

Create table books (id int, name varchar (30), auther varchar (30), genre varchar (30), status varchar (30))

select * from books

insert into books values (1,'Shinelli', 'Shuhrat', 'fiction', 'o`qilgan'),(2,'Black swan', 'Nassim Taleb', 'nonfiction', 'o`qilgan')


select*from [HumanResources].[Employee]
where BusinessEntityID = 20

select * from [HumanResources].[Employee]
where BusinessEntityID >= 20

select * from [HumanResources].[Employee]
where gender = 'M'

CREATE TABLE classes (
    class_id INT,
    class_name VARCHAR(50),
    teacher_name VARCHAR(50)
);

INSERT INTO classes (class_id, class_name, teacher_name) VALUES
(1, 'Math 101', 'Mr. Smith'),
(2, 'English 102', 'Ms. Johnson'),
(3, 'Science 103', 'Dr. Lee');

select * from classes

update classes 
set class_name = 'Physics'
where class_id = 2 

update classes
set class_id = 5
where teacher_name = 'Dr. Lee'

select * from classes




update books



