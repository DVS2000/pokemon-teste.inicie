import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokemon_teste/layers/domain/entities/pokemon_entities.dart';
import 'package:pokemon_teste/layers/presenters/ui/utils/const_utils.dart';

import '../../details_pokemon_page/details_pokemon_page.dart';

class PokemonCardComponent extends StatelessWidget {
  final PokemonEntity pokemon;
  const PokemonCardComponent({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(DetailsPokemonPage(pokemon: pokemon,)),
      child: Container(
        width: 160,
        height: 110,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.15),
              offset: Offset(0.0, 4.0),
              blurRadius: 10
            )
          ]
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Text(
                  pokemon.name.substring(0,1).toUpperCase() + pokemon.name.substring(1,pokemon.name.length),
                  style: const TextStyle(
                    color: primaryColor,
                    fontWeight: FontWeight.w700,
                    fontFamily: fontNunito,
                    fontSize: 15
                  ),
                ),
                Container(
                  width: 60,
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  decoration: BoxDecoration(
                    color: const Color(0xffF1AFB2),
                    borderRadius: BorderRadius.circular(5)
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    pokemon.types.first,
                    style: const TextStyle(
                      fontFamily: fontNunito,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.white
                    ),
                  ),
                ),
                Text(
                  "#${pokemon.id}",
                  style: const TextStyle(
                    fontFamily: fontNunito,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: primaryColor
                  ),
                ),
              ],
            ),
            Stack(
              children: [
                Image.asset(
                  "assets/imgs/Vector.png",
                  width: 70,
                  fit: BoxFit.cover,
                ),
                Image.network(
                  pokemon.image.isEmpty ? "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/25.png" : pokemon.image,
                  width: 70,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
