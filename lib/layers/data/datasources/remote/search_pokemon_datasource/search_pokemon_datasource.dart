import 'package:dartz/dartz.dart';
import 'package:pokemon_teste/layers/domain/entities/pokemon_entities.dart';

abstract class SearchPokemonDatasource {
  // O text pode ser o ID ou o nome do Pokemon
  Future<Either<Exception, PokemonEntity>> call({required String text});
}