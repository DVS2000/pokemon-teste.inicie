import 'package:pokemon_teste/layers/data/dtos/stat_dto.dart';
import 'package:pokemon_teste/layers/domain/entities/pokemon_entities.dart';
import 'package:pokemon_teste/layers/domain/entities/stat_entity.dart';

class PokemonDto extends PokemonEntity {
  int key;
  String nome;
  int altura;
  int peso;
  String urlImg;
  List<String> tipos;
  List<StatEntity> habilidades;

  PokemonDto({
    required this.key, 
    required this.nome, 
    required this.altura, 
    required this.peso, 
    required this.urlImg,
    required this.tipos,
    required this.habilidades
  }) : super(
    id: key,
    name: nome,
    height: altura,
    weight: peso,
    image: urlImg,
    types: tipos,
    stats: habilidades
  );

  static PokemonDto fromMap(Map map) => PokemonDto(
    key: map["id"] ?? 0, 
    nome: map["name"] ?? "", 
    altura: map["height"] ?? 0, 
    peso: map["weight"] ?? 0, 
    urlImg: map["sprites"]["other"]["home"]["front_default"] ?? "",
    tipos: List<String>.from(map["types"].map((x) => x["type"]["name"].toString())) , 
    habilidades: List<StatDto>.from(map["stats"].map((x) => StatDto.fromMap(x)))
  );
}