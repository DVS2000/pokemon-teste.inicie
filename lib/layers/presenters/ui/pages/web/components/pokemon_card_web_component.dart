import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokemon_teste/layers/domain/entities/pokemon_entities.dart';
import 'package:pokemon_teste/layers/presenters/ui/utils/const_utils.dart';

import '../details_pokemon_page_web/details_pokemon_page_web.dart';

class PokemonCardWebComponent extends StatelessWidget {
  final double? marginTop;
  final PokemonEntity pokemon;
  const PokemonCardWebComponent({Key? key, this.marginTop, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(DetailsPokemonPageWeb(pokemon: pokemon,)),
      child: Center(
        child: Container(
          width: 306,
          height:271,
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 25
          ),
          margin: EdgeInsets.only(
            top: marginTop ?? 15
          ),
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    pokemon.name.substring(0,1).toUpperCase() + pokemon.name.substring(1,pokemon.name.length),
                    style: const TextStyle(
                      color: primaryColor,
                      fontWeight: FontWeight.w700,
                      fontFamily: fontNunito,
                      fontSize: 28
                    ),
                  ),
                  
                  Text(
                    "#${pokemon.id}",
                    style: const TextStyle(
                      fontFamily: fontNunito,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: primaryColor
                    ),
                  ),
                ],
              ),

              const Spacer(),
              Image.network(
                pokemon.image,
                width: 122,
              ),
              const Spacer(),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Altura:",
                    style: TextStyle(
                      color: primaryColor,
                      fontWeight: FontWeight.w700,
                      fontFamily: fontNunito,
                      fontSize: 16
                    ),
                  ),
                  
                  Text(
                    "${pokemon.height} cm",
                    style: const TextStyle(
                      fontFamily: fontNunito,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: primaryColor
                    ),
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Peso:",
                    style: TextStyle(
                      color: primaryColor,
                      fontWeight: FontWeight.w700,
                      fontFamily: fontNunito,
                      fontSize: 16
                    ),
                  ),
                  
                  Text(
                    "${pokemon.weight}kg",
                    style: const TextStyle(
                      fontFamily: fontNunito,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: primaryColor
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
