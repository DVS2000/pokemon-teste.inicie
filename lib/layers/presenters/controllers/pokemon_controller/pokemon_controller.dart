import 'package:mobx/mobx.dart';
import 'package:pokemon_teste/layers/domain/entities/pokemon_entities.dart';
import 'package:pokemon_teste/layers/domain/usecases/get_pokemons_usecase/get_pokemons_usecase.dart';
import 'package:collection/collection.dart' as Colletions;

part 'pokemon_controller.g.dart';

class PokemonController = _PokemonControllerBase with _$PokemonController;

abstract class _PokemonControllerBase with Store {
  final GetPokemonUsecase _getPokemonUsecase;

  _PokemonControllerBase(this._getPokemonUsecase);

  @observable
  bool isLoading = false;

  @observable
  List<PokemonEntity> pokemons = [];

  @observable
  String errorText = "";

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
}