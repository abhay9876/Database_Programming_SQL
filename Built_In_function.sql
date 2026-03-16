-- Built-in function
-- User-Defined Functions

-- Built-in function
-- a built-in function is a piece of code that takes one or more inputs and returns a value.
SELECT GETDATE() AS CurrentDateTime;

-- ASCII(Character_Expression) 
--The ASCII function returns the ASCII code that represents a specific character.
SELECT ASCII('A');

SELECT ASCII('A') AS Uppercase, ASCII('a') AS LowerCase;

-- CHAR(Integer_Expression)
-- The CHAR function returns the character that corresponds to the specified ASCII code.
SELECT CHAR(65)
--UpperCase
DECLARE @Number int;
set @Number = 65;
while(@Number <= 90)
begin
print char(@Number)
set @Number = @Number +1;
end

-- LowerCase using Lower() Function
DECLARE @Number int;
set @Number = 65;
while(@Number <= 90)
begin
print Lower(char(@Number))
set @Number = @Number +1;
end

-- LTRIM(String_Expression)
-- The LTRIM function removes leading spaces from a string.
SELECT LTRIM('   Hello World!') AS TrimmedString;

-- RTRIM(String_Expression)
-- The RTRIM function removes trailing spaces from a string.
SELECT RTRIM('Hello World!   ') AS TrimmedString;

-- LEN(String_Expression)
-- The LEN function returns the number of characters in a string, excluding trailing spaces.
SELECT LEN('Hello World!   ') AS StringLength; -- including leading spaces 

--Reverse(String_Expression)
-- The REVERSE function returns the reverse of a string.
SELECT REVERSE('Hello World!') AS ReversedString;

-- LEFT(String_Expression, Integer_Expression)
-- The LEFT function returns the left part of a string with the specified number of characters.
SELECT LEFT('zeno',2);

-- RIGHT(String_Expression, Integer_Expression)
-- The RIGHT function returns the right part of a string with the specified number of characters.
SELECT RIGHT('zeno',2);


-- SUBSTRING(String_Expression, Integer_Expression, Integer_Expression)
-- The SUBSTRING function returns a part of a string, starting at a specified position and with a specified length.
SELECT SUBSTRING('ZENO SAMA',1,4);

--CHARINDEX(ExpressionToFind, ExpressionToSearch [, Start_location])
-- The CHARINDEX function returns the starting position of a specified expression in a string.
SELECT CHARINDEX('S','ZENO SAMA');

