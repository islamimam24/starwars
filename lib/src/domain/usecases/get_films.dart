import 'package:starwars/core/usecase/usecase.dart';
import 'package:starwars/core/utils/typdef.dart';
import 'package:starwars/src/domain/entities/films_entity.dart';
import 'package:starwars/src/domain/repository/starwar_repo.dart';

class GetFilms extends UsecaseWithParams<List<FilmEntity>, List<String>> {
  StarwarsRepo _starwarsRepo;
  GetFilms(this._starwarsRepo);

  @override
  ResultFuture<List<FilmEntity>> call(List<String> params) => _starwarsRepo.getFilms(params);
}
