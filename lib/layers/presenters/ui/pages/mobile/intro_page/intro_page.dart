import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../home_page/home_page.dart';
import 'component/custom_button_component.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                Image.asset(
                  "assets/imgs/intro.png",
                  fit: BoxFit.cover,
                ),

                Positioned(
                  left: 30,
                  child: Image.asset(
                    "assets/imgs/logo.png",
                    width: 100,
                  ),
                )
              ],
            ),

            const Text.rich(
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
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 10,),

            const Text(
              "Descubra todas as espécies de Pokémons",
              style: TextStyle(
                fontFamily: "Nunito",
                color: Color(0xff2F3E77)
              ),
            ),

            const SizedBox(height: 15,),

            CustomButtonComponent(
              title: "Começar",
              ontap: () => Get.to(const HomePage()),
            )
          ],
        ),
      ),
    );
  }
}