import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:pokemon_teste/layers/domain/entities/pokemon_entities.dart';
import 'package:pokemon_teste/layers/presenters/controllers/pokemon_controller/pokemon_controller.dart';
import 'package:pokemon_teste/layers/presenters/ui/components/loaders_components/loader_home_web.dart';
import 'package:pokemon_teste/layers/presenters/ui/pages/mobile/details_pokemon_page/details_pokemon_page.dart';
import 'package:pokemon_teste/layers/presenters/ui/pages/mobile/intro_page/component/custom_button_component.dart';
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
    TypeModel(title: "Fogo", color: const Color(0xffF1AFB2), idText: "fire"),
    TypeModel(title: "Normal", color: const Color(0xff49D0B0), idText: "normal"),
    TypeModel(title: "Elétrico", color: Colors.yellow, idText: "electric"),
    TypeModel(title: "Brigando", color: const Color(0xff9E81A9), idText: "fighting"),
    TypeModel(title: "Voador", color: const Color(0xff2E7885), idText: "flying"),
    TypeModel(title: "Bug", color: const Color(0xff383332), idText: "bug")
  ];

  String typeSelected = "";

  List<MenuModel> menus = [
    MenuModel(title: "Home", icon: CupertinoIcons.home),
    MenuModel(title: "Favoritos", icon: CupertinoIcons.heart),
    MenuModel(title: "Minha Conta", icon: CupertinoIcons.person_alt_circle)
  ];

  final scrollController = ScrollController();
  bool showShadowAppBar = false;

  TextEditingController textEditingController = TextEditingController();

  final pokemonController = GetIt.instance.get<PokemonController>();

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      setState(() => showShadowAppBar = scrollController.offset > 2);
    });

    pokemonController.getPokemons();
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
                    onTapSearch: () => pokemonController.search(text: textEditingController.text.trim())
                      .then((value) {
                        
                        if(value.isLeft()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                "Pokémon não encontrado",
                                style: TextStyle(fontFamily: fontNunito, fontSize: 18) ,
                              )
                            )
                          );
                        } else {

                        late PokemonEntity pokemon;
                        value.fold((l) => null, (r) => pokemon = r);
                        
                        Get.to(
                          DetailsPokemonPage(pokemon: pokemon)
                         );
                        }
                      }
                    ),
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
                      children: types.map(
                        (type) => TypeComponent(
                          title: type.title, 
                          color: type.color,
                          selected: typeSelected == type.idText,
                          onTap: () {
                            setState(() => typeSelected = typeSelected == type.idText ? "" : type.idText);
                            typeSelected == type.idText
                              ? pokemonController.getPokemonsByType(type: type.idText)
                              : pokemonController.getPokemons();
                          },
                        )
                        ).toList(),
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

                  Observer(
                    builder: (_) {
                      return pokemonController.isLoading && pokemonController.pokemons.isEmpty
                      ? const LoaderHomeWeb(widthDevice: 767)
                      : Column(
                        children: [
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
                            children: pokemonController.pokemons.map((pokemon) => PokemonCardComponent(
                              pokemon: pokemon,
                            )).toList(),
                          ),

                          const SizedBox(height: 20,),
                          CustomButtonComponent(
                            title: pokemonController.isLoading
                              ? "Carregando..." 
                              : "Carregar mais",
                            ontap: pokemonController.isLoading 
                              ? () {} 
                              : () => pokemonController.getPokemons(),
                          )
                        ],
                      );
                    }
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
  final String idText;
  final String title;
  final Color color;

  TypeModel({ required this.title, required this.color, required this.idText });
}

class MenuModel {
  final String title;
  final IconData icon;

  MenuModel({ required this.title, required this.icon });
}