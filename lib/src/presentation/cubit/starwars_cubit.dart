import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:starwars/core/utils/typdef.dart';

import 'package:starwars/src/domain/entities/character_entity.dart';
import 'package:starwars/src/domain/entities/films_entity.dart';
import 'package:starwars/src/domain/entities/planets_entity.dart';
import 'package:starwars/src/domain/entities/starships_entity.dart';
import 'package:starwars/src/domain/usecases/get_characters.dart';
import 'package:starwars/src/domain/usecases/get_films.dart';
import 'package:starwars/src/domain/usecases/get_planets.dart';
import 'package:starwars/src/domain/usecases/get_starhips.dart';

part 'starwars_state.dart';

class StarwarsCubit extends Cubit<StarwarsState> {
  final GetCharacters _getCharacters;
  final GetFilms _getFilms;
  final GetPlanets _getPlanets;
  final GetStarships _getStarships;
  StarwarsCubit({
    required GetCharacters getCharacters,
    required GetFilms getFilms,
    required GetPlanets getPlanets,
    required GetStarships getStarships,
  })  : _getCharacters = getCharacters,
        _getFilms = getFilms,
        _getPlanets = getPlanets,
        _getStarships = getStarships,
        super(StarwarsInitial());

  Future<void> getCharacters(GetCharacterParams getCharacterParams) async {
    emit(const GettingCharacters());
    final result = await _getCharacters(getCharacterParams);
    result.fold((l) => emit(const FailedGettingCharacters()), (charactersList) => emit(GotCharacters(charactersList)));
  }

  Future<void> getFilms({List<String>? queryList}) async {
    emit(const GettingFilms());
    final result = await _getFilms(queryList ?? []);
    result.fold((l) => emit(const FailedGettingFilms()), (films) => emit(GotFilms(films)));
  }

  Future<void> getPlanets(GetPlanetsParams getPlanetsParams) async {
    emit(const GettingPlanets());
    final result = await _getPlanets(getPlanetsParams);
    result.fold((l) => emit(const FailedGettingPlanets()), (planets) => emit(GotPlanets(planets)));
  }

  Future<void> getStarships(GetStarshipsParams getStarshipsParams) async {
    emit(const GettingStarships());
    final result = await _getStarships(getStarshipsParams);
    result.fold((l) => emit(const FailedGettingStarships()), (starships) => emit(GotStarships(starships)));
  }
}
