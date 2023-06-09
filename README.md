# STGenetics code challenge

- Steps to Run

1. Publish the STGenetics.DB project in any SQLServer instance (Check if all the db objects was created, just one table and 6 sp).
2. Validate that TestDataForAnimals script was executed, if wasn't execute it manually directly into the db.
3. Upload the Connection String at appsettings.json in STGenetics.API with your server and credentials if is needed.
4. Build and run STGenetics.API

Testing can be done by Swagger which is already implemented.
JWT is implemented and open to be used.

The only endpoint missing is the  -	Endpoint Order
