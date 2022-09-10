import 'package:dartz/dartz.dart';
import 'package:pokemon_teste/layers/domain/entities/pokemon_entities.dart';

abstract class GetPokemonsRepository {
  Future<Either<Exception, List<PokemonEntity>>> call({int offset = 0});
}