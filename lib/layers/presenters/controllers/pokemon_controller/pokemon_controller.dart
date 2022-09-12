import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';
import 'package:pokemon_teste/layers/domain/entities/pokemon_entities.dart';
import 'package:pokemon_teste/layers/domain/usecases/get_description_pokemon/get_description_pokemon_usecase.dart';
import 'package:pokemon_teste/layers/domain/usecases/get_pokemons_by_type_usecase/get_pokemons_by_type_usecase.dart';
import 'package:pokemon_teste/layers/domain/usecases/get_pokemons_usecase/get_pokemons_usecase.dart';
import 'package:pokemon_teste/layers/domain/usecases/search_pokemon_usecase/search_pokemon_usecase.dart';

part 'pokemon_controller.g.dart';

class PokemonController = _PokemonControllerBase with _$PokemonController;

abstract class _PokemonControllerBase with Store {
  final GetPokemonUsecase _getPokemonUsecase;
  final GetDescriptionPokemonUsecase _getDescriptionPokemonUsecase;
  final SearchPokemonUsecase _searchPokemonUsecase;
  final GetPokemonByTypeUsecase _getPokemonByTypeUsecase;

  _PokemonControllerBase(
    this._getPokemonUsecase, 
    this._getDescriptionPokemonUsecase,
    this._searchPokemonUsecase,
    this._getPokemonByTypeUsecase
  );

  @observable
  bool isLoading = false;

  @observable
  List<PokemonEntity> pokemons = [];

  @observable
  String errorText = "";

  @observable
  String descriptionPokemon = "";

  int offset = 0;

  Future<void> getPokemons() async {

    isLoading = true;

    final result = await _getPokemonUsecase(offset: offset);

    result.fold(
      // Caso ouver um erro na resposta do useCase
      (error) => errorText = error.toString(),
      // Recebo todos os pokemons e em seguida aumento 10 no offset para trazer os proximos 10 pokemnos... 
      (sucess) {
        pokemons.addAll(sucess);
        offset += 10;
      }
    );

    isLoading = false;
  }

  Future<void> getPokemonsByType({required String type}) async {

    pokemons = [];
    isLoading = true;

    final result = await _getPokemonByTypeUsecase(type: type);

    result.fold(
      (error) => errorText = error.toString(),
      (sucess) {
        pokemons = sucess;
        offset += 10;
      }
    );

    isLoading = false;
  }

  Future<void> getDescriptionPokemonById({ required int id }) async {

    isLoading = true;

    final result = await _getDescriptionPokemonUsecase(id: id);

    result.fold(
      (error) => errorText = error.toString(),
      (sucess) {
        descriptionPokemon = sucess;
      }
    );

    isLoading = false;
  }

  Future<Either<String, PokemonEntity>> search({ required String text }) async {

    isLoading = true;

    final result = await _searchPokemonUsecase(text: text);

    isLoading = false;

    return result.fold(
      (error) => Left(error.toString()),
      (sucess) => Right(sucess)
    );
  }
}