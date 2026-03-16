-- Display Messege

-- What is Stored Procedure 
/* A Stored Procedure is a PreCompiled group of sql statements stored inside the database that can be executed whenever needed.
-- Means A Database-Level function that contains buiness Logic and can be called by the application or other stored procedures.
-- Instead of Sending raw queries again and again from application we can call the procedure
-- It will execute the query and return the result 
-- 
*/


-- Compilation of a Stored Procedure
/*
-> Parser  syntax verify
-> Algebrizer  object & column binding
-> Query Optimizer  best execution plan choose karta hai
-> Execution Plan generate hota hai
-> Plan cache me store hota hai
-> Execution hota hai
*/

-- Drop a Stored Procedure
-- Drop procedure ProcedureName

-- Change Name and body of a Stored Procedure
/* Change Name -- sp_rename 'OldProcedureName', 'NewProcedureName'
change Body -- use Alter statement 
*/

-- View the text of a stored procedure in SQL Server
sp_helptext 'ProcedureName'


-- Parameters Sniffing
/* 
Execution plan created for the first parameter used for other parameters also which may not be optimal for other parameters 
So it is better to use OPTIONAL (RECOMPILE) to create a new execution plan for each parameter value
*/



-- Basic Syntax to Create a Stored Procedure
CREATE PROCEDURE DisplayWelcome
AS
BEGIN
	PRINT 'Welcome'
END

-- Call Procedure (Without Parameter)
exec DisplayWelcome

-- We Can Call a procedure inside another procedure But Nested Procedure are not Allowed
-- Because DDL Statements are not allowed inside a procedure

CREATE PROCEDURE HELLO
AS
BEGIN
  EXEC DisplayWelcome
  PRINT 'WELCOME PRINT'
  END

  EXEC HELLO

  

-- Create Employee Table
CREATE TABLE Employee
(
  ID INT PRIMARY KEY,
  Name VARCHAR(50),
  Gender VARCHAR(50),
  DOB DATETIME,
  DeptID INT
)
GO

-- Populate the Employee Table with test data
INSERT INTO Employee VALUES(1, 'Pranaya', 'Male','1996-02-29 10:53:27.060', 1)
INSERT INTO Employee VALUES(2, 'Priyanka', 'Female','1995-05-25 10:53:27.060', 2)
INSERT INTO Employee VALUES(3, 'Anurag', 'Male','1995-04-19 10:53:27.060', 2)
INSERT INTO Employee VALUES(4, 'Preety', 'Female','1996-03-17 10:53:27.060', 3)
INSERT INTO Employee VALUES(5, 'Sambit', 'Male','1997-01-15 10:53:27.060', 1)
INSERT INTO Employee VALUES(6, 'Hina', 'Female','1995-07-12 10:53:27.060', 2)
GO

CREATE PROCEDURE spGetEmployee
AS
BEGIN
  Select Name, Gender, DOB from Employee
END

-- To Execute the Procedure
EXEC spGetEmployee




-- Create a Procedure with input parameters
Create Procedure spAddTwoNumbers (
@no1 int,
@no2 int
)
as
begin
declare @result int
set @result = @no1 +@no2
print 'The Result is: ' + cast(@result as varchar(10))
end
-- Calling the procedure:
Exec spAddTwoNumbers 10, 20
--or
EXECUTE spAddTwoNumbers @no1=10, @no2=20

-- OR calling the procedure by declaring two variables as shown below
DECLARE @no1 INT, @no2 INt
SET @no1 = 10
SET @no2 = 20
EXECUTE spAddTwoNumbers @no1, @no2


-- Outpur Parameter
CREATE PROCEDURE spGetResult
  @No1 INT,
  @No2 INT,
  @Result INT OUTPUT
AS
BEGIN
  SET @Result = @No1 + @No2
END

-- To Execute Procedure
DECLARE @Result INT
EXECUTE spGetResult 10, 20, @Result OUT
PRINT @Result