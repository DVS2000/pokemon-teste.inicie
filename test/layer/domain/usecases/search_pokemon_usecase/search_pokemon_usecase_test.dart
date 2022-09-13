import 'package:flutter_test/flutter_test.dart';
import 'package:pokemon_teste/layers/data/datasources/remote/search_pokemon_datasource/search_pokemon_datasource_imp.dart';
import 'package:pokemon_teste/layers/data/http/client_http_service_imp.dart';
import 'package:pokemon_teste/layers/data/repositories/search_pokemon_repository_imp.dart';
import 'package:pokemon_teste/layers/domain/entities/pokemon_entities.dart';
import 'package:pokemon_teste/layers/domain/usecases/search_pokemon_usecase/search_pokemon_usecase.dart';
import 'package:pokemon_teste/layers/domain/usecases/search_pokemon_usecase/search_pokemon_usecase_imp.dart';

void main() {

  test("Espero que retorna um Pokemon de acordo o seu id", () async {

    SearchPokemonUsecase useCase = SearchPokemonUsecaseImp(
      SearchPokemonRepositoryImp(
        SearchPokemonDatasourceImp(
          ClientHttpServiceImp()
        )
      )
    );

    var result = await useCase(text: "25");
    late PokemonEntity pokemon;

    result.fold((l) => null, (r) => pokemon = r);

    expect(pokemon, isInstanceOf<PokemonEntity>());
  });

  test("Espero que retorna um Pokemon de acordo o seu nome", () async {

    SearchPokemonUsecase useCase = SearchPokemonUsecaseImp(
      SearchPokemonRepositoryImp(
        SearchPokemonDatasourceImp(
          ClientHttpServiceImp()
        )
      )
    );

    var result = await useCase(text: "pikachu");
    late PokemonEntity pokemon;

    result.fold((l) => null, (r) => pokemon = r);

    expect(pokemon, isInstanceOf<PokemonEntity>());
  });

  test("Espero que retorna uma Exception quando o id for inexistente", () async {

    SearchPokemonUsecase useCase = SearchPokemonUsecaseImp(
      SearchPokemonRepositoryImp(
        SearchPokemonDatasourceImp(
          ClientHttpServiceImp()
        )
      )
    );

    var result = await useCase(text: "9876543");
    late Exception exception;

    result.fold((l) => exception = l, (r) => null);

    expect(exception, isException);
  });

  test("Espero que retorna uma Exception quando o nome for inexistente", () async {

    SearchPokemonUsecase useCase = SearchPokemonUsecaseImp(
      SearchPokemonRepositoryImp(
        SearchPokemonDatasourceImp(
          ClientHttpServiceImp()
        )
      )
    );

    var result = await useCase(text: "pikach");
    late Exception exception;

    result.fold((l) => exception = l, (r) => null);

    expect(exception, isException);
  });
}