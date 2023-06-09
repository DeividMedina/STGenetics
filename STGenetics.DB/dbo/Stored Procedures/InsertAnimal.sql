CREATE PROCEDURE InsertAnimal
    @Name VARCHAR(100),
    @Breed VARCHAR(100),
    @BirthDate DATE,
    @Sex VARCHAR(10),
    @Price DECIMAL(10, 2),
    @Status VARCHAR(10)
AS
BEGIN
    INSERT INTO Animal (Name, Breed, BirthDate, Sex, Price, Status)
    VALUES (@Name, @Breed, @BirthDate, @Sex, @Price, @Status)
END