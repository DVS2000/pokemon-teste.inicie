import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
            children: [
              const Text(
                "Pokedéx",
                style: TextStyle(
                  fontFamily: fontNunito,
                  color: primaryColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w700
                ),
              ),
              const Text(
                "Todas as espécies de pokemons\nestão esperando por você!",
                style: TextStyle(
                  fontFamily: fontNunito, 
                  fontSize: 14, 
                  color: primaryColor
                ),
              ),

              // Input Serach
              SizedBox(
                height: 31,
                width: 163,
                child: Row(
                  children: [
                    Container(
                      width: 123,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          width: 1, 
                          color: const Color(0xffF4F4F4)
                        ),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(5),
                          bottomLeft: Radius.circular(6)
                        ),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.15),
                            offset: Offset(0.0, 4.0),
                            blurRadius: 15
                          )
                        ]
                      ),
                      child: const TextField(
                        style: TextStyle(
                          color: primaryColor, 
                          fontFamily: fontNunito
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(bottom: 17, left: 5)
                        ),
                      ),
                    ),

                    // Button Search
                    Container(
                      width: 40,
                      decoration: const BoxDecoration(
                        color: secundaryColor,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(5),
                          bottomRight: Radius.circular(6)
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: secundaryColor,
                            offset: Offset(0.0, 4.0),
                            blurRadius: 15
                          )
                        ]
                      ),
                      alignment: Alignment.center,
                      child: const Icon(
                        CupertinoIcons.search,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              )
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
