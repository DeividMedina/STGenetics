/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/
-- Generate sample data for 5000 records
DECLARE @AnimalData TABLE (
    
    Name VARCHAR(100),
    Breed VARCHAR(100),
    BirthDate DATE,
    Sex VARCHAR(10),
    Price DECIMAL(10, 2),
    Status VARCHAR(10)
)

DECLARE @Counter INT = 1

WHILE @Counter <= 5000
BEGIN
    DECLARE @Name VARCHAR(100) = 'Animal' + CAST(@Counter AS VARCHAR(10))
    DECLARE @Breed VARCHAR(100) = 'Breed' + CAST((@Counter % 10) + 1 AS VARCHAR(10))
    DECLARE @BirthDate DATE = DATEADD(DAY, -@Counter, GETDATE())
    DECLARE @Sex VARCHAR(10) = CASE WHEN @Counter % 2 = 0 THEN 'Male' ELSE 'Female' END
    DECLARE @Price DECIMAL(10, 2) = CAST(RAND() * 1000 + 500 AS DECIMAL(10, 2))
    DECLARE @Status VARCHAR(10) = CASE WHEN @Counter % 5 = 0 THEN 'Inactive' ELSE 'Active' END

    INSERT INTO @AnimalData ( Name, Breed, BirthDate, Sex, Price, Status)
    VALUES (@Name, @Breed, @BirthDate, @Sex, @Price, @Status)

    SET @Counter = @Counter + 1
END

-- Insert the sample data into the Animal table
INSERT INTO Animal (Name, Breed, BirthDate, Sex, Price, Status)
SELECT Name, Breed, BirthDate, Sex, Price, Status
FROM @AnimalData