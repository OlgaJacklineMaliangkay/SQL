-- temporary table mirip seperti CTE. Bedanya dia tdk perlu dirun terus menerus seperti CTE
-- Temp table bisa digunakan ketika kita butuh memanggil query yg sama berulang-ulang
-- kita tinggal select from temp table saja untuk meminimalkan query
-- sangat berguna terutama ketika menggunakan google big query online
-- karena google big query mempunyai limit query setiap di run/execute

-- contoh dari CTE
Create Table #Temp_Employee
(EmployeeID int, FirstName varchar(50), LastName varchar(50), Gender varchar(50), Salary int, TotalGender int, AvgSalary float)

Insert into #Temp_Employee
Select dem.EmployeeID, FirstName, LastName, Gender, Salary, Count(gender) Over(Partition by gender) TotalGender,
Cast(Avg(Salary) Over (Partition by Gender) as float) AvgSalary
From SQLTutorial..EmployeeDemographics dem
Join SQLTutorial..EmployeeSalary sal
	On dem.EmployeeID = sal.EmployeeID
Where Salary > 45000

Select *
From #Temp_Employee

-- ingin melihat berapa persen salary per individu employee yang mempunyai salary diatas 45000 dari rata2 salary berdasarkan gender
Select Round((Salary/AvgSalary)*100, 4) 'SalPercentOverAvgSal'
From #Temp_Employee

Select *, Round((Salary/AvgSalary)*100, 4) 'SalPercentOverAvgSal'
From #Temp_Employee

-- tanpa CTE/Temp_table
Select dem.EmployeeID, FirstName, LastName, Gender, Salary,
 Count(Gender) Over (Partition by Gender) TotalGender,
 Avg(Salary) Over (Partition by Gender) AvgSalGen,
 Round((sal.Salary/Cast(Avg(Salary) Over (Partition by Gender) as float))*100, 4) SalPercentOverAvgSal
From SQLTutorial..EmployeeDemographics dem
Join SQLTutorial..EmployeeSalary sal
	On dem.EmployeeID = sal.EmployeeID
Where Salary > 45000

-- DROP TABLE IF EXISTS
-- If that temp table already exist, it's going to delete that table and then allow to created again.
-- So we can run the query multiple time

DROP TABLE IF EXISTS #Temp_Employee
Create Table #Temp_Employee
(EmployeeID int, FirstName varchar(50), LastName varchar(50), Gender varchar(50), Salary int, TotalGender int, AvgSalary float)

Insert into #Temp_Employee
Select dem.EmployeeID, FirstName, LastName, Gender, Salary, Count(gender) Over(Partition by gender) TotalGender,
Cast(Avg(Salary) Over (Partition by Gender) as float) AvgSalary
From SQLTutorial..EmployeeDemographics dem
Join SQLTutorial..EmployeeSalary sal
	On dem.EmployeeID = sal.EmployeeID
Where Salary > 45000

Select *
From #Temp_Employee