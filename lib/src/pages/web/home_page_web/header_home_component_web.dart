import 'package:flutter/material.dart';
import 'package:pokemon_teste/src/components/input_search_component.dart';
import 'package:pokemon_teste/src/helpers/enum_device_category.dart';

class HeaderHomeComponentWeb extends StatelessWidget {
  final DeviceCategory category;
  const HeaderHomeComponentWeb({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return category == DeviceCategory.phone 
    ? Column(
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
          padding: const EdgeInsets.symmetric(horizontal: 20),
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
              ),

              SizedBox(
                height: 10,
              ),
              Text(
                "Descubra todas as espécies de Pokémons",
                style:
                  TextStyle(
                    fontFamily: "Nunito", 
                    color: Color(0xff2F3E77)
                  ),
              ),

              SizedBox(
                height: 15,
              ),

              InputSearchComponent(
                isMobile: false,
              ),
            ],
          ),
        ),
      ],
    )
    : Padding(
      padding: const EdgeInsets.only(
        left: 40,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  "assets/imgs/logo.png",
                  height: 70,
                ),
                const Text.rich(
                  TextSpan(
                    text: 'Explore o mundo\ndos ',
                    style: TextStyle(
                      fontFamily: "Nunito",
                      fontSize: 55,
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
                ),

                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Descubra todas as espécies de Pokémons",
                  style:
                    TextStyle(
                      fontFamily: "Nunito", 
                      color: Color(0xff2F3E77),
                      fontSize: 25
                    ),
                ),

                const SizedBox(
                  height: 15,
                ),

                const Padding(
                  padding: EdgeInsets.only(
                    right: 150
                  ),
                  child: InputSearchComponent(
                    isMobile: false,
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: Image.asset(
              "assets/imgs/intro_web.png",
              height: 420,
              //fit: BoxFit.fi,
            ),
          ),
        ],
      ),
    );
  }
}
