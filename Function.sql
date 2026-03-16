-- Functions in SQL SERVER

/*
-- What is a Function
A Function is a SubProgram that is used to perform an action such as complex calculation
and return the result as a value.

It is similar to a Stored Procedure but it must return a value and cannot modify the database state.
*/


-- Types of Functions

/*
1. System-Defined Functions
   Built-in functions provided by SQL Server like GETDATE(), LEN(), etc.

2. User-Defined Functions
   Functions created by users to perform specific tasks.
*/


-- Create Sample Table for Function Practice

create table Emp
(
Id int primary key identity(1,1),
Name varchar(50),
Dept varchar(50),
Salary int,
City varchar(50)
)


-- Insert Sample Data

insert into Emp values ('Rahul','IT',50000,'Delhi')
insert into Emp values ('Amit','HR',45000,'Mumbai')
insert into Emp values ('Priya','IT',60000,'Delhi')
insert into Emp values ('Sneha','Finance',70000,'Bangalore')
insert into Emp values ('Rohit','IT',55000,'Mumbai')


select * from Emp



-- Types of User Defined Functions

/*
1 Scalar Functions
2 Table Valued Functions
3 Multi Statement Table Valued Functions
*/



-- Scalar Function
-- Returns a single value

create function GetEmployeeSalary
(
@EmployeeId int
)
returns int
as
begin

declare @Salary int

select @Salary = Salary
from Emp
where Id = @EmployeeId

return @Salary

end
go


-- Call Scalar Function

select dbo.GetEmployeeSalary(3) as EmployeeSalary



-- Table Valued Function
-- Returns a table

create function GetEmployeesByDepartment
(
@Department varchar(50)
)
returns table
as
return
(
select *
from Emp
where Dept = @Department
)
go


-- Call Table Valued Function

select *
from dbo.GetEmployeesByDepartment('IT')



-- Multi Statement Table Valued Function
-- Returns table using multiple statements

create function GetEmployeesByCity
(
@City varchar(50)
)
returns @Employees table
(
Id int,
Name varchar(50),
Salary int
)
as
begin

insert into @Employees
select Id,Name,Salary
from Emp
where City = @City

return

end
go


-- Call Multi Statement Function

select *
from dbo.GetEmployeesByCity('Mumbai')



-- System Defined Functions Examples

-- Current Date

select GETDATE()



-- Length of String

select LEN('SQLServer')



-- Convert String to Uppercase

select UPPER('sql server')



-- Convert String to Lowercase

select LOWER('SQL SERVER')



-- Absolute Value

select ABS(-20)



-- Deterministic and Non Deterministic Functions

/*
Deterministic Function
Always returns same result for same input
Example: ABS(), LEN()
*/

select ABS(-15)
select LEN('Database')



/*
Non Deterministic Function
May return different result every time
Example: GETDATE(), NEWID()
*/

select GETDATE()

select NEWID()