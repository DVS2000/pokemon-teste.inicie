import 'package:flutter/material.dart';
import 'package:pokemon_teste/src/utils/const_utils.dart';

class PokemonCardComponent extends StatelessWidget {
  const PokemonCardComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
              const Text(
                "Squirtle",
                style: TextStyle(
                  color: primaryColor,
                  fontWeight: FontWeight.w700,
                  fontFamily: fontNunito,
                  fontSize: 16
                ),
              ),
              Container(
                width: 67,
                margin: const EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                  color: const Color(0xffF1AFB2),
                  borderRadius: BorderRadius.circular(5)
                ),
                alignment: Alignment.center,
                child: const Text(
                  "Tipo",
                  style: TextStyle(
                    fontFamily: fontNunito,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.white
                  ),
                ),
              ),
              const Text(
                "#COD",
                style: TextStyle(
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
                width: 80,
                fit: BoxFit.cover,
              ),
              Image.asset(
                "assets/imgs/pokemon.png",
                width: 80,
              ),
            ],
          )
        ],
      ),
    );
  }
}
