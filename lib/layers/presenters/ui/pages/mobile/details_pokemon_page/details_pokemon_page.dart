import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:pokemon_teste/layers/domain/entities/pokemon_entities.dart';
import 'package:pokemon_teste/layers/presenters/controllers/pokemon_controller/pokemon_controller.dart';
import 'package:pokemon_teste/layers/presenters/ui/utils/const_utils.dart';
import 'package:skeletons/skeletons.dart';

import '../../../components/type_component.dart';
import 'components/skills_component.dart';

class DetailsPokemonPage extends StatefulWidget {
  final PokemonEntity pokemon;
  const DetailsPokemonPage({Key? key, required this.pokemon}) : super(key: key);

  @override
  State<DetailsPokemonPage> createState() => _DetailsPokemonPageState();
}

class _DetailsPokemonPageState extends State<DetailsPokemonPage> {
  final scrollController = ScrollController();
  bool showShadowAppBar = false;

  var pokemonController = GetIt.instance.get<PokemonController>();

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
    return Scaffold(
      appBar: AppBar(
        elevation: showShadowAppBar ? 3 : 0,
        centerTitle: true,
        backgroundColor: const Color(0xffF9F2F3),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Color(0xff2F3E77),
            size: 18,
          ),
          onPressed: () => Get.back(),
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
          SizedBox(
            width: 15,
          )
        ],
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          controller: scrollController,
          padding: EdgeInsets.zero,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 320,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(241, 176, 179, 0.1),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)
                  )
                ),
                alignment: Alignment.center,
                child: Image.network(
                  widget.pokemon.image,
                  height: 210,
                  fit: BoxFit.cover,
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          widget.pokemon.name.substring(0,1).toUpperCase() + widget.pokemon.name.substring(1, widget.pokemon.name.length),
                          style: const TextStyle(
                            fontFamily: fontNunito,
                            color: primaryColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w700
                          ),
                        ),

                        const Spacer(),

                        const Icon(
                          CupertinoIcons.heart,
                          color: Colors.grey,
                          size: 19,
                        ),
                        const Icon(
                          Icons.share,
                          color: Colors.grey,
                          size: 19,
                        )
                      ],
                    ),

                    const SizedBox(height: 5,),

                    Row(
                      children: [
                        Text(
                          "Cod: #${widget.pokemon.id}",
                          style: const TextStyle(
                            fontFamily: fontNunito,
                            fontSize: 14,
                            color: primaryColor,
                            fontWeight: FontWeight.w400
                          ),
                        ),

                        const Spacer(),

                        TypeComponent(
                          title: widget.pokemon.types.first, 
                          color: const Color(0xffF7802A),
                          size: const Size(50, 22),
                          borderRadius: 2,
                          marginRight: 0,
                        )
                      ],
                    ),

                    const SizedBox(height: 20),


                    const Text(
                      "Descrição",
                      style: TextStyle(
                        fontFamily: fontNunito,
                        color: primaryColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w700
                      ),
                    ),

                    const SizedBox(height: 10),

                    

                    Observer(
                      builder: (_) {
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
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600
                                ),
                              );
                            }
                        ),

                    const SizedBox(height: 20),

                    Column(
                      children: widget.pokemon.stats.map((stat) => SkillsComponent(
                        skill: stat.name, 
                        color: colorsForSkills[widget.pokemon.stats.indexOf(stat)], 
                        value: stat.value + 50,
                      ),
                      ).toList(),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
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
