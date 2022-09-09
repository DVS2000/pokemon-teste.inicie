import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokemon_teste/src/components/type_component.dart';
import 'package:pokemon_teste/src/pages/mobile/details_pokemon_page/components/skills_component.dart';
import 'package:pokemon_teste/src/utils/const_utils.dart';

class DetailsPokemonPage extends StatefulWidget {
  const DetailsPokemonPage({Key? key}) : super(key: key);

  @override
  State<DetailsPokemonPage> createState() => _DetailsPokemonPageState();
}

class _DetailsPokemonPageState extends State<DetailsPokemonPage> {
  final scrollController = ScrollController();
  bool showShadowAppBar = false;

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
                child: Image.asset(
                  "assets/imgs/pokemon1.png",
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
                      children: const [
                        Text(
                          "Charmeleon",
                          style: TextStyle(
                            fontFamily: fontNunito,
                            color: primaryColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w700
                          ),
                        ),

                        Spacer(),

                        Icon(
                          CupertinoIcons.heart,
                          color: Colors.grey,
                          size: 19,
                        ),
                        Icon(
                          Icons.share,
                          color: Colors.grey,
                          size: 19,
                        )
                      ],
                    ),

                    const SizedBox(height: 5,),

                    Row(
                      children: const [
                        Text(
                          "Cod: #0034",
                          style: TextStyle(
                            fontFamily: fontNunito,
                            fontSize: 14,
                            color: primaryColor,
                            fontWeight: FontWeight.w400
                          ),
                        ),

                        Spacer(),

                        TypeComponent(
                          title: "Fogo", 
                          color: Color(0xffF7802A),
                          size: Size(50, 22),
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

                    const Text(
                      '"Charmeleon destrói seus oponentes sem pena com suas garras afiadas. Torna-se agressivo quando encontra um oponente forte e então a chama na ponta da sua cauda queima intensamente em uma cor azulada."',
                      style: TextStyle(
                        fontFamily: fontNunito,
                        color: primaryColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w600
                      ),
                    ),

                    const SizedBox(height: 20),

                    const SkillsComponent(
                      skill: "Vida", 
                      color: Color(0xffF7802A), 
                      value: 150
                    ),
                    const SkillsComponent(
                      skill: "Defesa", 
                      color: Color(0xffC4F789), 
                      value: 100
                    ),
                    const SkillsComponent(
                      skill: "Ataque", 
                      color: Color(0xffEA686D), 
                      value: 125
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
}
