Select Max(Salary) max, Min(Salary) min, Avg(Salary) avg, (Max(Salary)-Min(Salary)) range
From SQLTutorial..EmployeeSalary

--mengkategorikan employee berdasarkan besar salary
--case when selalu digunakan setelah select dan jgn lupa tanda koma (,)

Select *,
CASE
	When Salary <= 20000 Then 'A'
	WHEN Salary <= 40000 Then 'B'
	When Salary <= 60000 Then 'C'
	ELSE 'D'
End AS SalaryCategory
From SQLTutorial..EmployeeDemographics dem
Full Outer Join SQLTutorial..EmployeeSalary sal
	On dem.EmployeeID = sal.EmployeeID
Where Salary is not NULL
Order by Salary

-- misal ingin meningkatkan gaji karyawan karena sales perusahaan meningkat.
-- peningkatan gaji tidak merata, melainkan berbeda-beda bergantung dari pengaruh masing-masing jobtitle terhadap peningkatan sales

Select *,
Case 
	When JobTitle = 'Salesman' Then Salary+(Salary* .10)
	When JobTitle = 'Accountant' Then Salary+(Salary* .05)
	When JobTitle = 'HR' Then Salary+(Salary* .001)
	Else Salary+(Salary* .03)
End As NewSalary
From SQLTutorial..EmployeeSalary
