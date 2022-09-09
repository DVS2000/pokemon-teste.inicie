import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokemon_teste/src/pages/web/details_pokemon_page_web/details_pokemon_page_web.dart';
import 'package:pokemon_teste/src/utils/const_utils.dart';

class PokemonCardWebComponent extends StatelessWidget {
  final int index;
  final double? marginTop;
  const PokemonCardWebComponent({Key? key, required this.index, this.marginTop}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(DetailsPokemonPageWeb(heroTag: index.toString())),
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
                children: const [
                  Text(
                    "Squirtle",
                    style: TextStyle(
                      color: primaryColor,
                      fontWeight: FontWeight.w700,
                      fontFamily: fontNunito,
                      fontSize: 28
                    ),
                  ),
                  
                  Text(
                    "#COD",
                    style: TextStyle(
                      fontFamily: fontNunito,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: primaryColor
                    ),
                  ),
                ],
              ),

              const Spacer(),
              Image.asset(
                "assets/imgs/pokemon1.png",
                width: 122,
              ),
              const Spacer(),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Altura:",
                    style: TextStyle(
                      color: primaryColor,
                      fontWeight: FontWeight.w700,
                      fontFamily: fontNunito,
                      fontSize: 16
                    ),
                  ),
                  
                  Text(
                    "1.10cm",
                    style: TextStyle(
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
                children: const [
                  Text(
                    "Peso:",
                    style: TextStyle(
                      color: primaryColor,
                      fontWeight: FontWeight.w700,
                      fontFamily: fontNunito,
                      fontSize: 16
                    ),
                  ),
                  
                  Text(
                    "30kg",
                    style: TextStyle(
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
