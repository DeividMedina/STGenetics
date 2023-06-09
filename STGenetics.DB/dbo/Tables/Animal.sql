CREATE TABLE [dbo].[Animal] (
    [AnimalId]  INT             IDENTITY (1, 1) NOT NULL,
    [Name]      VARCHAR (100)   NOT NULL,
    [Breed]     VARCHAR (100)   NOT NULL,
    [BirthDate] DATE            NOT NULL,
    [Sex]       VARCHAR (10)    NOT NULL,
    [Price]     DECIMAL (10, 2) NOT NULL,
    [Status]    VARCHAR (10)    NOT NULL,
    PRIMARY KEY CLUSTERED ([AnimalId] ASC),
    CHECK ([Sex]='Female' OR [Sex]='Male'),
    CHECK ([Status]='Inactive' OR [Status]='Active')
);

