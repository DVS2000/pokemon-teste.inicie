import 'package:flutter_test/flutter_test.dart';
import 'package:pokemon_teste/layers/domain/entities/pokemon_entities.dart';
import 'package:pokemon_teste/layers/domain/entities/stat_entity.dart';

void main() {

  test("Espero que a entidade nao seja null", () {
   PokemonEntity pokemon = PokemonEntity(
      id: 1, 
      name: "Picachu", 
      height: 12, 
      weight: 60, 
      image: "https://", 
      types: ["Fire", "Normal"], 
      stats: [
        StatEntity(name: "Defesa", value: 14),
        StatEntity(name: "Vida", value: 50),
      ]
     );

     expect(pokemon, isNotNull);
  });

  test("Espero que nome do pokemon seja diferente de vazio", () {
   PokemonEntity pokemon = PokemonEntity(
      id: 1, 
      name: "Picachu", 
      height: 12, 
      weight: 60, 
      image: "https://", 
      types: ["Fire", "Normal"], 
      stats: [
        StatEntity(name: "Defesa", value: 14),
        StatEntity(name: "Vida", value: 50),
      ]
     );

     expect(pokemon.name.trim(), isNotEmpty);
  });

  test("Espero que o tipo nao seja vazio", () {
   PokemonEntity pokemon = PokemonEntity(
      id: 1, 
      name: "Picachu", 
      height: 12, 
      weight: 60, 
      image: "https://", 
      types: ["Fire", "Normal"], 
      stats: [
        StatEntity(name: "Defesa", value: 14),
        StatEntity(name: "Vida", value: 50),
      ]
     );

     expect(pokemon.types, isNotEmpty);
  });

  test("Espero que as habilidades nao sejam vazio", () {
   PokemonEntity pokemon = PokemonEntity(
      id: 1, 
      name: "Picachu", 
      height: 12, 
      weight: 60, 
      image: "https://", 
      types: ["Fire", "Normal"], 
      stats: [
        StatEntity(name: "Defesa", value: 14),
        StatEntity(name: "Vida", value: 50),
      ]
     );

     expect(pokemon.stats, isNotEmpty);
  });
}