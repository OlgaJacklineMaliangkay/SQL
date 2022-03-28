Select *
From SQLTutorial..EmployeeDemographics

Select *
From SQLTutorial..EmployeeSalary

--Jika kita mau melihat rata2 salary berdasarkan gender dimana kita kenakan syarat pada gender maka gunakan Where
Select Gender, Avg(Salary) as AvgSalary
From SQLTutorial..EmployeeDemographics dem
Full Outer Join SQLTutorial..EmployeeSalary sal
	On dem.EmployeeID = sal.EmployeeID
Where Gender is not NULL
Group by Gender

--jika ingin mengenakan syarat pada fungsi agregat maka gunakan Having
Select Jobtitle, Avg(Salary) as AvgSalary
From SQLTutorial..EmployeeDemographics dem
Full Outer Join SQLTutorial..EmployeeSalary sal
	On dem.EmployeeID = sal.EmployeeID 
Where JobTitle is not Null
Group by JobTitle
Having Avg(Salary) > 40000 and Avg(Salary) <= 60000
Order by AvgSalary

--ingin melihat jumlah pegawai per divisi yang hanya di handle oleh 1 org

Select Jobtitle, Count(JobTitle) as SumOfJob
From SQLTutorial..EmployeeDemographics dem
Full Outer Join SQLTutorial..EmployeeSalary sal
	On dem.EmployeeID = sal.EmployeeID 
Where JobTitle is not Null
Group by JobTitle
Having Count(JobTitle) = 1
Order by SumOfJob