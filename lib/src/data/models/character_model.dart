import 'package:starwars/src/domain/entities/character_entity.dart';

class CharacterModel {
  // int? id;
  String name, height, mass, hairColor, skinColor, eyeColor, birthYear, gender, homeworld, created, edited, url, image;
  List<String>? films, species, vehicles, starships;

  CharacterModel(
      {
      // this.id,
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
      required this.vehicles,
      required this.starships,
      required this.created,
      required this.species,
      required this.edited,
      required this.url,
      required this.image});

  CharacterModel.copy(CharacterEntity characterEntity)
      : this(
            name: characterEntity.name,
            height: characterEntity.height,
            mass: characterEntity.mass,
            hairColor: characterEntity.hairColor,
            skinColor: characterEntity.skinColor,
            eyeColor: characterEntity.eyeColor,
            birthYear: characterEntity.birthYear,
            gender: characterEntity.gender,
            homeworld: characterEntity.homeworld,
            films: characterEntity.films,
            vehicles: characterEntity.vehicles,
            starships: characterEntity.starships,
            species: characterEntity.species,
            created: characterEntity.created,
            edited: characterEntity.edited,
            url: characterEntity.url,
            image: characterEntity.image);
  CharacterModel.fromJson(Map<String, dynamic> json)
      : this(
          name: json['name'],
          height: json['height'],
          mass: json['mass'],
          hairColor: json['hair_color'],
          skinColor: json['skin_color'],
          eyeColor: json['eye_color'],
          birthYear: json['birth_year'],
          gender: json['gender'] ?? "-",
          homeworld: json['homeworld'],
          films: json['films'].cast<String>(),
          vehicles: json['vehicles'].cast<String>(),
          starships: json['starships'].cast<String>(),
          species: json['species'].cast<String>(),
          created: json['created'],
          edited: json['edited'],
          url: json['url'],
          image: json['image'] ?? "https://via.placeholder.com/150",
        );
}
