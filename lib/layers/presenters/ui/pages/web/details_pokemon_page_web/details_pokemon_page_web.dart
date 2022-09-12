import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:pokemon_teste/layers/domain/entities/pokemon_entities.dart';
import 'package:pokemon_teste/layers/presenters/controllers/pokemon_controller/pokemon_controller.dart';
import 'package:pokemon_teste/layers/presenters/ui/utils/const_utils.dart';
import 'package:pokemon_teste/layers/presenters/ui/utils/size_device_util.dart';
import 'package:skeletons/skeletons.dart';

import '../../../components/type_component.dart';
import '../../mobile/details_pokemon_page/components/skills_component.dart';

class DetailsPokemonPageWeb extends StatefulWidget {
  final PokemonEntity pokemon;
  const DetailsPokemonPageWeb({Key? key, required this.pokemon}) : super(key: key);

  @override
  State<DetailsPokemonPageWeb> createState() => _DetailsPokemonPageWebState();
}

class _DetailsPokemonPageWebState extends State<DetailsPokemonPageWeb> {
  var pokemonController = GetIt.instance.get<PokemonController>();

  final scrollController = ScrollController();
  bool showShadowAppBar = false;

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      setState(() => showShadowAppBar = scrollController.offset > 2);
    });

    pokemonController.getDescriptionPokemonById(id: widget.pokemon.id);
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (ctx, orientation) {

        bool isMobile() => ctx.sizedDevice.width < 768;

        return Scaffold(
          body: Stack(
            children: [

              isMobile()
              ? const SizedBox()
              : Positioned(
                left: -40,
                top: 425,
                child: Image.asset(
                  "assets/imgs/circles3x.png",
                  width: 120,
                ),
              ),

              isMobile()
              ? const SizedBox()
              : Positioned(
                right: -20,
                top: 30,
                child: Image.asset(
                  "assets/imgs/circles3x.png",
                  width: 120,
                ),
              ),




              Scaffold(
                backgroundColor: Colors.transparent,
                appBar: AppBar(
                  elevation: showShadowAppBar ? 3 : 0,
                  centerTitle: true,
                  backgroundColor: !isMobile() ? Colors.transparent : const Color(0xffFAFAFA),
                  leading: const SizedBox(),
                  title: isMobile() 
                  ? Image.asset(
                    "assets/imgs/logo.png",
                    height: 60,
                  )
                  : const SizedBox(),
                ),
                body: SizedBox(
                  width: ctx.sizedDevice.width,
                  height: ctx.sizedDevice.height,
                  child: SingleChildScrollView(
                    controller: scrollController,
                    padding: EdgeInsets.only(
                      left: isMobile() ? 15 : 70,
                      right: isMobile() ? 15 : 0
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              isMobile()
                              ? const SizedBox()
                              : Image.asset(
                                "assets/imgs/logo.png",
                                height: 60,
                              ),
    
                              Text(
                                widget.pokemon.name.substring(0,1).toUpperCase() + widget.pokemon.name.substring(1, widget.pokemon.name.length),
                                style: TextStyle(
                                  fontFamily: fontNunito,
                                  color: primaryColor,
                                  fontSize: isMobile() ? 25 : 35,
                                  fontWeight: FontWeight.w700
                                ),
                              ),
    
                              !isMobile() 
                              ? const SizedBox()
                              : Text(
                                "Cod:   #${widget.pokemon.id}",
                                style: const TextStyle(
                                  fontFamily: fontNunito,
                                  color: primaryColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400
                                ),
                              ),
    
                              Row(
                                children: [

                                  isMobile()
                                  ? const SizedBox()
                                  : Text(
                                    "Cod:   #${widget.pokemon.id}",
                                    style: const TextStyle(
                                      fontFamily: fontNunito,
                                      color: primaryColor,
                                      fontSize: 22,
                                      fontWeight: FontWeight.w400
                                    ),
                                  ),

                                  isMobile() ? const SizedBox() : const Spacer(),

                                  const Text(
                                    "Tipo:",
                                    style: TextStyle(
                                      fontFamily: fontNunito,
                                      fontSize: 18,
                                      color: primaryColor,
                                      fontWeight: FontWeight.w400
                                    ),
                                  ),
    
                                  const SizedBox(width: 10,),
    
                                  TypeComponent(
                                    title: 
                                        widget.pokemon.types.first.substring(0,1).toUpperCase() 
                                        + widget.pokemon.types.first.substring(1,widget.pokemon.types.first.length), 
                                    color: const Color(0xffF7802A),
                                    size: const Size(60, 24),
                                    borderRadius: 2,
                                    marginRight: 0,
                                  )
                                ],
                              ),
                              !isMobile()
                              ? const SizedBox()
                              : Center(
                                child: Hero(
                                  tag: widget.pokemon.id.toInt(),
                                  child: Image.network(
                                    widget.pokemon.image,
                                    height: 230,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
    
                              const SizedBox(height: 20),
    
    
                              const Text(
                                "Descrição",
                                style: TextStyle(
                                  fontFamily: fontNunito,
                                  color: primaryColor,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w700
                                ),
                              ),
    
                              const SizedBox(height: 10),
    
                             Observer(builder: (_) {
                              return pokemonController.isLoading
                              ? Column(
                                  children: [
                                    SkeletonLine(
                                      style: SkeletonLineStyle(
                                        height: 16,
                                        width: 170,
                                        borderRadius: BorderRadius.circular(8)
                                      ),
                                    ),
                                    SkeletonLine(
                                      style: SkeletonLineStyle(
                                        height: 16,
                                        width: 154,
                                        borderRadius: BorderRadius.circular(8)
                                      ),
                                    )
                                  ],
                                ) 
                                : Text(
                                    '"${pokemonController.descriptionPokemon.replaceAll("\n", "")}"',
                                      style: const TextStyle(
                                        fontFamily: fontNunito,
                                        color: primaryColor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600
                                      ),
                                    );
                                  }
                              ),
    
                              const SizedBox(height: 20),
                              const Text(
                                "Informações",
                                style: TextStyle(
                                  color: primaryColor,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: fontNunito,
                                  fontSize: 22
                                ),
                              ),
                              const SizedBox(height: 10,),
    
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Altura:",
                                    style: TextStyle(
                                      color: primaryColor,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: fontNunito,
                                      fontSize: 18
                                    ),
                                  ),
                                  
                                  Text(
                                    "${widget.pokemon.height}cm",
                                    style: const TextStyle(
                                      fontFamily: fontNunito,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: primaryColor
                                    ),
                                  ),
                                ],
                              ),
    
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Peso:",
                                    style: TextStyle(
                                      color: primaryColor,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: fontNunito,
                                      fontSize: 18
                                    ),
                                  ),
                                  
                                  Text(
                                    "${widget.pokemon.weight}kg",
                                    style: const TextStyle(
                                      fontFamily: fontNunito,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: primaryColor
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
    
                              SizedBox(
                                width: context.sizedDevice.width / (isMobile() ? 1 : 3.2),
                                child: Column(
                                  children: widget.pokemon.stats.map((stat) => SkillsComponent(
                                      skill: stat.name, 
                                      color: colorsForSkills[widget.pokemon.stats.indexOf(stat)], 
                                      value: stat.value + 50,
                                      isMobile: false,
                                    ),
                                  ).toList(),
                                ),
                              )
                            ],
                          ),
                        ),

                        
                        SizedBox(width: isMobile() ? 0 : 100,),

                        isMobile()
                        ? const SizedBox()
                        : Expanded(
                          child: Center(
                            child: Container(
                              height: ctx.sizedDevice.width / 3,
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1,
                                  color: Colors.white
                                ),
                                shape: BoxShape.circle,
                              ),
                              child: Stack(
                                children: [
                                  Center(
                                    child: Image.network(
                                      widget.pokemon.image,
                                      height: ctx.sizedDevice.width / 3.5,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }
    );
  }

  final colorsForSkills = [
    const Color(0xffF7802A),
    const Color(0xffC4F789),
    const Color(0xffEA686D),
    Colors.purple,
    Colors.pink,
    Colors.blue,
    Colors.orange
  ];
}
