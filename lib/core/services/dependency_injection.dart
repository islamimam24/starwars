import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:starwars/src/data/client/starwars_client.dart';
import 'package:starwars/src/data/repository/starwar_repo_imp.dart';
import 'package:starwars/src/data/repository/starwars_repo_ds.dart';
import 'package:starwars/src/data/source/starwars_repo_ds_imp.dart';
import 'package:starwars/src/domain/repository/starwar_repo.dart';
import 'package:starwars/src/domain/usecases/get_characters.dart';
import 'package:starwars/src/domain/usecases/get_films.dart';
import 'package:starwars/src/domain/usecases/get_planets.dart';
import 'package:starwars/src/domain/usecases/get_starhips.dart';
import 'package:starwars/src/presentation/cubit/starwars_cubit.dart';

final get = GetIt.instance;

Future<void> init() async {
  get
    ..registerFactory(
      () => StarwarsCubit(
        getCharacters: get(),
        getFilms: get(),
        getPlanets: get(),
        getStarships: get(),
      ),
    )

    // // Repositories
    ..registerLazySingleton<GetCharacters>(() => GetCharacters(get()))
    ..registerLazySingleton<GetFilms>(() => GetFilms(get()))
    ..registerLazySingleton<GetPlanets>(() => GetPlanets(get()))
    ..registerLazySingleton<GetStarships>(() => GetStarships(get()))

    // // Data Sources
    ..registerLazySingleton<StarwarsRepo>(() => StarwarsRepoImp(get()))
    ..registerLazySingleton<StarwarsRepoDS>(() => StarwarsRepoDsImpl(get()))

    // // External Dependencies
    ..registerLazySingleton(() => StarwarsClient.internal(dio: get()))
    ..registerLazySingleton(() => Dio());
}
