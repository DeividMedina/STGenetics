CREATE PROCEDURE ListAnimalCountBySex
AS
BEGIN
    SET NOCOUNT ON;

    SELECT Sex, COUNT(*) AS AnimalCount
    FROM Animal
    GROUP BY Sex
END