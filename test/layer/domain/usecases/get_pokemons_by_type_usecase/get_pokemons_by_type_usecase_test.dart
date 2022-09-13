import 'package:flutter_test/flutter_test.dart';
import 'package:pokemon_teste/layers/data/datasources/remote/get_pokem_by_type_datasource_remote/get_pokem_by_type_datasource_remote_imp.dart';
import 'package:pokemon_teste/layers/data/http/client_http_service_imp.dart';
import 'package:pokemon_teste/layers/data/repositories/get_pokemon_by_type_repository_imp.dart';
import 'package:pokemon_teste/layers/domain/entities/pokemon_entities.dart';
import 'package:pokemon_teste/layers/domain/usecases/get_pokemons_by_type_usecase/get_pokemons_by_type_usecase.dart';
import 'package:pokemon_teste/layers/domain/usecases/get_pokemons_by_type_usecase/get_pokemons_by_type_usecase_imp.dart';

void main() {
  test("Espero que retorna os pokemons pelo seu tipo/categoria", () async {
    GetPokemonByTypeUsecase useCase = GetPokemonByTypeUsecaseImp(
      GetPokemonsByTypesRepositoryImp(
        GetPokemonsByTypeDatasourceRemoteImp(
          ClientHttpServiceImp()
        )
      )
    );

    var resullt = await useCase(type: "fire");
    late List<PokemonEntity> pokemons;

    resullt.fold((l) => null, (r) => pokemons = r);

    expect(pokemons, isNotEmpty);
  });

  test("Espero que retorna uma Exception quando a tipo/categoria seja inválido", () async {
    GetPokemonByTypeUsecase useCase = GetPokemonByTypeUsecaseImp(
      GetPokemonsByTypesRepositoryImp(
        GetPokemonsByTypeDatasourceRemoteImp(
          ClientHttpServiceImp()
        )
      )
    );

    var resullt = await useCase(type: "xxxx");
    late Exception erro;

    resullt.fold((l) => erro = l, (r) => null);

    expect(erro, isException);
  });
}