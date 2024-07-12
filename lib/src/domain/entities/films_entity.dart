import 'package:starwars/src/data/models/films_model.dart';

class FilmEntity {
  final int episodeId;

  final String title, openingCraw, director, producer, releaseDate, image, url;
  final List<String> characters, species, vehicles, starships, planets;

  const FilmEntity({
    required this.title,
    required this.episodeId,
    required this.openingCraw,
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

  FilmEntity.copy(FilmModel filmModel)
      : this(
          title: filmModel.title,
          episodeId: filmModel.episodeId,
          openingCraw: filmModel.openingCrawl,
          director: filmModel.director,
          producer: filmModel.producer,
          releaseDate: filmModel.releaseDate,
          image: filmModel.image,
          url: filmModel.url,
          characters: filmModel.characters,
          species: filmModel.species,
          vehicles: filmModel.vehicles,
          starships: filmModel.starships,
          planets: filmModel.planets,
        );
  FilmEntity.empty()
      : this(
          title: "title.empty",
          episodeId: 0,
          openingCraw: "openingCraw.empty",
          director: "director.empty",
          producer: "producer.empty",
          releaseDate: "releaseDate.empty",
          image: "image.empty",
          url: "url.empty",
          characters: [],
          species: [],
          vehicles: [],
          starships: [],
          planets: [],
        );
}
