create database Data_types;
use Data_types;

-- Data Types in SQL SERVER
-- Integer Data Types
-- Decimal Data Types
-- Money / Currency Data types
-- Date and time Data Types
-- Character Data Types
-- Binary Data Types
-- Special Data Types

-- integer data types
/*
INTEGER DATA TYPES
Used for storing whole numbers.

tinyint  -> 0 to 255 (1 byte)
smallint -> -32,768 to 32,767 (2 bytes)
int      -> Most commonly used (4 bytes)
bigint   -> Massive scale systems (8 bytes)
*/
create table integertype 
(
id tinyint,
smallNum smallint,
number int,
bignumber bigint
)
insert into integertype values(255,32767,123456,123456789)
exec sp_help integertype
select * from integertype

/*
DECIMAL TYPES
Used when precision matters (finance, tax, pricing).

DECIMAL(p,s)
p = total digits
s = digits after decimal
*/

CREATE TABLE DecimalTypes
(
    Id INT PRIMARY KEY IDENTITY,

    Price DECIMAL(10,2),     -- Example: 12345678.90
    TaxRate NUMERIC(5,2),    -- NUMERIC = Same as DECIMAL
    Weight FLOAT,            -- Approximate value
    AccuracyTest REAL        -- Less precise than FLOAT
);
-- Method 1
INSERT INTO DecimalTypes
VALUES (99999.99, 18.25, 123.456789, 12.34);

-- Method 2
DECLARE @price DECIMAL(10,2) = 500.75;
INSERT INTO DecimalTypes (Price)
VALUES (@price);
exec sp_help DecimalTypes
select * from integertype

/*
MONEY TYPES
Optimized for currency storage.

MONEY      -> Large monetary values
SMALLMONEY -> Smaller range
*/

CREATE TABLE MoneyTypes
(
    Id INT IDENTITY PRIMARY KEY,

    Salary MONEY, -- prec 19, scale 4
    Bonus SMALLMONEY -- prec 10, scale 4
);

-- Style 1
INSERT INTO MoneyTypes
VALUES (750000.50, 15000.25);

-- Style 2 (Calculated Insert)
INSERT INTO MoneyTypes (Salary)
SELECT 50000 * 12;  -- yearly salary

exec sp_help MoneyTypes
select * from MoneyTypes


/*
DATE & TIME TYPES

DATE            -> Only date
TIME            -> Only time
DATETIME2       -> Modern + high precision (RECOMMENDED)
SMALLDATETIME   -> Less storage
DATETIMEOFFSET  -> Timezone aware apps
*/

CREATE TABLE DateTimeTypes
(
    Id INT IDENTITY PRIMARY KEY,

    OnlyDate DATE,
    OnlyTime TIME,
    FullStamp DATETIME2,
    ShortStamp SMALLDATETIME,
    GlobalTime DATETIMEOFFSET
);

-- Method 1 (System Generated)
INSERT INTO DateTimeTypes
VALUES
(GETDATE(), GETDATE(), SYSDATETIME(), GETDATE(), SYSDATETIMEOFFSET());

-- Method 2 (Manual)
INSERT INTO DateTimeTypes
(OnlyDate)
VALUES ('2026-01-01');


/*
CHARACTER TYPES

CHAR(n)     -> Fixed length
VARCHAR(n)  -> Variable length (Most used)
VARCHAR(MAX)-> Huge text

NCHAR / NVARCHAR -> Unicode support (multiple languages)
*/

CREATE TABLE CharacterTypes
(
    Id INT IDENTITY PRIMARY KEY,

    FixedCode CHAR(5),
    UserName VARCHAR(50),
    Description VARCHAR(MAX),
    UniName NVARCHAR(50)
);

-- Style 1
INSERT INTO CharacterTypes
VALUES ('A123', 'Abhay', 'SQL is powerful', N'अभय');

-- Style 2 (Concatenation)
INSERT INTO CharacterTypes (UserName)
VALUES ('User' + '01');



