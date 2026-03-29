# Database-Programming-SQL

## Description
This repository is dedicated to mastering **Database Programming using Microsoft SQL Server**, covering everything from foundational data types to advanced stored procedures and indexing.  
It provides hands-on SQL implementations to help developers understand how to **design, query, and optimize relational databases** with real-world problem-solving practice.

---

## Tech Stack
- **Language:** SQL (T-SQL)
- **Database:** Microsoft SQL Server (SQL Express)
- **IDE:** SQL Server Management Studio (SSMS)
- **Version Control:** Git & GitHub

---

## Repository Structure & Branches

### `main` Branch
Contains the base structure and entry point of the repository.

---

### `data-types` Branch
Covers all SQL Server data types with practical usage:
- Numeric, Character, Date/Time, and Boolean types
- Implicit and explicit type conversions
- Choosing the right data type for real-world columns

**Purpose:**
> To build a solid foundation in SQL data types and understand how storage and precision decisions affect database design.

---

### `built-in-function` Branch
Explores the wide range of SQL Server built-in functions:
- String functions 
- Numeric functions
- Date functions 

**Purpose:**
> To master SQL's built-in toolset for transforming and processing data directly within queries.

---

### `clauses` Branch
Deep dive into SQL query clauses:
- WHERE, ORDER BY, GROUP BY, HAVING
- Filtering, sorting, and aggregating result sets

**Purpose:**
> To understand how SQL clauses control the shape and scope of query output in real scenarios.

---

### `function` Branch
Covers user-defined functions in SQL Server:
- Scalar functions
- Table-valued functions (Inline and Multi-statement)
- Practical use cases for reusable query logic

**Purpose:**
> To learn how to encapsulate reusable business logic inside SQL functions for cleaner and modular query design.

---

### `indexing` Branch
Explores indexing strategies for query performance:
- Clustered and Non-Clustered Indexes
- Unique Indexes and Composite Indexes
- How indexes affect SELECT, INSERT, UPDATE performance
- Execution plan basics

**Purpose:**
> To understand how proper indexing dramatically improves database performance and when to apply each type.

---

### `ranks` Branch
Covers SQL Server ranking and window functions:
- ROW_NUMBER, RANK, DENSE_RANK, NTILE
- OVER() clause with PARTITION BY and ORDER BY
- Real-world ranking and pagination scenarios

**Purpose:**
> To master window functions for advanced data analysis and row-level computations without collapsing result sets.

---

### `store-procedure` Branch
Hands-on implementation of Stored Procedures:
- Creating and executing stored procedures
- Input and Output parameters
- Reusable business logic inside the database

**Purpose:**
> To build production-style stored procedures that encapsulate complex operations and improve application-database separation.

---

### `sql-review` Branch
A comprehensive review branch where all major SQL topics were tested together:
- Mixed queries covering all branches — data types, functions, clauses, ranks and stored procedures
- Problem-solving exercises and topic-wise query challenges
- End-to-end SQL practice simulating real interview and project scenarios

**Purpose:**
> To consolidate everything learned across all branches into one unified review, reinforcing concepts through practical problem-solving.

---

## Features
- Branch-based topic separation for structured learning
- Covers SQL from basics to advanced in a progressive manner
- Real-world query problems and scenarios
- Hands-on stored procedure and function implementations
- Performance-focused indexing practice
- Dedicated review branch for interview preparation

---

## Learning Outcomes
By working through this repository, you will:
- Write clean and optimized T-SQL queries with confidence
- Understand all major SQL Server data types and when to use them
- Use built-in functions effectively for data transformation
- Design and use Indexes to improve query performance
- Build reusable Scalar and Table-Valued functions
- Create robust Stored Procedures with parameters and error handling
- Prepare for SQL-based technical interviews with the review branch

---

## Author
**Abhay Singh**  
B.Tech | Aspiring .NET Developer  
Focused on Database Programming, T-SQL, SQL Server, and building optimized data-driven applications.
