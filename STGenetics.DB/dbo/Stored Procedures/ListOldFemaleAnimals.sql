CREATE PROCEDURE ListOldFemaleAnimals
AS
BEGIN
    SET NOCOUNT ON;

    SELECT AnimalId, Name, Breed, BirthDate, Sex, Price, Status
    FROM Animal
    WHERE BirthDate <= DATEADD(YEAR, -2, GETDATE()) -- Older than 2 years
        AND Sex = 'Female'
    ORDER BY Name
END