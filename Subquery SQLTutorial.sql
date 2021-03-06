-- Subqueries often called inner query or in nested queries
-- A Subqueries is used to return data that wil be used in the main query or the outer query as a metiion to specify the data that we want retrieved
-- We can use Subquery anywhere. We can use it in select part of a query
-- We can also use it in the FROM, WHERE, INSERT, UPDATE and DELETE statements

Select EmployeeID, JobTitle, Salary
From SQLTutorial..EmployeeSalary        

-- Contoh dari CTE/Temp_Table tidak bisa menggunakan Subquery
-- Karena subquery tdk bisa memuat over partition by
-- Sehingga daripada mencari berapa persen salary per individu employee yang mempunyai salary diatas 45000 dari rata2 salary berdasarkan gender,
-- kita akan mencari berapa persen salary employee dari rata2 total salary

Select dem.EmployeeID, FirstName, LastName, Gender, Salary,
 Count(gender) Over(Partition by gender) TotalGender,
 Avg(Salary) Over (Partition by Gender) AvgSalary,
 (Select Round(((sal.Salary/Cast(Avg(Salary) as float))*100), 4) From SQLTutorial..EmployeeSalary) PercentAvgSal
From SQLTutorial..EmployeeDemographics dem
Join SQLTutorial..EmployeeSalary sal
	On dem.EmployeeID = sal.EmployeeID
Where Salary > 45000

-- Simple Example:

-- Subquery in Select
Select EmployeeID, Salary, (Select AVG(Salary) From EmployeeSalary) as AllAvgSalary
From SQLTutorial..EmployeeSalary

-- If we use Partition By instead of Subquery
Select EmployeeID, Salary, AVG(Salary) over () as AllAvgSalary
From SQLTutorial..EmployeeSalary

-- We can't use Group By. It returned the different result
Select EmployeeID, Salary, AVG(Salary) as AllAvgSalary
From SQLTutorial..EmployeeSalary
Group By EmployeeID, Salary
order by EmployeeID

-- Subquery in From
Select a.EmployeeID, AllAvgSalary
From 
	(Select EmployeeID, Salary, AVG(Salary) over () as AllAvgSalary
	 From SQLTutorial..EmployeeSalary) a
Order by a.EmployeeID

-- Subquery in Where
Select EmployeeID, JobTitle, Salary
From SQLTutorial..EmployeeSalary
where EmployeeID in (
	Select EmployeeID 
	From SQLTutorial..EmployeeDemographics
	where Age > 30)    
	
-- Subquery is like CTE and Temp Table but less efficient
-- Subquery a little bit more slow
-- Subquery can't be reuse over and over again not like CTE and Temp Table                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   