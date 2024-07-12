import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starwars/core/services/dependency_injection.dart';
import 'package:starwars/src/domain/entities/character_entity.dart';
import 'package:starwars/src/domain/entities/films_entity.dart';
import 'package:starwars/src/domain/entities/planets_entity.dart';
import 'package:starwars/src/domain/entities/starships_entity.dart';

import 'package:starwars/src/presentation/cubit/starwars_cubit.dart';
import 'package:starwars/src/presentation/screens/characters_details.dart';
import 'package:starwars/src/presentation/screens/characters_scr.dart';
import 'package:starwars/src/presentation/screens/film_datail.dart';
import 'package:starwars/src/presentation/screens/films_scr.dart';
import 'package:starwars/src/presentation/screens/home.dart';
import 'package:starwars/src/presentation/screens/planet_detail.dart';
import 'package:starwars/src/presentation/screens/planets_scr.dart';
import 'package:starwars/src/presentation/screens/starships_detail.dart';
import 'package:starwars/src/presentation/screens/starships_scr.dart';

class AppRoutes {
  static int personalDataIndex = 0;
  static CharacterEntity characterEntity = CharacterEntity.empty();
  static FilmEntity filmEntity = FilmEntity.empty();
  static PlanetEntity planetEntity = PlanetEntity.empty();
  static StarshipEntity starshipEntity = StarshipEntity.empty();

  /// Navigation Strings

  /// Strings
  static const home = "/home";
  static const characters = "/characters";
  static const characterDetails = "/characterDetails";
  static const films = "/films";
  static const filmsDetail = "/filmsDetail";
  static const planets = "/planets";
  static const planetsDetail = "/planetsDetail";
  static const starships = "/starships";
  static const starshipsDetail = "/starshipsDetail";

  /// String Function
  static String toHome() => home;
  static String toCharacters() => characters;
  static String toCharacterDetails({required CharacterEntity characterEntityVal}) {
    characterEntity = characterEntityVal;
    return characterDetails;
  }

  static String toFilms() => films;
  static String toFilmDetail({required FilmEntity filmEntityval}) {
    filmEntity = filmEntityval;
    return filmsDetail;
  }

  static String toPlanets() => planets;
  static String toPlanetsDetail({required PlanetEntity planetEntityVal}) {
    planetEntity = planetEntityVal;
    return planetsDetail;
  }

  static String toStarships() => starships;
  static String toStarshipsDetail({required StarshipEntity starshipEntityVal}) {
    starshipEntity = starshipEntityVal;
    return starshipsDetail;
  }
}

/// Page Entity
class PageEntity<T> {
  String path;
  Widget page;
  dynamic bloc;
  PageEntity({
    required this.path,
    required this.page,
    required this.bloc,
  });
}

class AppPages {
  static List<PageEntity> routes() {
    return [
      PageEntity(path: AppRoutes.toHome(), page: const Home(), bloc: BlocProvider(create: (_) => get<StarwarsCubit>())),
      PageEntity(
          path: AppRoutes.toCharacters(),
          page: const CharactersScr(),
          bloc: BlocProvider(create: (_) => get<StarwarsCubit>())),
      PageEntity(
          path: AppRoutes.toCharacterDetails(characterEntityVal: AppRoutes.characterEntity),
          page: CharacterDetails(
            characterEntity: AppRoutes.characterEntity,
          ),
          bloc: BlocProvider(create: (_) => get<StarwarsCubit>())),
      PageEntity(
          path: AppRoutes.toFilms(), page: const FilmsScr(), bloc: BlocProvider(create: (_) => get<StarwarsCubit>())),
      PageEntity(
          path: AppRoutes.toFilmDetail(filmEntityval: AppRoutes.filmEntity),
          page: FilmDetailPage(
            filmEntity: AppRoutes.filmEntity,
          ),
          bloc: BlocProvider(create: (_) => get<StarwarsCubit>())),
      PageEntity(
          path: AppRoutes.toPlanets(),
          page: const PlanetScr(),
          bloc: BlocProvider(create: (_) => get<StarwarsCubit>())),
      PageEntity(
          path: AppRoutes.toPlanetsDetail(planetEntityVal: AppRoutes.planetEntity),
          page: PlanetDetailPage(
            planetEntity: AppRoutes.planetEntity,
          ),
          bloc: BlocProvider(create: (_) => get<StarwarsCubit>())),
      PageEntity(
          path: AppRoutes.toStarships(),
          page: const StarshipsScr(),
          bloc: BlocProvider(create: (_) => get<StarwarsCubit>())),
      PageEntity(
          path: AppRoutes.toStarshipsDetail(starshipEntityVal: AppRoutes.starshipEntity),
          page: StarshipDetailPage(
            starshipEntity: AppRoutes.starshipEntity,
          ),
          bloc: BlocProvider(create: (_) => get<StarwarsCubit>())),
    ];
  }

  static List<dynamic> blocer(BuildContext context) {
    List<dynamic> blocList = [];

    for (var element in routes()) {
      blocList.add(element.bloc);
    }
    return blocList;
  }

  static Route? generateRouteSettings(RouteSettings routeSettings) {
    var result = routes().where((element) => element.path == routeSettings.name);
    if (result.isNotEmpty) {
      // if (routeSettings.name == AppRoutes.signUpScreen) {
      //   return MaterialPageRoute(builder: (_) => page, settings: routeSettings);
      // }
      return MaterialPageRoute(builder: (_) => result.first.page, settings: routeSettings);
    }
    return null;
  }
}
