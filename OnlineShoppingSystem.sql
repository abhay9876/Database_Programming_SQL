

Create Database ShopDB
go
-- Drop Database ShopDB

use ShopDB

Create Table Products
(
	ProductID INT PRIMARY KEY IDENTITY(1,1),
	ProductName VARCHAR(100),
	Category VARCHAR(50),
	Price DECIMAL(10,2) CHECK (Price > 0),
	Stock INT CHECK (Stock >= 0)
)
go

Create Table Orders
(
	OrderID INT PRIMARY KEY IDENTITY(1,1),
	OrderDate DATETIME DEFAULT GETDATE()
)

Insert into Orders Values(1)
Insert into Orders Values(2)
Insert into Orders Values(3)
Insert into Orders Values(4)

select * from Orders

Create Table OrderDetails
(
	OrderDetailID INT PRIMARY KEY IDENTITY(1,1),
	OrderID INT FOREIGN KEY REFERENCES Orders(OrderID),
	ProductID INT FOREIGN KEY REFERENCES Products(ProductID),
	Quantity INT CHECK (Quantity > 0)
)

Insert into Products Values('PC','Elctronics',30000.00,3)
Insert into Products Values('Mobile','Elctronics',20000.00,5)
Insert into Products Values('Bottle','Grocery',300.00,3)
Insert into Products Values('CPU','Elctronics',40000.00,2)
Insert into Products Values('Vegetable','Grocery',100.00,3)
go


Insert into OrderDetails Values(1,1,2)
Insert into OrderDetails Values(1,2,1)
Insert into OrderDetails Values(1,3,3)



-- Display order details with product name using JOIN
Select od.OrderDetailID, o.OrderID, p.ProductName, od.Quantity
From OrderDetails od
Join Orders o on od.OrderID = o.OrderID
Join Products p on od.ProductID = p.ProductID


-- Subquery: Find highest selling product
Select ProductId ,ProductName, Category, Price, Stock
From Products
Where ProductID = 
(Select TOP 1 ProductID
From OrderDetails
Group By ProductID
Order By SUM(Quantity) DESC)
go

-- Stored Procedure: spPlaceOrder
Create Procedure spPlaceOrder(
	@OrderID INT,
	@ProductID INT,
	@Quantity INT
	)
as
Begin
	If @Quantity <= (Select Stock from Products where ProductID = @ProductID)
	Begin
	 Begin Transaction
	 Insert into OrderDetails(OrderID, ProductID, Quantity)
	 Values(@OrderID, @ProductID, @Quantity)
	 Update Products Set Stock = Stock -@Quantity
	 Where ProductId = @ProductId
	 Commit Transaction
	 End
	 Else
	 Begin
	 Print('Not Enough Stock')
	 End
End
go
	


	 -- Table-valued function returning products by category
	 Create Function fnGetProducts
	 (
	   @Category Varchar(50)
	 )
	 Returns Table
	 as

	 return
	 (
	   select ProductId,ProductName,Price,Stock
	   from Products
	   where Category = @Category
	  )
	  go
	  -- Execute the function
	  Select * from fnGetProducts('Elctronics')
	  go

-- 6.Trigger reducing stock after order insert.
CREATE TRIGGER trReduceStock
ON OrderDetails
AFTER INSERT
AS
BEGIN
    UPDATE p
    SET p.Stock = p.Stock - i.Quantity
    FROM Products p
    JOIN inserted i 
        ON p.ProductID = i.ProductID
END
go



-- 7. Temporary table storing daily sales summary.
 Create Table #DailySalesSummary
 (
 TotalSales Decimal(10,2)
 )
 -- Insert daily sales summary
 Insert into #DailySalesSummary
 Select SUM(od.Quantity*p.Price)
 from OrderDetails od
 join Products p on od.ProductID = p.ProductID

 -- See daily sales summary
 Select * from #DailySalesSummary
 go




 -- Recursive CTE for category hierarchy.
CREATE TABLE Categories
(
    CategoryID INT PRIMARY KEY IDENTITY,
    CategoryName VARCHAR(50),
    ParentCategoryID INT NULL
)

INSERT INTO Categories(CategoryName, ParentCategoryID) VALUES
('Grocery', NULL),         
('Electronics', NULL),     
('Fruits', 1),             
('Vegetables', 1),          
('Apple', 3),              
('Mobile', 2),              
('Laptop', 2);             

WITH CategoryTree AS
(
    -- Anchor 
    SELECT CategoryID, CategoryName, ParentCategoryID, 0 AS Level
    FROM Categories
    WHERE ParentCategoryID IS NULL

    UNION ALL

    -- Recursive
    SELECT c.CategoryID, c.CategoryName, c.ParentCategoryID, ct.Level + 1
    FROM Categories c
    JOIN CategoryTree ct
        ON c.ParentCategoryID = ct.CategoryID
)
SELECT * FROM CategoryTree
ORDER BY Level, CategoryID;

-- Limit at 32 



	 

-- Execute 

Exec spPlaceOrder 3,4,2
Exec spPlaceOrder 3,4,10
select * from OrderDetails


