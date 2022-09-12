import 'package:pokemon_teste/layers/data/datasources/remote/search_pokemon_datasource/search_pokemon_datasource.dart';
import 'package:pokemon_teste/layers/domain/entities/pokemon_entities.dart';
import 'package:dartz/dartz.dart';
import 'package:pokemon_teste/layers/domain/repositories/search_pokemon_repository.dart';

class SearchPokemonRepositoryImp implements SearchPokemonRepository {
  final SearchPokemonDatasource _searchPokemonDatasource;

  SearchPokemonRepositoryImp(this._searchPokemonDatasource);

  @override
  Future<Either<Exception, PokemonEntity>> call({required String text}) => _searchPokemonDatasource(text: text);
  
}