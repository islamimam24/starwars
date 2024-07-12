import 'package:starwars/core/utils/typdef.dart';
import 'package:starwars/src/domain/entities/planets_entity.dart';

class PlanetModel {
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
  PlanetModel({
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

  PlanetModel.copy(PlanetEntity planetsEntity)
      : this(
          name: planetsEntity.name,
          rotationPeriod: planetsEntity.rotationPeriod,
          orbitalPeriod: planetsEntity.orbitalPeriod,
          diameter: planetsEntity.diameter,
          climate: planetsEntity.climate,
          gravity: planetsEntity.gravity,
          terrain: planetsEntity.terrain,
          surfaceWater: planetsEntity.surfaceWater,
          population: planetsEntity.population,
          characters: planetsEntity.characters,
          films: planetsEntity.films,
          image: planetsEntity.image,
        );

  PlanetModel.fromJson(DataMap json)
      : this(
          name: json["name"],
          rotationPeriod: json["rotation_period"],
          orbitalPeriod: json["orbital_period"],
          diameter: json["diameter"],
          climate: json["climate"],
          gravity: json["gravity"],
          terrain: json["terrain"],
          surfaceWater: json["surface_water"],
          population: json["population"],
          characters: json["residents"].cast<String>(),
          films: json["films"].cast<String>(),
          image: json["image"] ?? "https://via.placeholder.com/150",
        );
}
