import 'package:dartz/dartz.dart';
import 'package:pokemon_teste/layers/domain/repositories/get_description_pokemon_repository.dart';
import 'package:pokemon_teste/layers/domain/usecases/get_description_pokemon/get_description_pokemon_usecase.dart';
 
class GetDescriptionPokemonUsecaseImp implements GetDescriptionPokemonUsecase {
  final GetDescriptionPokemonRepository _getDescriptionPokemonRepository;

  GetDescriptionPokemonUsecaseImp(this._getDescriptionPokemonRepository);

  @override
  Future<Either<Exception, String>> call({required int id}) => _getDescriptionPokemonRepository(id: id);
}