using Dapper;
using STGenetics.Models.Animals;
using System.Data;

namespace STGenetics.API.Models
{
    public class AnimalRepository : IAnimalRepository
    {
        private readonly IDbConnection _dbConnection;

        public AnimalRepository(IDbConnection dbConnection)
        {
            _dbConnection = dbConnection;
        }

        public async Task<IEnumerable<Animal>> GetAnimals(int? animalId, string? name, string? sex, string? status)
        {
            var parameters = new
            {
                AnimalId = int.Equals(animalId,0) ? (object)DBNull.Value : animalId,
                Name = string.IsNullOrWhiteSpace(name) ? (object)DBNull.Value : name,
                Sex = string.IsNullOrWhiteSpace(sex) ? (object)DBNull.Value : sex,
                Status = string.IsNullOrWhiteSpace(status) ? (object)DBNull.Value : status
            };

            var animals = await _dbConnection.QueryAsync<Animal>("GetAnimals", parameters, commandType: CommandType.StoredProcedure);

            return animals;
        }

        public async Task<Animal> SaveAnimalAsync(Animal animal)
        {
            var parameters = new
            {
                // Map the parameters needed for the SaveAnimal stored procedure
                Name = animal.Name,
                Breed = animal.Breed,
                BirthDate = animal.BirthDate,
                Sex = animal.Sex,
                Price = animal.Price,
                Status = animal.Status
            };

            // Execute the SaveAnimal stored procedure
            var result = await _dbConnection.QuerySingleOrDefaultAsync<Animal>("InsertAnimal", parameters, commandType: CommandType.StoredProcedure);

            return result;
        }

        public async Task UpdateAnimalAsync(int id, Animal animal)
        {
            var parameters = new
            {
                AnimalId = id,
                Name = animal.Name,
                Breed = animal.Breed,
                BirthDate = animal.BirthDate,
                Sex = animal.Sex,
                Price = animal.Price,
                Status = animal.Status
            };

            // Execute the UpdateAnimal stored procedure
            await _dbConnection.ExecuteAsync("UpdateAnimal", parameters, commandType: CommandType.StoredProcedure);
        }
        public async Task DeleteAnimalAsync(int id)
        {
            var parameters = new
            {
                AnimalId = id
            };

            // Execute the DeleteAnimal stored procedure
            await _dbConnection.ExecuteAsync("DeleteAnimal", parameters, commandType: CommandType.StoredProcedure);
        }
    }
}
