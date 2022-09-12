import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_teste/layers/presenters/ui/utils/const_utils.dart';

import '../../../components/type_component.dart';
import 'components/header_home_component.dart';
import 'components/pokemon_card_component.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<TypeModel> types = [
    TypeModel(title: "Fogo", color: const Color(0xffF1AFB2)),
    TypeModel(title: "Normal", color: const Color(0xff49D0B0)),
    TypeModel(title: "Ar", color: const Color(0xff9E81A9)),
    TypeModel(title: "Terra", color: const Color(0xff2E7885)),
    TypeModel(title: "Pedra", color: const Color(0xff383332))
  ];

  List<MenuModel> menus = [
    MenuModel(title: "Home", icon: CupertinoIcons.home),
    MenuModel(title: "Favoritos", icon: CupertinoIcons.heart),
    MenuModel(title: "Minha Conta", icon: CupertinoIcons.person_alt_circle)
  ];

  final scrollController = ScrollController();
  bool showShadowAppBar = false;

  TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      setState(() => showShadowAppBar = scrollController.offset > 2);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          Positioned(
            left: 0,
            top: 280,
            child: Image.asset(
              "assets/imgs/circles_right.png",
              width: 55,
            ),
          ),

          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              elevation: showShadowAppBar ? 3 : 0,
              centerTitle: true,
              backgroundColor: const Color(0xffFAFAFA),

              leading: const Icon(
                Icons.menu,
                color: Color(0xff2F3E77),
              ),

              title: Image.asset(
                "assets/imgs/logo.png",
                height: 60,
              ),

              actions: const [
                CircleAvatar(
                  radius: 16,
                  backgroundImage: AssetImage("assets/imgs/user.png"),
                ),

                SizedBox(width: 15,)
              ],
            ),
            body: SingleChildScrollView(
              controller: scrollController,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  const SizedBox(height: 10,),
                  HeaderHomeComponent(
                    textEditingController: textEditingController,
                  ),

                  const Padding(
                    padding: EdgeInsets.only(
                      left: 15,
                      top: 20,
                      bottom: 10
                    ),
                    child: Text(
                      "Tipo",
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w700
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 25,
                    child: ListView(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      scrollDirection: Axis.horizontal,
                      children: types.map((type) => TypeComponent(title: type.title, color: type.color)).toList(),
                    ),
                  ),

                  const Padding(
                    padding: EdgeInsets.only(
                      left: 15,
                      top: 25,
                      bottom: 10
                    ),
                    child: Text(
                      "Mais procurados",
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w700
                      ),
                    ),
                  ),

                  GridView.count(
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.only(
                      left: 15,
                      right: 15,
                      bottom: 25
                    ),
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 1.5,
                    children: List.generate(8, (index) => const PokemonCardComponent()),
                  )
                ],
              ),
            ),
            bottomNavigationBar: Container(
              height: 57,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20)
                )
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: menus.map((option) => Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      option.icon,
                      color: menus.indexOf(option) == 0 ? primaryColor : Colors.grey,
                    ),
                    Text(
                      option.title,
                      style: TextStyle(
                        fontFamily: fontNunito,
                        color: menus.indexOf(option) == 0 ? primaryColor : Colors.grey,
                      ),
                    )
                  ],
                )).toList(),
              ),
            ),
          ),

          Positioned(
            right: 0,
            top: 55,
            child: Image.asset(
              "assets/imgs/circles_right.png",
              width: 55,
            ),
          ),
        ],
      ),
    );
  }
}

class TypeModel {
  final String title;
  final Color color;

  TypeModel({ required this.title, required this.color });
}

class MenuModel {
  final String title;
  final IconData icon;

  MenuModel({ required this.title, required this.icon });
}