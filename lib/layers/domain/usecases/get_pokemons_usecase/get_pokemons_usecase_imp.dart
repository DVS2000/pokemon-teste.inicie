import 'package:dartz/dartz.dart';
import 'package:pokemon_teste/layers/domain/entities/pokemon_entities.dart';
import 'package:pokemon_teste/layers/domain/repositories/get_pokemons_repository.dart';
import 'get_pokemons_usecase.dart';

class GetPokemonUsecaseImp implements GetPokemonUsecase {
  final GetPokemonsRepository _getPokemonsRepository;

  GetPokemonUsecaseImp(this._getPokemonsRepository);
  @override
  Future<Either<Exception, List<PokemonEntity>>> call({int offset = 0}) => _getPokemonsRepository(offset: offset); 
  
}