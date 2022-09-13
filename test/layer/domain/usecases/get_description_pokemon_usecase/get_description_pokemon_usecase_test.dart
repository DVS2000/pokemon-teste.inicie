import 'package:flutter_test/flutter_test.dart';
import 'package:pokemon_teste/layers/data/datasources/remote/get_description_pokemon_datasource/get_description_pokemon_datasource_imp.dart';
import 'package:pokemon_teste/layers/data/http/client_http_service_imp.dart';
import 'package:pokemon_teste/layers/data/repositories/get_description_pokemon_repository_imp.dart';
import 'package:pokemon_teste/layers/domain/usecases/get_description_pokemon/get_description_pokemon_usecase.dart';
import 'package:pokemon_teste/layers/domain/usecases/get_description_pokemon/get_description_pokemon_usecase_imp.dart';

void main() {

  test("Espero que retorna descrição do pokemon de acordo com o seu ID", () async {
    GetDescriptionPokemonUsecase useCase = GetDescriptionPokemonUsecaseImp(
      GetDescriptionPokemonRepositoryImp(
        GetDescriptionPokemonDatasourceImp(
          ClientHttpServiceImp()
        )
      )
    );

    var result = await useCase(id: 25);
    late String description;

    result.fold((l) => null, (r) => description = r);

    expect(description, isNotEmpty); 
  });

  test("Espero que retorna uma Exception quando o seu ID for inexistente", () async {
    GetDescriptionPokemonUsecase useCase = GetDescriptionPokemonUsecaseImp(
      GetDescriptionPokemonRepositoryImp(
        GetDescriptionPokemonDatasourceImp(
          ClientHttpServiceImp()
        )
      )
    );

    var result = await useCase(id: 23275);
    late Exception exception;

    result.fold((l) => exception = l, (r) => null);

    expect(exception, isException); 
  });
}