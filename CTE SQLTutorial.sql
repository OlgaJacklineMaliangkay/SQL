-- CTE is a common table expession and it's a temporary result set which is used to manipulate complex sub queries data
-- This only exists whitin the scope of the statement that we're about to write
-- Once we cancel all the query it's like never existed
-- A CTE is also only created in memory rather than a tempdb file like temp_table would be

-- CTE digunakan jika kita perlu menggunakan fungsi agregat yg kita definisikan dalam perhitungan untuk kolom selanjutnya

-- example: ingin melihat berapa persen salary per individu employee yang mempunyai salary diatas 45000 dari rata2 salary berdasarkan gender
With CTE_Employee as
(Select dem.EmployeeID, FirstName, LastName, Gender, Salary, Count(gender) Over(Partition by gender) TotalGender,
Cast(Avg(Salary) Over (Partition by Gender) as float) AvgSalary
From SQLTutorial..EmployeeDemographics dem
Join SQLTutorial..EmployeeSalary sal
	On dem.EmployeeID = sal.EmployeeID
Where Salary > 45000
)

Select *, Round(((Salary/AvgSalary)*100), 4) 'SalPercentOverAvgSal'
From CTE_Employee

-- SELECT FROM must be exactly below the CTE
-- It'll be Error if SELECT not execute with the entire CTE

-- tanpa CTE
Select dem.EmployeeID, FirstName, LastName, Gender, Salary,
 Count(Gender) Over (Partition by Gender) TotalGender,
 Avg(Salary) Over (Partition by Gender) AvgSalGen,
 Round((sal.Salary/Cast(Avg(Salary) Over (Partition by Gender) as float))*100, 4)
From SQLTutorial..EmployeeDemographics dem
Join SQLTutorial..EmployeeSalary sal
	On dem.EmployeeID = sal.EmployeeID
Where Salary > 45000

