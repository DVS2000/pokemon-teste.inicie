import 'package:dartz/dartz.dart';
import 'package:pokemon_teste/layers/domain/entities/pokemon_entities.dart';

abstract class GetPokemonDatasourceRemote {
  Future<Either<Exception, PokemonEntity>> call({int offset = 0});
}