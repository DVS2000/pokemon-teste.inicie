import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:pokemon_teste/layers/data/datasources/remote/get_description_pokemon_datasource/get_description_pokemon_datasource.dart';
import 'package:pokemon_teste/layers/data/http/client_http_service.dart';

class GetDescriptionPokemonDatasourceImp implements GetDescriptionPokemonDatasource {
  final ClientHttpService _clientHttpService;

  GetDescriptionPokemonDatasourceImp(this._clientHttpService);
  
  @override
  Future<Either<Exception, String>> call({required int id}) async{
    final response = await _clientHttpService.get(
      url: "https://pokeapi.co/api/v2/pokemon-species/$id/"
    );


    if(response.statusCode == 200) {

      final description = json.decode(response.body)["flavor_text_entries"][0]["flavor_text"];

      return Right(description);

    } else if(response.statusCode == 404) {
      return Left(Exception("Pokémon não foi encontrado"));

    } else if(response.statusCode == 511) {
      return Left(Exception("Sem internet!"));

    } else {
      return Left(Exception("Ocorreu algum erro"));
    }
    
  }
  
}