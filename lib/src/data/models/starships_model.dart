import 'package:starwars/core/utils/typdef.dart';
import 'package:starwars/src/domain/entities/starships_entity.dart';

class StarshipModel {
  final String name,
      model,
      manufacturer,
      costCredits,
      length,
      maxAtmospheringSpeed,
      crew,
      passengers,
      cargoCapacity,
      consumables,
      hyperdriveRating,
      mGLT,
      starshipClass,
      image,
      url;
  final List pilots, films;

  const StarshipModel({
    required this.name,
    required this.model,
    required this.manufacturer,
    required this.costCredits,
    required this.length,
    required this.maxAtmospheringSpeed,
    required this.crew,
    required this.passengers,
    required this.cargoCapacity,
    required this.consumables,
    required this.hyperdriveRating,
    required this.mGLT,
    required this.starshipClass,
    required this.pilots,
    required this.films,
    required this.image,
    required this.url,
  });
  StarshipModel.copy(StarshipEntity starshipEntity)
      : this(
          name: starshipEntity.name,
          model: starshipEntity.model,
          manufacturer: starshipEntity.manufacturer,
          costCredits: starshipEntity.costCredits,
          length: starshipEntity.length,
          maxAtmospheringSpeed: starshipEntity.maxAtmospheringSpeed,
          crew: starshipEntity.crew,
          passengers: starshipEntity.passengers,
          cargoCapacity: starshipEntity.cargoCapacity,
          consumables: starshipEntity.consumables,
          hyperdriveRating: starshipEntity.hyperdriveRating,
          mGLT: starshipEntity.mGLT,
          starshipClass: starshipEntity.starshipClass,
          pilots: starshipEntity.pilots,
          films: starshipEntity.films,
          image: starshipEntity.image,
          url: starshipEntity.url,
        );

  StarshipModel.fromJson(DataMap json)
      : this(
          name: json["name"],
          model: json["model"],
          manufacturer: json["manufacturer"],
          costCredits: json["cost_in_credits"],
          length: json["length"],
          maxAtmospheringSpeed: json["max_atmosphering_speed"],
          crew: json["crew"],
          passengers: json["passengers"],
          cargoCapacity: json["cargo_capacity"],
          consumables: json["consumables"],
          hyperdriveRating: json["hyperdrive_rating"],
          mGLT: json["MGLT"],
          starshipClass: json["starship_class"],
          pilots: json["pilots"].cast<String>(),
          films: json["films"].cast<String>(),
          image: json["image"] ?? "https://via.placeholder.com/150",
          url: json["url"],
        );
}
