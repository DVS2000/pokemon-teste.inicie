import 'package:pokemon_teste/layers/data/datasources/remote/get_pokem_datasource_remote_imp.dart';
import 'package:pokemon_teste/layers/domain/entities/pokemon_entities.dart';
import 'package:dartz/dartz.dart';
import 'package:pokemon_teste/layers/domain/repositories/get_pokemons_repository.dart';

class GetPokemonRepositoryImp implements GetPokemonsRepository {
  final GetPokemonDatasourceRemoteImp _getPokemonDatasourceRemoteImp;

  GetPokemonRepositoryImp(this._getPokemonDatasourceRemoteImp);
  @override
  Future<Either<Exception, PokemonEntity>> call({int offset = 0}) {
    return _getPokemonDatasourceRemoteImp(offset: offset);
  }
  
}