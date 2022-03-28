Select *
From SQLTutorial..EmployeeDemographics

Select *
From SQLTutorial..EmployeeSalary

Select *
From SQLTutorial..WareHouseEmployeeDemographics

Select *
From SQLTutorial..EmployeeDemographics dem
Inner Join SQLTutorial..EmployeeSalary sal
	On dem.EmployeeID = sal.EmployeeID

Select *
From SQLTutorial..EmployeeDemographics dem
Join SQLTutorial..EmployeeSalary sal
	On dem.EmployeeID = sal.EmployeeID

Select *
From SQLTutorial..EmployeeSalary sal
Join SQLTutorial..EmployeeDemographics dem
	On dem.EmployeeID = sal.EmployeeID

--Tabel 1 dan 2 sama, tabel 3 dan 4 juga sama hanya perbedaan urutan penempatan kolomnya saja

--1
Select *
From SQLTutorial..EmployeeDemographics dem
Left Outer Join SQLTutorial..EmployeeSalary sal
	On dem.EmployeeID = sal.EmployeeID

--2
Select *
From SQLTutorial..EmployeeSalary sal
Right Outer Join SQLTutorial..EmployeeDemographics dem
	On dem.EmployeeID = sal.EmployeeID

--3
Select *
From SQLTutorial..EmployeeSalary sal
Left Outer Join SQLTutorial..EmployeeDemographics dem
	On dem.EmployeeID = sal.EmployeeID

--4
Select *
From SQLTutorial..EmployeeDemographics dem
Right Outer Join SQLTutorial..EmployeeSalary sal
	On dem.EmployeeID = sal.EmployeeID

--Tabel 5 dan 6 sama hanya urutan kolomnya saja yg berbeda

--5
Select *
From SQLTutorial..EmployeeDemographics dem
Full Outer Join SQLTutorial..EmployeeSalary sal
	On dem.EmployeeID = sal.EmployeeID

--6
Select *
From SQLTutorial..EmployeeSalary sal
Full Outer Join SQLTutorial..EmployeeDemographics dem
	On dem.EmployeeID = sal.EmployeeID

--Ingin melakukan penurunan salary selain dari pada gaji para salesman dan diutamakan utk gaji diatas 45000 (misalnya 45000 itu UMR)
Select sal.EmployeeID, FirstName, LastName, JobTitle, Salary
From SQLTutorial..EmployeeDemographics dem
Join SQLTutorial..EmployeeSalary sal
	On dem.EmployeeID = sal.EmployeeID
WHERE Jobtitle <> 'Salesman' and Salary >= 45000
Order by Salary Desc

--ingin melihat rata-rata gaji berdasarkan pekerjaan
Select JobTitle, AVG(Salary) as AverageSalary
From SQLTutorial..EmployeeDemographics dem
Join SQLTutorial..EmployeeSalary sal
	On dem.EmployeeID = sal.EmployeeID
Group by JobTitle
Order by AVG(Salary) Desc

--ingin melihat Gaji sales per orang
Select dem.EmployeeID, FirstName, LastName, AVG(Salary) as AverageSalarySales
From SQLTutorial..EmployeeDemographics dem
Join SQLTutorial..EmployeeSalary sal
	On dem.EmployeeID = sal.EmployeeID
Where Jobtitle = 'Salesman'
Group by dem.EmployeeID, FirstName, LastName
Order by AVG(Salary) Desc


