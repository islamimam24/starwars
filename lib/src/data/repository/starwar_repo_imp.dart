import 'package:dartz/dartz.dart';
import 'package:starwars/core/errors/exceptions.dart';
import 'package:starwars/core/errors/failure.dart';
import 'package:starwars/src/data/models/character_model.dart';
import 'package:starwars/src/data/models/films_model.dart';
import 'package:starwars/src/data/models/planets_model.dart';
import 'package:starwars/src/data/models/starships_model.dart';
import 'package:starwars/src/data/repository/starwars_repo_ds.dart';
import 'package:starwars/src/domain/entities/character_entity.dart';
import 'package:starwars/core/utils/typdef.dart';
import 'package:starwars/src/domain/entities/starships_entity.dart';
import 'package:starwars/src/domain/entities/planets_entity.dart';
import 'package:starwars/src/domain/entities/films_entity.dart';
import 'package:starwars/src/domain/repository/starwar_repo.dart';
import 'package:starwars/src/domain/usecases/get_characters.dart';
import 'package:starwars/src/domain/usecases/get_planets.dart';
import 'package:starwars/src/domain/usecases/get_starhips.dart';

class StarwarsRepoImp implements StarwarsRepo {
  StarwarsRepoDS _starwarsRepoDS;
  StarwarsRepoImp(this._starwarsRepoDS);

  @override
  ResultFuture<List<CharacterEntity>> getCharacters(GetCharacterParams getCharacterParams) async {
    try {
      final results = await _starwarsRepoDS.getCharacters(getCharacterParams);
      return Right(results.map((e) => CharacterEntity.copy(e)).toList());
    } on APIException catch (e) {
      return Left(APIFailure.fromException(e));
    }
  }

  @override
  ResultFuture<List<FilmEntity>> getFilms(List<String> queryList) async {
    try {
      final results = await _starwarsRepoDS.getFilms(queryList);
      return Right(results.map((e) => FilmEntity.copy(e)).toList());
    } on APIException catch (e) {
      return Left(APIFailure.fromException(e));
    }
  }

  @override
  ResultFuture<List<PlanetEntity>> getPlanets(GetPlanetsParams getPlanetsParams) async {
    try {
      final results = await _starwarsRepoDS.getPlanets(getPlanetsParams);
      return Right(results.map((e) => PlanetEntity.copy(e)).toList());
    } on APIException catch (e) {
      return Left(APIFailure.fromException(e));
    }
  }

  @override
  ResultFuture<List<StarshipEntity>> getStarships(GetStarshipsParams getStarshipsParams) async {
    try {
      final results = await _starwarsRepoDS.getStarships(getStarshipsParams);
      return Right(results.map((e) => StarshipEntity.copy(e)).toList());
    } on APIException catch (e) {
      return Left(APIFailure.fromException(e));
    }
  }
}
