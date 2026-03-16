-- Clauses in SQL SERVER

-- 1. SELECT: Used to retrieve data from a database.
-- 2. FROM: Specifies the table from which to retrieve data.
-- 3. WHERE: Used to filter records based on specified conditions.
-- 4. GROUP BY: Groups rows that have the same values in specified columns into summary rows.
-- 5. HAVING: Used to filter groups based on specified conditions.
-- 6. ORDER BY: Used to sort the result set in ascending or descending order.


create database DBProgramming
use DBProgramming


-- Tables and Data


-- Create Gender table
CREATE TABLE Gender
(  
ID INT PRIMARY KEY IDENTITY(1,1),
Gender VARCHAR(50)
)


-- column_name INT IDENTITY(seed, increment)
-- seed -> starting number
-- increment -> step size


-- GO Keyword
-- SQL Server executes code in batches. GO indicates the end of a batch.


-- Create Employee table
CREATE TABLE Employee
(
ID INT PRIMARY KEY IDENTITY(1,1),
Name VARCHAR(50),
Age INT,
Salary INT,
City VARCHAR(50),
GenderID INT
)


-- Insert data in Gender table
INSERT INTO Gender VALUES ('Male')
INSERT INTO Gender VALUES ('Female')


-- Insert data in Employee table
INSERT INTO Employee VALUES ('Rahul',25,30000,'Delhi',1)
INSERT INTO Employee VALUES ('Amit',28,45000,'Mumbai',1)
INSERT INTO Employee VALUES ('Priya',24,35000,'Delhi',2)
INSERT INTO Employee VALUES ('Sneha',30,60000,'Bangalore',2)
INSERT INTO Employee VALUES ('Rohit',27,40000,'Mumbai',1)
INSERT INTO Employee VALUES ('Anjali',26,50000,'Delhi',2)



-- SELECT clause
-- Used to fetch data from table

SELECT * FROM Employee

SELECT Name,Salary FROM Employee



-- WHERE clause
-- Used to filter rows based on condition

SELECT * FROM Employee
WHERE Salary > 40000

SELECT * FROM Employee
WHERE City='Delhi'

SELECT Name,Age FROM Employee
WHERE Age > 25



-- ORDER BY clause
-- Used to sort result

SELECT * FROM Employee
ORDER BY Salary

SELECT * FROM Employee
ORDER BY Salary DESC

SELECT * FROM Employee
ORDER BY Name



-- GROUP BY clause
-- Used to group rows

SELECT City,COUNT(*) AS TotalEmployees
FROM Employee
GROUP BY City

SELECT GenderID,COUNT(*) AS Total
FROM Employee
GROUP BY GenderID



-- HAVING clause
-- Used with GROUP BY to filter groups

SELECT City,COUNT(*) 
FROM Employee
GROUP BY City
HAVING COUNT(*) > 1

SELECT City,AVG(Salary)
FROM Employee
GROUP BY City
HAVING AVG(Salary) > 40000



-- DISTINCT keyword
-- Used to remove duplicate values

SELECT DISTINCT City
FROM Employee



-- TOP keyword
-- Used to limit result rows

SELECT TOP 3 *
FROM Employee



-- LIKE operator
-- Used for pattern matching

SELECT * FROM Employee
WHERE Name LIKE 'A%'

SELECT * FROM Employee
WHERE Name LIKE '%a'



-- BETWEEN operator
-- Used to filter range

SELECT * FROM Employee
WHERE Salary BETWEEN 30000 AND 50000



-- IN operator
-- Used to match multiple values

SELECT * FROM Employee
WHERE City IN ('Delhi','Mumbai')



-- Aggregate Functions

-- COUNT
SELECT COUNT(*) FROM Employee

-- MAX
SELECT MAX(Salary) FROM Employee

-- MIN
SELECT MIN(Salary) FROM Employee

-- SUM
SELECT SUM(Salary) FROM Employee

-- AVG
SELECT AVG(Salary) FROM Employee



-- JOIN example
-- combine data from multiple tables

SELECT e.Name,e.City,e.Salary,g.Gender
FROM Employee e
INNER JOIN Gender g
ON e.GenderID = g.ID