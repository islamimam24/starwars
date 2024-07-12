import 'package:starwars/src/data/models/starships_model.dart';

class StarshipEntity {
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

  const StarshipEntity({
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
  StarshipEntity.copy(StarshipModel starshipModel)
      : this(
          name: starshipModel.name,
          model: starshipModel.model,
          manufacturer: starshipModel.manufacturer,
          costCredits: starshipModel.costCredits,
          length: starshipModel.length,
          maxAtmospheringSpeed: starshipModel.maxAtmospheringSpeed,
          crew: starshipModel.crew,
          passengers: starshipModel.passengers,
          cargoCapacity: starshipModel.cargoCapacity,
          consumables: starshipModel.consumables,
          hyperdriveRating: starshipModel.hyperdriveRating,
          mGLT: starshipModel.mGLT,
          starshipClass: starshipModel.starshipClass,
          pilots: starshipModel.pilots,
          films: starshipModel.films,
          image: starshipModel.image,
          url: starshipModel.url,
        );

  StarshipEntity.empty()
      : this(
          name: "name.empty",
          model: "model.empty",
          manufacturer: "manufacturer.empty",
          costCredits: "costCredits.empty",
          length: "length.empty",
          maxAtmospheringSpeed: "maxAtmospheringSpeed.empty",
          crew: "crew.empty",
          passengers: "passengers.empty",
          cargoCapacity: "cargoCapacity.empty",
          consumables: "consumables.empty",
          hyperdriveRating: "hyperdriveRating.empty",
          mGLT: "mGLT.empty",
          starshipClass: "starshipClass.empty",
          pilots: [],
          films: [],
          image: "image.empty",
          url: "url.empty",
        );
}
