import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:pokemon_teste/layers/data/datasources/remote/search_pokemon_datasource/search_pokemon_datasource.dart';
import 'package:pokemon_teste/layers/data/dtos/pokemon_dto.dart';
import 'package:pokemon_teste/layers/data/http/client_http_service.dart';
import 'package:pokemon_teste/layers/domain/entities/pokemon_entities.dart';

class SearchPokemonDatasourceImp implements SearchPokemonDatasource {
  final ClientHttpService _clientHttpService;

  SearchPokemonDatasourceImp(this._clientHttpService);

  // O text pode ser o ID ou o nome do Pokemon
  @override
  Future<Either<Exception, PokemonEntity>> call({required String text}) async {
    final response = await _clientHttpService.get(
      url: "https://pokeapi.co/api/v2/pokemon/$text/"
    );

    if(response.statusCode == 200) {

      return Right(PokemonDto.fromMap(json.decode(response.body)));

    } else if(response.statusCode == 404) {
      return Left(Exception("Pokémon não foi encontrado"));

    } else if(response.statusCode == 511) {
      return Left(Exception("Sem internet!"));

    } else {
      return Left(Exception("Ocorreu algum erro"));
    }
  }
}