import 'package:starwars/core/utils/typdef.dart';
import 'package:starwars/src/domain/entities/character_entity.dart';
import 'package:starwars/src/domain/entities/films_entity.dart';
import 'package:starwars/src/domain/entities/planets_entity.dart';
import 'package:starwars/src/domain/entities/starships_entity.dart';
import 'package:starwars/src/domain/usecases/get_characters.dart';
import 'package:starwars/src/domain/usecases/get_planets.dart';
import 'package:starwars/src/domain/usecases/get_starhips.dart';

abstract class StarwarsRepo {
  ResultFuture<List<CharacterEntity>> getCharacters(GetCharacterParams getCharacterParams);
  ResultFuture<List<FilmEntity>> getFilms(List<String> queryList);
  ResultFuture<List<PlanetEntity>> getPlanets(GetPlanetsParams getPlanetsParams);
  ResultFuture<List<StarshipEntity>> getStarships(GetStarshipsParams getStarshipsParams);
}
