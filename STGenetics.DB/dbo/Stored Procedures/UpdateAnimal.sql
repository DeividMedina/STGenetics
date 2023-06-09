CREATE PROCEDURE UpdateAnimal
    @AnimalId INT,
    @Name VARCHAR(100),
    @Breed VARCHAR(100),
    @BirthDate DATE,
    @Sex VARCHAR(10),
    @Price DECIMAL(10, 2),
    @Status VARCHAR(10)
AS
BEGIN
    UPDATE Animal
    SET Name = @Name,
        Breed = @Breed,
        BirthDate = @BirthDate,
        Sex = @Sex,
        Price = @Price,
        Status = @Status
    WHERE AnimalId = @AnimalId
END