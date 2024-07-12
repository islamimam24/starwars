import 'package:starwars/core/usecase/usecase.dart';
import 'package:starwars/core/utils/typdef.dart';
import 'package:starwars/src/domain/entities/character_entity.dart';
import 'package:starwars/src/domain/repository/starwar_repo.dart';

class GetCharacters extends UsecaseWithParams<List<CharacterEntity>, GetCharacterParams> {
  StarwarsRepo _starwarsRepo;
  GetCharacters(this._starwarsRepo);

  @override
  ResultFuture<List<CharacterEntity>> call(GetCharacterParams params) => _starwarsRepo.getCharacters(params);
}

class GetCharacterParams {
  final int? index;
  final List<String>? queryList;
  const GetCharacterParams({
    this.index = 0,
    this.queryList = const [],
  });
}
