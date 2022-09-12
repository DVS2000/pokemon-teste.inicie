import 'package:dartz/dartz.dart';
import 'package:pokemon_teste/layers/domain/entities/pokemon_entities.dart';
import 'package:pokemon_teste/layers/domain/repositories/search_pokemon_repository.dart';
import 'package:pokemon_teste/layers/domain/usecases/search_pokemon_usecase/search_pokemon_usecase.dart';

class SearchPokemonUsecaseImp implements SearchPokemonUsecase {
  final SearchPokemonRepository _searchPokemonRepository;
  
  SearchPokemonUsecaseImp(this._searchPokemonRepository);

  // O text pode ser o ID ou o nome do Pokemon
  @override
  Future<Either<Exception, PokemonEntity>> call({required String text}) => _searchPokemonRepository(text: text);
}