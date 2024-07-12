import 'package:starwars/src/data/client/starwars_client.dart';
import 'package:starwars/src/data/models/starships_model.dart';
import 'package:starwars/src/data/models/planets_model.dart';
import 'package:starwars/src/data/models/films_model.dart';
import 'package:starwars/src/data/models/character_model.dart';
import 'package:starwars/src/data/repository/starwars_repo_ds.dart';
import 'package:starwars/src/domain/usecases/get_characters.dart';
import 'package:starwars/src/domain/usecases/get_planets.dart';
import 'package:starwars/src/domain/usecases/get_starhips.dart';

class StarwarsRepoDsImpl implements StarwarsRepoDS {
  final StarwarsClient _client;
  StarwarsRepoDsImpl(this._client);
  @override
  Future<List<CharacterModel>> getCharacters(GetCharacterParams getCharacterParams) async {
    return await _client.getCharacters(getCharacterParams);
  }

  @override
  Future<List<FilmModel>> getFilms(List<String> queryList) async {
    return await _client.getFilms(queryList);
  }

  @override
  Future<List<PlanetModel>> getPlanets(GetPlanetsParams getPlanetsParams) async {
    return await _client.getPlanets(getPlanetsParams);
  }

  @override
  Future<List<StarshipModel>> getStarships(GetStarshipsParams getStarshipsParams) async {
    return await _client.getStarships(getStarshipsParams);
  }
}
