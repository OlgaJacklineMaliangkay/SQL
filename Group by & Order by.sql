SELECT *
FROM EmployeeDemographics

SELECT DISTINCT(Age)
FROM EmployeeDemographics

SELECT Age
FROM EmployeeDemographics
Group by Age

SELECT Age, COUNT(Age)
FROM EmployeeDemographics
Group by Age

SELECT Age, Gender, COUNT(Age)
FROM EmployeeDemographics
Group by Age, Gender

SELECT Age, COUNT(Age)
FROM EmployeeDemographics
Where Gender = 'Male' and Age > 26
Group by Age

SELECT Age, COUNT(Age) As CountAge
FROM EmployeeDemographics
Where Gender = 'Male' and Age > 26
Group by Age
Order by CountAge DESC

SELECT Gender, Age, COUNT(Age) As CountAge
FROM EmployeeDemographics
Where Age < 29
Group by Age, Gender
Order by Gender DESC, Age DESC

SELECT *
FROM EmployeeDemographics
Order by 5 DESC, 4 DESC

SELECT *
FROM EmployeeDemographics
Where Age < 29
Order by Gender DESC, Age

SELECT *
FROM EmployeeDemographics
Where Age < 29
Order by Gender DESC, Age DESC