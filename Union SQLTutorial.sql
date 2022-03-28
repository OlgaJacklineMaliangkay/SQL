--mau menggabungkan data demographic yg hilang di warehouse
Select *
From SQLTutorial..EmployeeDemographics

Select *
From SQLTutorial..WareHouseEmployeeDemographics

--Menggunakan Full outer join
Select *
From SQLTutorial..EmployeeDemographics dem
Full Outer Join SQLTutorial..WareHouseEmployeeDemographics war
	On dem.EmployeeID = war.EmployeeID

--menggunakan Union data yg sama tdk dimasukkan lagi, union hanya bisa digunakan jika jumlah kolom dan jenis per kolom (berurutan) nya sama
Select *
From SQLTutorial..EmployeeDemographics
Union
Select *
From SQLTutorial..WareHouseEmployeeDemographics
Order by EmployeeID

--data yg sama (tumpang tindih) tetap di masukkan kembali (Darryl 1013) ada pada 2 baris
Select *
From SQLTutorial..EmployeeDemographics
Union ALL
Select *
From SQLTutorial..WareHouseEmployeeDemographics
Order by EmployeeID

-- apakah data demographic dan salary dapat disatukan?
Select *
From SQLTutorial..EmployeeDemographics

Select *
From SQLTutorial..EmployeeSalary

--Union dapat digunakan untuk menyatukan kolom yg berbeda asalkan tipenya sama. Misal string dgn string, int dgn int, float dgn float
Select EmployeeID, Gender, Age
From SQLTutorial..EmployeeDemographics
Union All
Select EmployeeID, JobTitle, Salary
From SQLTutorial..EmployeeSalary
Order by 1

-- similary and difference between join and union

--both combining 2 tables to create one output
--join combine both tables based off a comon column. both table have min one same table
--u can choose both same comon column in seperate new column int= the result
--union able to select all data from both tables and put it into one output
--where each data in one column and not seperate it out
--and we don't have to choose which table you choosing it from