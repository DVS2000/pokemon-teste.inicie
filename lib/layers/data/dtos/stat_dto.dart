import 'package:pokemon_teste/layers/domain/entities/stat_entity.dart';

class StatDto extends StatEntity {
  final String nome;
  final int valor;

  StatDto({required this.nome, required this.valor}): super(name: nome, value: valor);

  static StatDto fromMap(Map map) => StatDto(nome: map["stat"]["name"], valor: map["base_stat"]);
}