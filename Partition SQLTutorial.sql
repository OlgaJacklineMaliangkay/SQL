Select *
From SQLTutorial..EmployeeDemographics

Select *
From SQLTutorial..EmployeeSalary

Select *
From SQLTutorial..EmployeeDemographics dem
Join SQLTutorial..EmployeeSalary sal
	On dem.EmployeeID = sal.EmployeeID

-- ingin membandingkan gaji masing-masing employee dengan rata-rata salary sesuai dengan masing-masing job

Select dem.EmployeeID, FirstName, LastName, Jobtitle, Salary, Avg(Salary) Over (Partition by Jobtitle) As AvgSalary
From SQLTutorial..EmployeeDemographics dem
Join SQLTutorial..EmployeeSalary sal
	On dem.EmployeeID = sal.EmployeeID
Order by EmployeeID

-- akan gagal jika memakai group by

Select dem.EmployeeID, FirstName, LastName, Jobtitle, Salary, Avg(Salary) As AvgSalary
From SQLTutorial..EmployeeDemographics dem
Join SQLTutorial..EmployeeSalary sal
	On dem.EmployeeID = sal.EmployeeID
Group by JobTitle, Salary, FirstName, LastName, dem.EmployeeID
Order by EmployeeID

-- contoh menggunakan over saja

Select dem.EmployeeID, FirstName, LastName, Jobtitle, Salary, Avg(Salary) Over() AvgSalary
From SQLTutorial..EmployeeDemographics dem
Join SQLTutorial..EmployeeSalary sal
	On dem.EmployeeID = sal.EmployeeID
Order by EmployeeID

-- group by hanya dapat digunakan untuk melihat rata-rata salary per jobtitle tanpa dapat melihat id atau nama employee

Select Jobtitle, Avg(Salary) As AvgSalary
From SQLTutorial..EmployeeDemographics dem
Join SQLTutorial..EmployeeSalary sal
	On dem.EmployeeID = sal.EmployeeID
Group by Jobtitle
