import 'dart:async';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:starwars/core/errors/exceptions.dart';
import 'package:starwars/core/services/dio_interceptors.dart';
import 'package:starwars/core/utils/constants.dart';
import 'package:starwars/core/utils/typdef.dart';
import 'package:starwars/core/widgets/error_snackar.dart';
import 'package:starwars/src/data/models/character_model.dart';
import 'package:starwars/src/data/models/films_model.dart';
import 'package:starwars/src/data/models/planets_model.dart';
import 'package:starwars/src/data/models/starships_model.dart';
import 'package:starwars/src/domain/usecases/get_characters.dart';
import 'package:starwars/src/domain/usecases/get_planets.dart';
import 'package:starwars/src/domain/usecases/get_starhips.dart';

class StarwarsClient {
  Dio dio;
  StarwarsClient.internal({required this.dio}) {
    BaseOptions options = BaseOptions(
      baseUrl: kBaseUrl,
      connectTimeout: const Duration(hours: 1),
      receiveTimeout: const Duration(seconds: 30),
      headers: {"Accept": "application/json"},
      contentType: 'application/json',
      responseType: ResponseType.json,
    );

    dio = Dio(options);

    dio.interceptors.add(DioInterceptor());
  }
  Future<String> fetchImageUrl(String query) async {
    final apiKey = 'AIzaSyDsYvCzJyznGVCOhKfz1bE8bXy3Y5iNil0';
    final searchEngineId = 'e4d6f87981895421f';
    final url = 'https://www.googleapis.com/customsearch/v1?q=$query&searchType=image&key=$apiKey&cx=$searchEngineId';

    try {
      final response = await dio.get(url);
      if (response.statusCode == 200) {
        final data = response.data;
        final imageUrl = data['items'][0]['link'];

        return imageUrl;
      } else {
        return "https://via.placeholder.com/150";
      }
    } catch (e) {
      return "https://via.placeholder.com/150";
    }
  }

  Future<List> picturedData(List data, String propertyTitle) async {
    List newData = [];
    newData.addAll(data);
    await Future.forEach(newData, (element) async => element["image"] = await fetchImageUrl(element[propertyTitle]))
        .then((value) => data[0]["image"] == "https://via.placeholder.com/150"
            ? errorSnackBar("Query Limit Exceeded ",
                "Queries per day' of service 'customsearch.googleapis.com' for consumer project_number:998682883638")
            : null);

    return newData;
  }

  Future<List<CharacterModel>> getCharacters(GetCharacterParams getCharacterParams) async {
    try {
      List queryData = [];
      final completer = Completer<List<CharacterModel>>();

      // Nested requests approach
      if (getCharacterParams.queryList != null && getCharacterParams.queryList!.isNotEmpty) {
        Future.forEach(
                getCharacterParams.queryList!,
                (element) async => await dio.get(element.split("api/").last).then((value) {
                      if (value.statusCode != 200 && value.statusCode != 201) {
                        throw APIException(
                            message: value.statusMessage.toString(), statusCode: value.statusCode as int);
                      } else {
                        queryData.add(value.data);
                      }
                    }))
            // .then((value) => picturedData(queryData, "name"))
            .then((value) => completer.complete(queryData.map((e) => CharacterModel.fromJson(e)).toList()));

        return completer.future;
      } else {
        final response = await dio.get("people/?page=${getCharacterParams.index}");
        if (response.statusCode != 200 && response.statusCode != 201) {
          throw APIException(message: response.statusMessage.toString(), statusCode: response.statusCode as int);
        } else {
          List data = response.data["results"];
          await picturedData(data, "name")
              .then((value) => completer.complete(value.map((e) => CharacterModel.fromJson(e)).toList()));
          return completer.future;
        }
      }
    } on APIException {
      rethrow;
    } catch (e) {
      throw APIException(message: e.toString(), statusCode: 505);
    }
  }

  Future<List<FilmModel>> getFilms(List<String> queryList) async {
    try {
      List queryData = [];
      final completer = Completer<List<FilmModel>>();

      // Nested requests approach
      if (queryList.isNotEmpty) {
        Future.forEach(
            queryList,
            (element) async => await dio.get(element.split("api/").last).then((value) {
                  if (value.statusCode != 200 && value.statusCode != 201) {
                    throw APIException(message: value.statusMessage.toString(), statusCode: value.statusCode as int);
                  } else {
                    queryData.add(value.data);
                  }
                })).then((value) => picturedData(queryData, "title")).then(
            (value) => completer.complete(value.map((e) => FilmModel.fromJson(e)).toList()));

        print('debugPrint: $queryData');

        return completer.future;
      } else {
        final response = await dio.get("films");
        if (response.statusCode != 200 && response.statusCode != 201) {
          throw APIException(message: response.statusMessage.toString(), statusCode: response.statusCode as int);
        } else {
          List data = response.data["results"];
          await picturedData(data, "title")
              .then((value) => completer.complete(data.map((e) => FilmModel.fromJson(e)).toList()));
          return completer.future;
        }
      }
    } on APIException {
      rethrow;
    } catch (e) {
      throw APIException(message: e.toString(), statusCode: 505);
    }
  }

  Future<List<PlanetModel>> getPlanets(GetPlanetsParams getPlanetsParams) async {
    try {
      List queryData = [];
      final completer = Completer<List<PlanetModel>>();

      // Nested requests approach
      if (getPlanetsParams.queryList != null && getPlanetsParams.queryList!.isNotEmpty) {
        Future.forEach(
            getPlanetsParams.queryList!,
            (element) async => await dio.get(element.split("api/").last).then((value) {
                  if (value.statusCode != 200 && value.statusCode != 201) {
                    throw APIException(message: value.statusMessage.toString(), statusCode: value.statusCode as int);
                  } else {
                    queryData.add(value.data);
                  }
                })).then((value) => picturedData(queryData, "name")).then(
            (value) => completer.complete(queryData.map((e) => PlanetModel.fromJson(e)).toList()));

        return completer.future;
      } else {
        final response = await dio.get("planets/?page=${getPlanetsParams.index}");
        if (response.statusCode != 200 && response.statusCode != 201) {
          throw APIException(message: response.statusMessage.toString(), statusCode: response.statusCode as int);
        } else {
          List data = response.data["results"];
          await picturedData(data, "name")
              .then((value) => completer.complete(value.map((e) => PlanetModel.fromJson(e)).toList()));
          return completer.future;
        }
      }
    } on APIException {
      rethrow;
    } catch (e) {
      throw APIException(message: e.toString(), statusCode: 505);
    }
  }

  Future<List<StarshipModel>> getStarships(GetStarshipsParams getStarshipsParams) async {
    try {
      List queryData = [];
      final completer = Completer<List<StarshipModel>>();

      // Nested requests approach
      if (getStarshipsParams.queryList != null && getStarshipsParams.queryList!.isNotEmpty) {
        Future.forEach(
            getStarshipsParams.queryList!,
            (element) async => await dio.get(element.split("api/").last).then((value) {
                  if (value.statusCode != 200 && value.statusCode != 201) {
                    throw APIException(message: value.statusMessage.toString(), statusCode: value.statusCode as int);
                  } else {
                    queryData.add(value.data);
                  }
                })).then((value) => picturedData(queryData, "name")).then(
            (value) => completer.complete(queryData.map((e) => StarshipModel.fromJson(e)).toList()));

        return completer.future;
      } else {
        final response = await dio.get("starships/?page=${getStarshipsParams.index}");
        if (response.statusCode != 200 && response.statusCode != 201) {
          throw APIException(message: response.statusMessage.toString(), statusCode: response.statusCode as int);
        } else {
          List data = response.data["results"];
          await picturedData(data, "name")
              .then((value) => completer.complete(value.map((e) => StarshipModel.fromJson(e)).toList()));
          return completer.future;
        }
      }
    } on APIException {
      rethrow;
    } catch (e) {
      throw APIException(message: e.toString(), statusCode: 505);
    }
  }
}
