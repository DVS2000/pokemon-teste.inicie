import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:pokemon_teste/layers/data/dtos/pokemon_dto.dart';
import 'package:pokemon_teste/layers/data/http/client_http_service.dart';
import 'package:pokemon_teste/layers/domain/entities/pokemon_entities.dart';

import 'get_pokem_datasource_remote.dart';

class GetPokemonDatasourceRemoteImp implements GetPokemonDatasourceRemote {
  final ClientHttpService _clientHttpService;

  GetPokemonDatasourceRemoteImp(this._clientHttpService);
  @override
  Future<Either<Exception, PokemonEntity>> call({int offset = 0}) async {
    
    final response = await _clientHttpService.get(route: "pokemon?offset=$offset&limit=10");

    if(response.statusCode == 200) {
      return Right(PokemonDto.fromMap(json.decode(response.body)));

    } else if(response.statusCode == 400) {
      return Left(Exception("Pokémon não foi encontrado"));

    } else if(response.statusCode == 511) {
      return Left(Exception("Sem internet!"));
      
    } else {
      return Left(Exception("Ocorreu algum erro"));
    }

  }
  
}