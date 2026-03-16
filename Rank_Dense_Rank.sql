-- Rank and Dense_Rank Function in SQL Server
/*Both the RANK and DENSE_RANK functions were introduced in SQL Server 2005. 
Again both these functions are used to return sequential numbers starting 
from 1 based on the ordering of rows imposed by the ORDER BY clause.
*/


-- RANK Function

Create Table Employees
(
    Id INT PRIMARY KEY,
    Name VARCHAR(50), 
    Department VARCHAR(10),
    Salary INT,
)
Go

Insert Into Employees Values (1, 'James', 'IT', 80000)
Insert Into Employees Values (2, 'Taylor', 'IT', 80000)
Insert Into Employees Values (3, 'Pamela', 'HR', 50000)
Insert Into Employees Values (4, 'Sara', 'HR', 40000)
Insert Into Employees Values (5, 'David', 'IT', 35000)
Insert Into Employees Values (6, 'Smith', 'HR', 65000)
Insert Into Employees Values (7, 'Ben', 'HR', 65000)
Insert Into Employees Values (8, 'Stokes', 'IT', 45000)
Insert Into Employees Values (9, 'Taylor', 'IT', 70000)
Insert Into Employees Values (10, 'John', 'IT', 68000)
Go

-- RANK Function without PARTITION
SELECT Name, Department, Salary,
RANK() OVER (ORDER BY Salary DESC) AS [Rank]
FROM Employees


-- RANK Function with PARTITION
SELECT Name, Department, Salary,
RANK() OVER (PARTITION BY Department ORDER BY Salary DESC) AS [Rank]
FROM Employees


-- DENSE_RANK Function without PARTITION
SELECT Name, Department, Salary,            
DENSE_RANK() OVER (ORDER BY Salary DESC) AS [Dense_Rank]
FROM Employees

-- DENSE_RANK Function with PARTITION
SELECT Name, Department, Salary,
DENSE_RANK() OVER (PARTITION BY Department ORDER BY Salary DESC) AS [Dense_Rank]
FROM Employees
