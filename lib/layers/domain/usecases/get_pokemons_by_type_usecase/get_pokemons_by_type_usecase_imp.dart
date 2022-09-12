import 'package:dartz/dartz.dart';
import 'package:pokemon_teste/layers/domain/entities/pokemon_entities.dart';
import 'package:pokemon_teste/layers/domain/repositories/get_pokemons_by_type_repository.dart';
import 'package:pokemon_teste/layers/domain/usecases/get_pokemons_by_type_usecase/get_pokemons_by_type_usecase.dart';

class GetPokemonByTypeUsecaseImp implements GetPokemonByTypeUsecase {
  final GetPokemonsByTypeRepository _getPokemonsByTypeRepository;

  GetPokemonByTypeUsecaseImp(this._getPokemonsByTypeRepository);

  @override
  Future<Either<Exception, List<PokemonEntity>>> call({required String type}) => _getPokemonsByTypeRepository(type: type);
}