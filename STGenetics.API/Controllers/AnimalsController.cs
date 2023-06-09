using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using STGenetics.API.Models;
using STGenetics.Models.Animals;

namespace STGenetics.API.Controllers
{
    [ApiController]
    //[Authorize]
    public class AnimalsController : Controller
    {
        private readonly IAnimalRepository _animalRepository;

        public AnimalsController(IAnimalRepository animalRepository)
        {
            _animalRepository = animalRepository;
        }

        [HttpPost]
        [Route("api/FilterAnimals")]
        public async Task<ActionResult<IEnumerable<Animal>>> GetAnimals(Animal animal)
        {
            var animals = await _animalRepository.GetAnimals(animal.AnimalId, animal.Name, animal.Sex, animal.Status);

            return Ok(animals);
        }

        [HttpPost]
        [Route("api/CreateAnimal")]
        public async Task<IActionResult> CreateAnimal(Animal animal)
        {
            await _animalRepository.SaveAnimalAsync(animal);

            return Ok();
        }

        [HttpPatch]
        [Route("api/UpdateAnimal")]
        public async Task<IActionResult> UpdateAnimal(int id, Animal animal)
        {
            await _animalRepository.UpdateAnimalAsync(id, animal);

            return Ok();
        }

        [HttpDelete]
        [Route("api/DeleteAnimal")]
        public async Task<IActionResult> DeleteAnimal(int id)
        {
            await _animalRepository.DeleteAnimalAsync(id);

            return Ok();
        }

    }
}
