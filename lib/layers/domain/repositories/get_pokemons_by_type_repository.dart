import 'package:dartz/dartz.dart';
import 'package:pokemon_teste/layers/domain/entities/pokemon_entities.dart';

abstract class GetPokemonsByTypeRepository {
  Future<Either<Exception, List<PokemonEntity>>> call({required String type});
}