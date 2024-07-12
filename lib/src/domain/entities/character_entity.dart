import 'package:starwars/src/data/models/character_model.dart';

class CharacterEntity {
  int? id;
  String name, height, mass, hairColor, skinColor, eyeColor, birthYear, gender, homeworld, created, edited, url, image;
  List<String>? films, species, vehicles, starships;

  CharacterEntity(
      {this.id,
      required this.name,
      required this.height,
      required this.mass,
      required this.hairColor,
      required this.skinColor,
      required this.eyeColor,
      required this.birthYear,
      required this.gender,
      required this.homeworld,
      required this.films,
      required this.species,
      required this.vehicles,
      required this.starships,
      required this.created,
      required this.edited,
      required this.url,
      required this.image});

  CharacterEntity.copy(CharacterModel characterModel)
      : this(
          name: characterModel.name,
          height: characterModel.height,
          mass: characterModel.mass,
          hairColor: characterModel.hairColor,
          skinColor: characterModel.skinColor,
          eyeColor: characterModel.eyeColor,
          birthYear: characterModel.birthYear,
          gender: characterModel.gender,
          homeworld: characterModel.homeworld,
          films: characterModel.films,
          vehicles: characterModel.vehicles,
          starships: characterModel.starships,
          species: characterModel.species,
          created: characterModel.created,
          edited: characterModel.edited,
          url: characterModel.url,
          image: characterModel.image,
        );

  CharacterEntity.empty()
      : this(
          name: "name.empty",
          height: "height.empty",
          mass: "mass.empty",
          hairColor: "hairColor.empty",
          skinColor: "skinColor.empty",
          eyeColor: "eyeColor.empty",
          birthYear: "birthYear.empty",
          gender: "gender.empty",
          homeworld: "homeworld.empty",
          films: [],
          vehicles: [],
          starships: [],
          species: [],
          created: "created.empty",
          edited: "edited.empty",
          url: "url.empty",
          image: "image.empty",
        );
}
