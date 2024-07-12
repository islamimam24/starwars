import 'package:starwars/core/usecase/usecase.dart';
import 'package:starwars/core/utils/typdef.dart';
import 'package:starwars/src/domain/entities/planets_entity.dart';
import 'package:starwars/src/domain/repository/starwar_repo.dart';

class GetPlanets extends UsecaseWithParams<List<PlanetEntity>, GetPlanetsParams> {
  StarwarsRepo _starwarsRepo;
  GetPlanets(this._starwarsRepo);

  @override
  ResultFuture<List<PlanetEntity>> call(GetPlanetsParams params) => _starwarsRepo.getPlanets(params);
}

class GetPlanetsParams {
  final int? index;
  final List<String>? queryList;
  const GetPlanetsParams({
    this.index = 0,
    this.queryList = const [],
  });
}
