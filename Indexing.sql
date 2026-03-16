-- Indexing in SQL SERVER

/*
Index is used to improve the speed of data retrieval operations on a table.
It works similar to the index of a book.

Types of Index
1. Clustered Index
2. Non Clustered Index
*/


-- Create table

create table Emp
(
Id int,
Name varchar(50),
Salary int,
Gender varchar(10),
City varchar(50),
Dept varchar(50)
)
go


-- Insert data

insert into Emp values (3,'Pranaya',4500,'Male','New York','IT')
insert into Emp values (1,'Anurag',2500,'Male','London','IT')
insert into Emp values (4,'Priyanka',5500,'Female','Tokyo','HR')
insert into Emp values (5,'Sambit',3000,'Male','Toronto','IT')
insert into Emp values (7,'Preety',6500,'Female','Mumbai','HR')
insert into Emp values (6,'Tarun',4000,'Male','Delhi','IT')
insert into Emp values (2,'Hina',500,'Female','Sydney','HR')
insert into Emp values (8,'John',6500,'Male','Mumbai','HR')
insert into Emp values (10,'Pam',4000,'Female','Delhi','IT')
insert into Emp values (9,'Sara',500,'Female','London','IT')


select * from Emp



-- Query without index

select * from Emp
where Id = 8



-- Clustered Index
-- It sorts and stores the data physically in table

create clustered index IX_Emp_Id
on Emp(Id)



-- Test again

select * from Emp
where Id = 8



-- Non Clustered Index
-- It creates separate structure pointing to table data

create nonclustered index IX_Emp_Salary
on Emp(Salary)



-- Test salary search

select * from Emp
where Salary = 4000



-- Composite Index (multiple columns)

create nonclustered index IX_Emp_Gender_Salary
on Emp(Gender,Salary)



-- Query using multiple columns

select * from Emp
where Gender='Male' and Salary=4000




-- Create another table for large data test

create table tblOrder
(
Id int,
CustomerId int,
ProductId varchar(100),
ProductName varchar(50)
)
go



-- Insert large amount of data

declare @i int = 0

while @i < 3000
begin

set @i = @i + 1

if(@i < 500)
insert into tblOrder values (@i,1,'Product-10120','Laptop')

else if(@i < 1000)
insert into tblOrder values (@i,3,'Product-1020','Mobile')

else if(@i < 1500)
insert into tblOrder values (@i,2,'Product-101','Desktop')

else if(@i < 2000)
insert into tblOrder values (@i,3,'Product-707','Pendrive')

else if(@i < 2500)
insert into tblOrder values (@i,2,'Product-999','HD')

else
insert into tblOrder values (@i,1,'Product-100','Tablet')

end



-- Query before indexing

select *
from tblOrder
where ProductId='Product-101'



-- Create Non Clustered Index

create nonclustered index IX_tblOrder_ProductId
on tblOrder(ProductId)



-- Query after indexing

select *
from tblOrder
where ProductId='Product-101'