import 'package:pokemon_teste/layers/domain/entities/pokemon_response_entity.dart';

class PokemonResponseDto extends PokemonResponseEntity {
  final String nome;
  final String urlPokemon;

  PokemonResponseDto({ required this.nome, required this.urlPokemon }) : super(name: nome, url: urlPokemon);

  static PokemonResponseDto fromMap(Map map) => PokemonResponseDto(nome: map["name"], urlPokemon: map["url"]); 
}