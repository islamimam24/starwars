import 'package:starwars/src/data/models/planets_model.dart';

class PlanetEntity {
  final String name,
      rotationPeriod,
      orbitalPeriod,
      diameter,
      climate,
      gravity,
      terrain,
      surfaceWater,
      population,
      image;
  final List<String> characters, films;
  PlanetEntity({
    required this.name,
    required this.rotationPeriod,
    required this.orbitalPeriod,
    required this.diameter,
    required this.climate,
    required this.gravity,
    required this.terrain,
    required this.surfaceWater,
    required this.population,
    required this.characters,
    required this.films,
    required this.image,
  });

  PlanetEntity.copy(PlanetModel planetsModel)
      : this(
            name: planetsModel.name,
            rotationPeriod: planetsModel.rotationPeriod,
            orbitalPeriod: planetsModel.orbitalPeriod,
            diameter: planetsModel.diameter,
            climate: planetsModel.climate,
            gravity: planetsModel.gravity,
            terrain: planetsModel.terrain,
            surfaceWater: planetsModel.surfaceWater,
            population: planetsModel.population,
            characters: planetsModel.characters,
            films: planetsModel.films,
            image: planetsModel.image);

  PlanetEntity.empty()
      : this(
          name: "name.empty",
          rotationPeriod: "rotationPeriod.empty",
          orbitalPeriod: "orbitalPeriod.empty",
          diameter: "diameter.empty",
          climate: "climate.empty",
          gravity: "gravity.empty",
          terrain: "terrain.empty",
          surfaceWater: "surfaceWater.empty",
          population: "population.empty",
          characters: [],
          films: [],
          image: "image.empty",
        );
}
