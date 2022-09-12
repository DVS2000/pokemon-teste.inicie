import 'package:pokemon_teste/layers/data/datasources/remote/get_pokem_by_type_datasource_remote/get_pokems_by_type_datasource_remote.dart';
import 'package:pokemon_teste/layers/domain/entities/pokemon_entities.dart';
import 'package:dartz/dartz.dart';
import 'package:pokemon_teste/layers/domain/repositories/get_pokemons_by_type_repository.dart';

class GetPokemonsByTypesRepositoryImp implements GetPokemonsByTypeRepository {
  final GetPokemonsByTypeDatasourceRemote _getPokemonsByTypeDatasourceRemote;

  GetPokemonsByTypesRepositoryImp(this._getPokemonsByTypeDatasourceRemote);
  @override
  Future<Either<Exception, List<PokemonEntity>>> call({required String type}) {
    return _getPokemonsByTypeDatasourceRemote(type: type);
  }
  
}