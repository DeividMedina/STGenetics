using STGenetics.Models.Animals;

namespace STGenetics.API.Models
{
    public interface IAnimalRepository
    {
        Task<IEnumerable<Animal>> GetAnimals(int? animalId, string? name, string? sex, string? status);
        Task<Animal> SaveAnimalAsync(Animal animal);
        Task UpdateAnimalAsync(int id, Animal animal);
        Task DeleteAnimalAsync(int id);
    }
}
