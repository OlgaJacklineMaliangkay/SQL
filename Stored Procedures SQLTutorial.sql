-- Stored Procedure is a group of SQL Statement that has been created and stored in that database
-- It can accept input parameters
-- A single stored procedure can be used over the network by several different users
-- and we can all be using different input data
-- A Stored Procedure will also reduce network traffic and increase the performance
-- And if we modify stored procedure, everyone who uses that procedure in the future will also get that update

-- running create procedure must with select statement in it

--create a procedure from a table
--refresh after create
CREATE PROCEDURE TEST
AS
SELECT *
FROM EmployeeDemographics

-- show the procedure
EXEC TEST

--create another procedure from temp table
CREATE PROCEDURE Temp_Employee
AS
CREATE TABLE #Temp_Employee (
Jobtitle varchar(100), EmployeesPerJob int,
AvgAge int, AvgSalary int)

INSERT INTO #Temp_Employee
SELECT JobTitle, Count(JobTitle), Avg(Age), Avg(Salary)
FROM SQLTutorial..EmployeeDemographics dem
JOIN SQLTutorial..EmployeeSalary sal
	ON dem.EmployeeID = sal.EmployeeID
GROUP BY JobTitle

SELECT *
FROM #Temp_Employee

-- Show the procedure
EXEC Temp_Employee

-- All we put in this stored procedure was a select statement
--and so when we actually run the stored procedure it returned our select statement

-- Modifying data in temp table procedure:

-- Specifying database
USE [SQLTutorial]
GO

-- Deal with NULL
SET ANSI_NULLS ON
GO

-- Use quote in actual query itself
SET QUOTED_IDENTIFIER ON
GO

-- We're gonna add parameter to alter procedure
-- What the parameter is gonna allow us to do is when we're actually executing the stored procedure
--we can specify an input into that stored procedure so we get a specific result back

-- Alter Procedure => insert parameter
ALTER PROCEDURE [dbo].[Temp_Employee]
@Jobtitle nvarchar(100)
AS
CREATE TABLE #Temp_Employee
(Jobtitle varchar (100), EmployeePerJob int, AvgAge int, AvgSalary int)

INSERT INTO #Temp_Employee
SELECT Jobtitle, Count(JobTitle), Avg(Age), Avg(Salary)
FROM SQLTutorial..EmployeeDemographics dem
JOIN SQLTutorial..EmployeeSalary sal
	ON dem.EmployeeID = sal.EmployeeID
WHERE JobTitle = @Jobtitle
GROUP by JobTitle

SELECT *
FROM #Temp_Employee

-- Show procedure failed
EXEC Temp_Employee

-- Show procedure after use parameter
EXEC Temp_Employee @JobTitle = 'Salesman'

-- We don't have to put that @jobtitle right there
-- We can put that anywhere in the query and use it however we want
-- We can use multiple parameters in one stored procedure