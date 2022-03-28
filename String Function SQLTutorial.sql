-- Drop table EmployeeError
CREATE TABLE EmployeeErrors (
EmployeeID varchar(100),
FirstName varchar(100),
LasName varchar(100)
)

Insert Into EmployeeErrors Values
('1001 ', 'Jimbo', 'Halbert'),
(' 1002', 'Pamela', 'Beasely'),
('1005', 'TOby', 'Flenderson - Fired')

Select *
From EmployeeErrors

-- Using TRIM, LTRIM, RTRIM
Select EmployeeID, TRIM(EmployeeID) as IDTRIM
FROM EmployeeErrors

Select EmployeeID, LTRIM(EmployeeID) as IDTRIM
FROM EmployeeErrors

Select EmployeeID, RTRIM(EmployeeID) as IDTRIM
FROM EmployeeErrors

-- Using Replace
Select LasName, REPLACE(LasName, ' - Fired', '') as LastNameFixed
From EmployeeErrors

-- Using Substring(Namakolom, diambil dari huruf ke-brp, diambil huruf ke kanan)
Select SUBSTRING(FirstName,1,3)
From EmployeeErrors

Select SUBSTRING(FirstName,3,3)
From EmployeeErrors

Select FirstName
From EmployeeErrors

Select err.FirstName, dem.FirstName
From EmployeeErrors err
JOIN EmployeeDemographics dem
	ON err.FirstName = dem.FirstName

Select SUBSTRING(err.FirstName,1,3), SUBSTRING(dem.FirstName,1,3)
From EmployeeErrors err
JOIN EmployeeDemographics dem
	ON SUBSTRING(err.FirstName,1,3) = SUBSTRING(dem.FirstName,1,3)

-- Upper and Lower
Select Lower(FirstName), upper(FirstName)
From EmployeeErrors

