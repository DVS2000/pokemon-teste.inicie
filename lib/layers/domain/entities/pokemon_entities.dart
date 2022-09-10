import 'package:pokemon_teste/layers/domain/entities/stat_entity.dart';

class PokemonEntity {
  final int id;
  final String name;
  final int height;
  final int weight;
  final String image;
  final List<String> types;
  final List<StatEntity> stats;

  PokemonEntity({
    required this.id, 
    required this.name, 
    required this.height, 
    required this.weight, 
    required this.image,
    required this.types,
    required this.stats
  });

}