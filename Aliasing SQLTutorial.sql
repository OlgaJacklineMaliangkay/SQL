-- Aliasing is temporary changing the column name or the table name in the script and it's not really impact the output at all

Select *
From SQLTutorial..EmployeeDemographics

Select FirstName
From SQLTutorial..EmployeeDemographics

Select FirstName as FN
From SQLTutorial..EmployeeDemographics
-- or
Select FirstName FN
From SQLTutorial..EmployeeDemographics

Select FirstName + ' ' + LastName as Fullname
From SQLTutorial..EmployeeDemographics

Select Avg(Age) as AvgAge
From SQLTutorial..EmployeeDemographics

-- aliasing source (From) to sumoning data (Select)
Select D.EmployeeID
From SQLTutorial..EmployeeDemographics as D

-- contoh lain
Select Dem.EmployeeID, Sal.Salary
From SQLTutorial..EmployeeDemographics as Dem
Join SQLTutorial..EmployeeSalary as Sal
	On Dem.EmployeeID = Sal.EmployeeID

-- Don't aliasing with simple alphabet or number that confusing
Select a.EmployeeID, a.FirstName, b.JobTitle, c.Age
From SQLTutorial..EmployeeDemographics as a
Left Join SQLTutorial..EmployeeSalary b
	On a.EmployeeID = b.EmployeeID
Left Join SQLTutorial..WareHouseEmployeeDemographics c
	On a.EmployeeID = c.EmployeeID

-- Use this instead
Select dem.EmployeeID, dem.FirstName, sal.JobTitle, ware.Age
From SQLTutorial..EmployeeDemographics as dem
Left Join SQLTutorial..EmployeeSalary sal
	On dem.EmployeeID = sal.EmployeeID
Left Join SQLTutorial..WareHouseEmployeeDemographics ware
	On dem.EmployeeID = ware.EmployeeID