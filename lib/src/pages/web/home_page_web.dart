import 'package:flutter/material.dart';
import 'package:pokemon_teste/src/components/input_search_component.dart';
import 'package:pokemon_teste/src/pages/web/components/pokemon_card_web_component.dart';
import 'package:pokemon_teste/src/utils/const_utils.dart';

class HomePageWeb extends StatefulWidget {
  const HomePageWeb({ Key? key }) : super(key: key);

  @override
  State<HomePageWeb> createState() => _HomePageWebState();
}

class _HomePageWebState extends State<HomePageWeb> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                "assets/imgs/logo.png",
                height: 60,
              ),
            ),

            Image.asset(
              "assets/imgs/intro_web.png",
              //height: 60,
            ),


            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                   Text.rich(
                      TextSpan(
                        text: 'Explore o mundo\ndos ',
                        style: TextStyle(
                          fontFamily: "Nunito",
                          fontSize: 35,
                          fontWeight: FontWeight.w700,
                          color: Color(0xff2F3E77),
                          height: 1.1
                        ),
                        children: <InlineSpan>[
                          TextSpan(
                            text: 'Pokémons',
                            style: TextStyle(color: Color(0xffEA686D)),
                          )
                        ]
                      ),
                      //textAlign: TextAlign.center,
                    ),

                    SizedBox(height: 10,),

                    Text(
                      "Descubra todas as espécies de Pokémons",
                      style: TextStyle(
                        fontFamily: "Nunito",
                        color: Color(0xff2F3E77)
                      ),
                    ),

                    SizedBox(height: 15,),

                    InputSearchComponent(isMobile: false,),
                ],
              ),
            ),

            const SizedBox(height: 60),

            const Center(
              child: Text(
                "Pokedéx",
                style: TextStyle(
                  fontFamily: fontNunito,
                  color: primaryColor,
                  fontSize: 22,
                  fontWeight: FontWeight.w700
                ),
              ),
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: List.generate(
                10, 
                (index) => PokemonCardWebComponent(index: index,)
              ).toList(),
            )


          ],
        ),
      ),
    );
  }
}