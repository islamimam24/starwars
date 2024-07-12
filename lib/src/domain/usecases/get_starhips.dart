import 'package:starwars/core/usecase/usecase.dart';
import 'package:starwars/core/utils/typdef.dart';
import 'package:starwars/src/domain/entities/starships_entity.dart';
import 'package:starwars/src/domain/repository/starwar_repo.dart';

class GetStarships extends UsecaseWithParams<List<StarshipEntity>, GetStarshipsParams> {
  StarwarsRepo _starwarsRepo;
  GetStarships(this._starwarsRepo);

  @override
  ResultFuture<List<StarshipEntity>> call(GetStarshipsParams params) => _starwarsRepo.getStarships(params);
}

class GetStarshipsParams {
  final int? index;
  final List<String>? queryList;
  const GetStarshipsParams({
    this.index = 0,
    this.queryList = const [],
  });
}
