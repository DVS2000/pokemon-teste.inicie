import 'package:flutter_test/flutter_test.dart';
import 'package:pokemon_teste/layers/data/datasources/remote/get_pokem_datasource_remote/get_pokem_datasource_remote_imp.dart';
import 'package:pokemon_teste/layers/data/http/client_http_service_imp.dart';
import 'package:pokemon_teste/layers/data/repositories/get_pokemon_repository_imp.dart';
import 'package:pokemon_teste/layers/domain/entities/pokemon_entities.dart';
import 'package:pokemon_teste/layers/domain/usecases/get_pokemons_usecase/get_pokemons_usecase.dart';
import 'package:pokemon_teste/layers/domain/usecases/get_pokemons_usecase/get_pokemons_usecase_imp.dart';

void main() {

  test("Espero que retorna pokemons", () async {
    GetPokemonUsecase useCase = GetPokemonUsecaseImp(
      GetPokemonRepositoryImp(
        GetPokemonDatasourceRemoteImp(
          ClientHttpServiceImp()
        )
      )
    );

    late List<PokemonEntity> pokemons;

    var result = await useCase();
    result.fold((l) => null, (r) => pokemons = r);

    expect(pokemons, isNotEmpty);
  });

  test("Espero que retorna 10 pokemons", () async {
    GetPokemonUsecase useCase = GetPokemonUsecaseImp(
      GetPokemonRepositoryImp(
        GetPokemonDatasourceRemoteImp(
          ClientHttpServiceImp()
        )
      )
    );

    late List<PokemonEntity> pokemons;

    var result = await useCase();
    result.fold((l) => null, (r) => pokemons = r);

    expect(pokemons.length, 10);
  });
}