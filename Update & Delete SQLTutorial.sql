-- Inserting data = create a new row in your table
-- Updating data = Alter a pre-existing row
-- Deleting data = Specify what rows you want to remove from your table

Select *
From SQLTutorial..EmployeeDemographics

Update SQLTutorial..EmployeeDemographics
SET EmployeeID = 1012
Where FirstName = 'Holly' AND LastName = 'Flax'

Update SQLTutorial..EmployeeDemographics
SET Age = 31, Gender = 'Female'
Where FirstName = 'Holly' AND LastName = 'Flax'

-- Delete From SQLTutorial..EmployeeDemographics
-- Where EmployeeID = 1005

-- Delete the entire table
-- Delete From SQLTutorial..EmployeeDemographics

-- Use select before deleting data for we don't make a mistake
Select *
From SQLTutorial..EmployeeDemographics
Where EmployeeID = 1004

-- Delete From SQLTutorial..EmployeeDemographics
-- Where EmployeeID = 1004