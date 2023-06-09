CREATE PROCEDURE GetAnimals
    @AnimalId INT = NULL,
    @Name VARCHAR(100) = NULL,
    @Sex VARCHAR(10) = NULL,
    @Status VARCHAR(10) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    SELECT AnimalId, Name, Breed, BirthDate, Sex, Price, Status
    FROM Animal
    WHERE (@AnimalId IS NULL OR AnimalId = @AnimalId)
        AND (@Name IS NULL OR Name LIKE '%' + @Name + '%')
        AND (@Sex IS NULL OR Sex = @Sex)
        AND (@Status IS NULL OR Status = @Status)
END