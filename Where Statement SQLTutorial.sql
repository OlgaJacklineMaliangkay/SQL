SELECT *
FROM EmployeeDemographics
WHERE LastName = 'Martin'

SELECT *
FROM EmployeeDemographics
WHERE FirstName <> 'Angela'

SELECT *
FROM EmployeeDemographics
WHERE Age > 26

SELECT *
FROM EmployeeDemographics
WHERE Age <= 28 OR Gender = 'Female'

SELECT *
FROM EmployeeDemographics
WHERE Age <= 28 AND Gender = 'Female'

SELECT *
FROM EmployeeDemographics
WHERE FirstName LIKE 'M%'

SELECT *
FROM EmployeeDemographics
WHERE FirstName LIKE '%e%'

SELECT *
FROM EmployeeDemographics
WHERE FirstName LIKE 'M%e%h'

SELECT *
FROM EmployeeDemographics
WHERE FirstName LIKE 'M%e%h%'

SELECT *
FROM EmployeeDemographics
WHERE FirstName LIKE 'M%h%e%'

SELECT *
FROM EmployeeDemographics
WHERE FirstName NOT LIKE 'M%e%'

SELECT *
FROM EmployeeDemographics
WHERE FirstName is NULL

SELECT *
FROM EmployeeDemographics
WHERE FirstName is NOT NULL

SELECT *
FROM EmployeeDemographics
WHERE Age IN (30, 38)

SELECT *
FROM EmployeeDemographics
WHERE FirstName IN ('Jim', 'Pam')