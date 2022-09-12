import 'package:mobx/mobx.dart';
import 'package:pokemon_teste/layers/domain/entities/pokemon_entities.dart';
import 'package:pokemon_teste/layers/domain/usecases/get_description_pokemon/get_description_pokemon_usecase.dart';
import 'package:pokemon_teste/layers/domain/usecases/get_pokemons_usecase/get_pokemons_usecase.dart';

part 'pokemon_controller.g.dart';

class PokemonController = _PokemonControllerBase with _$PokemonController;

abstract class _PokemonControllerBase with Store {
  final GetPokemonUsecase _getPokemonUsecase;
  final GetDescriptionPokemonUsecase _getDescriptionPokemonUsecase;

  _PokemonControllerBase(
    this._getPokemonUsecase, 
    this._getDescriptionPokemonUsecase
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
}