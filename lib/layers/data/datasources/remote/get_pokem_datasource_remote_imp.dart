import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:pokemon_teste/layers/data/dtos/pokemon_dto.dart';
import 'package:pokemon_teste/layers/data/dtos/pokemon_response.dto.dart';
import 'package:pokemon_teste/layers/data/http/client_http_service.dart';
import 'package:pokemon_teste/layers/domain/entities/pokemon_entities.dart';

import 'get_pokem_datasource_remote.dart';

class GetPokemonDatasourceRemoteImp implements GetPokemonDatasourceRemote {
  final ClientHttpService _clientHttpService;

  GetPokemonDatasourceRemoteImp(this._clientHttpService);
  @override
  Future<Either<Exception, List<PokemonEntity>>> call({int offset = 0}) async {
    
    final response = await _clientHttpService.get(
      url: "https://pokeapi.co/api/v2/pokemon?offset=$offset&limit=10"
    );

    late List<PokemonResponseDto> pokemonsResponses;
    if(response.statusCode == 200) {

      pokemonsResponses = List<PokemonResponseDto>.from(
        json.decode(response.body)["results"].map(
          (x) => PokemonResponseDto.fromMap(x)
        )
      );

      List<PokemonEntity> pokemons = await Future.wait<PokemonEntity>(
        pokemonsResponses.map((e) async {
          final res = await _clientHttpService.get(url: e.url);

          return PokemonDto.fromMap(json.decode(res.body));
        })
      );

      return Right(pokemons);

    } else if(response.statusCode == 404) {
      return Left(Exception("Pokémon não foi encontrado"));

    } else if(response.statusCode == 511) {
      return Left(Exception("Sem internet!"));

    } else {
      return Left(Exception("Ocorreu algum erro"));
    }

  }
  
}