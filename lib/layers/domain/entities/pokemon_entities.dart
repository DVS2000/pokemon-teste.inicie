import 'package:pokemon_teste/layers/domain/entities/stat_entity.dart';

class PokemonEntity {
  final int id;
  final String name;
  final double height;
  final String weight;
  final int type;
  final List<StatEntity> stats;

  PokemonEntity({
    required this.id, 
    required this.name, 
    required this.height, 
    required this.weight, 
    required this.type,
    required this.stats
  });

}