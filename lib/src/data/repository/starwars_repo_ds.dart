import 'package:starwars/core/utils/typdef.dart';
import 'package:starwars/src/data/models/character_model.dart';
import 'package:starwars/src/data/models/films_model.dart';
import 'package:starwars/src/data/models/planets_model.dart';
import 'package:starwars/src/data/models/starships_model.dart';
import 'package:starwars/src/domain/usecases/get_characters.dart';
import 'package:starwars/src/domain/usecases/get_planets.dart';
import 'package:starwars/src/domain/usecases/get_starhips.dart';

abstract class StarwarsRepoDS {
  Future<List<CharacterModel>> getCharacters(GetCharacterParams getCharacterParams);
  Future<List<FilmModel>> getFilms(List<String> queryList);
  Future<List<PlanetModel>> getPlanets(GetPlanetsParams getPlanetsParams);
  Future<List<StarshipModel>> getStarships(GetStarshipsParams getStarshipsParams);
}
