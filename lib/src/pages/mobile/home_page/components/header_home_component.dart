import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_teste/src/components/input_search_component.dart';
import 'package:pokemon_teste/src/utils/const_utils.dart';

class HeaderHomeComponent extends StatelessWidget {
  const HeaderHomeComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 152,
      margin: const EdgeInsets.symmetric(horizontal: 15),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(241, 176, 179, 0.1),
        borderRadius: BorderRadius.circular(20)
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "Pokedéx",
                style: TextStyle(
                  fontFamily: fontNunito,
                  color: primaryColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w700
                ),
              ),
              Text(
                "Todas as espécies de pokemons\nestão esperando por você!",
                style: TextStyle(
                  fontFamily: fontNunito, 
                  fontSize: 14, 
                  color: primaryColor
                ),
              ),

              InputSearchComponent()
            ],
          ),
          Expanded(
            child: Image.asset("assets/imgs/Picatxu.png"),
          )
        ],
      ),
    );
  }
}
