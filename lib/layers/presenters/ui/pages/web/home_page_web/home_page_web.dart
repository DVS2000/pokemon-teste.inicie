import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:pokemon_teste/layers/domain/entities/pokemon_entities.dart';
import 'package:pokemon_teste/layers/presenters/controllers/pokemon_controller/pokemon_controller.dart';
import 'package:pokemon_teste/layers/presenters/ui/components/loaders_components/loader_home_web.dart';
import 'package:pokemon_teste/layers/presenters/ui/helpers/chunks_list.dart';
import 'package:pokemon_teste/layers/presenters/ui/pages/mobile/intro_page/component/custom_button_component.dart';
import 'package:pokemon_teste/layers/presenters/ui/pages/web/details_pokemon_page_web/details_pokemon_page_web.dart';
import 'package:pokemon_teste/layers/presenters/ui/utils/const_utils.dart';
import 'package:pokemon_teste/layers/presenters/ui/utils/size_device_util.dart';

import '../../../helpers/enum_device_category.dart';
import '../components/pokemon_card_web_component.dart';
import 'header_home_component_web.dart';

class HomePageWeb extends StatefulWidget {
  const HomePageWeb({ Key? key }) : super(key: key);

  @override
  State<HomePageWeb> createState() => _HomePageWebState();
}

class _HomePageWebState extends State<HomePageWeb> {

  var pokemonController = GetIt.instance.get<PokemonController>();
  TextEditingController textEditingController = TextEditingController();
  final pageController = PageController();
  
  previewPage() {
    pageController.previousPage(
      duration: const Duration(milliseconds: 150), 
      curve: Curves.easeIn
    );
  }

  nextPage() {
    if(pageController.page!.toInt() + 1 == (chunks(pokemonController.pokemons, 10).length)) {
      pokemonController.getPokemons().then(
        (_) {
          Future.delayed(const Duration(milliseconds: 150),() {
            pageController.animateToPage(
              chunks(pokemonController.pokemons, 10).length, 
              duration: const Duration(milliseconds: 150), 
              curve: Curves.easeIn
            );
          });
        }    
      );

    } else {
      Future.delayed(const Duration(milliseconds: 150),() {
        pageController.animateToPage(
          pageController.page!.toInt() + 1, 
          duration: const Duration(milliseconds: 150), 
          curve: Curves.easeIn
        );
      });
    }
  }

  @override
  void initState() {
    pokemonController.getPokemons();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (ctx, orientation) {

        bool isMobile() => ctx.sizedDevice.width < 768;
        bool isTablet() => ctx.sizedDevice.width >= 768 && ctx.sizedDevice.width <= 992; 

        return Scaffold(
          body: Stack(
            children: [

              isMobile()
              ? const SizedBox()
              : Positioned(
                left: -40,
                top: 425,
                child: Image.asset(
                  "assets/imgs/circles_right.png",
                  width: 120,
                ),
              ),

              Scaffold(
                backgroundColor: Colors.transparent,
                body: SingleChildScrollView(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      HeaderHomeComponentWeb(
                        textEditingController: textEditingController,
                        onTapSearch: () => pokemonController.search(text: textEditingController.text.trim())
                          .then((value) {
                            if(value.isLeft()) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text(
                                  "Pokémon não encontrado",
                                  style: TextStyle(fontFamily: fontNunito, fontSize: 18) ,
                                  )
                                )
                              );
                            } else {

                              late PokemonEntity pokemon;

                              value.fold((l) => null, (r) => pokemon = r);
                              Get.to(
                                DetailsPokemonPageWeb(pokemon: pokemon)
                              );
                            }
                          }),
                        category: isMobile() 
                          ? DeviceCategory.phone 
                          : isTablet() 
                              ? DeviceCategory.tablet 
                              : DeviceCategory.desktop
                      ),
                          
                      SizedBox(height: isMobile() ? 50 : 20),
    
                      Padding(
                        padding: EdgeInsets.only(
                          left: 18,
                          right: 18,
                          bottom: isMobile() ? 0 : 20
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Pokedéx",
                              style: TextStyle(
                                fontFamily: fontNunito,
                                color: primaryColor,
                                fontSize: isMobile() ? 22 : 30,
                                fontWeight: FontWeight.w700
                              ),
                            ),

                            isMobile()
                            ? const SizedBox()
                            : const Spacer(),

                            isMobile()
                            ? const SizedBox()
                            : Row(
                              children: [
      

                                GestureDetector(
                                  onTap: () => previewPage(),
                                  child: const CircleAvatar(
                                    backgroundColor: secundaryColor,
                                    child: Center(
                                      child: Icon(
                                        CupertinoIcons.back,
                                        color: Colors.white,
                                        size: 25,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10,),

                                GestureDetector(
                                  onTap: () => nextPage(),
                                  child: const CircleAvatar(
                                    backgroundColor: secundaryColor,
                                    child: Center(
                                      child: Icon(
                                        CupertinoIcons.forward,
                                        color: Colors.white,
                                        size: 25,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
    
                      Observer(
                          builder: (_) {
                            return pokemonController.isLoading && pokemonController.pokemons.isEmpty
                            ? LoaderHomeWeb(widthDevice: ctx.sizedDevice.width,)
                            : isMobile() 
                              ? Column(
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: pokemonController.pokemons.map(
                                      (pokemon) => PokemonCardWebComponent(
                                        marginTop: 15,
                                        pokemon: pokemon,
                                      )
                                    ).toList(),
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
                              ) 
                              : pokemonController.isLoading && pokemonController.pokemons.isNotEmpty
                                  ? LoaderHomeWeb(widthDevice: ctx.sizedDevice.width,)
                                  : SizedBox(
                                      width: context.sizedDevice.width,
                                      height: context.sizedDevice.height / (isTablet() ? 0.5 : 1.3),
                                      child: PageView(
                                        controller: pageController,
                                        physics: const NeverScrollableScrollPhysics(),
                                        children: chunks(pokemonController.pokemons, 10).map((pokemons) => GridView.count(
                                          physics: const NeverScrollableScrollPhysics(),
                                          padding: const EdgeInsets.only(
                                            left: 15, 
                                            right: 15, 
                                            bottom: 25
                                          ),
                                          shrinkWrap: true,
                                          crossAxisCount: isTablet() ? 3 : 5,
                                          crossAxisSpacing: 20,
                                          mainAxisSpacing: 10,
                                          childAspectRatio: ctx.sizedDevice.width / (isTablet() ? 1000 : 1500),
                                          children: pokemons.map(
                                            (pokemon) => PokemonCardWebComponent(
                                              marginTop: 0,
                                              pokemon: pokemon,
                                            )
                                          ).toList(),
                                        )).toList(),
                                      ),
                                    );
                          }
                       )
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}