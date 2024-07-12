import 'package:starwars/src/domain/entities/films_entity.dart';

class FilmModel {
  final int episodeId;
  final String title, openingCrawl, director, producer, releaseDate, image, url;
  final List<String> characters, species, vehicles, starships, planets;

  const FilmModel({
    required this.title,
    required this.episodeId,
    required this.openingCrawl,
    required this.director,
    required this.producer,
    required this.releaseDate,
    required this.image,
    required this.url,
    required this.characters,
    required this.species,
    required this.vehicles,
    required this.starships,
    required this.planets,
  });

  FilmModel.copy(FilmEntity filmEntity)
      : this(
          title: filmEntity.title,
          episodeId: filmEntity.episodeId,
          openingCrawl: filmEntity.openingCraw,
          director: filmEntity.director,
          producer: filmEntity.producer,
          releaseDate: filmEntity.releaseDate,
          image: filmEntity.image,
          url: filmEntity.url,
          characters: filmEntity.characters,
          species: filmEntity.species,
          vehicles: filmEntity.vehicles,
          starships: filmEntity.starships,
          planets: filmEntity.planets,
        );
  FilmModel.fromJson(Map<String, dynamic> json)
      : this(
          title: json["title"],
          episodeId: json["episode_id"],
          openingCrawl: json["opening_crawl"],
          director: json["director"],
          producer: json["producer"],
          releaseDate: json["release_date"],
          image: json["image"] ?? "https://via.placeholder.com/150",
          url: json["url"],
          characters: json["characters"].cast<String>(),
          species: json["species"].cast<String>(),
          planets: json["planets"].cast<String>(),
          vehicles: json["vehicles"].cast<String>(),
          starships: json["starships"].cast<String>(),
        );
}
