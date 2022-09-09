import 'package:flutter/material.dart';
import 'package:pokemon_teste/src/components/type_component.dart';
import 'package:pokemon_teste/src/pages/mobile/details_pokemon_page/components/skills_component.dart';
import 'package:pokemon_teste/src/utils/const_utils.dart';
import 'package:pokemon_teste/src/utils/size_device_util.dart';

class DetailsPokemonPageWeb extends StatefulWidget {
  final String heroTag;
  const DetailsPokemonPageWeb({Key? key, required this.heroTag}) : super(key: key);

  @override
  State<DetailsPokemonPageWeb> createState() => _DetailsPokemonPageWebState();
}

class _DetailsPokemonPageWebState extends State<DetailsPokemonPageWeb> {
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
                                "Charmeleon",
                                style: TextStyle(
                                  fontFamily: fontNunito,
                                  color: primaryColor,
                                  fontSize: isMobile() ? 25 : 35,
                                  fontWeight: FontWeight.w700
                                ),
                              ),
    
                              !isMobile() 
                              ? const SizedBox()
                              : const Text(
                                "Cod:   #0034",
                                style: TextStyle(
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
                                  : const Text(
                                    "Cod:   #0034",
                                    style: TextStyle(
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
    
                                  const TypeComponent(
                                    title: "Fogo", 
                                    color: Color(0xffF7802A),
                                    size: Size(52, 24),
                                    borderRadius: 2,
                                    marginRight: 0,
                                  )
                                ],
                              ),
                              !isMobile()
                              ? const SizedBox()
                              : Center(
                                child: Hero(
                                  tag: widget.heroTag,
                                  child: Image.asset(
                                    "assets/imgs/pokemon1.png",
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
    
                              const Text(
                                '"Charmeleon destrói seus oponentes sem pena com suas garras afiadas. Torna-se agressivo quando encontra um oponente forte e então a chama na ponta da sua cauda queima intensamente em uma cor azulada."',
                                style: TextStyle(
                                  fontFamily: fontNunito,
                                  color: primaryColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600
                                ),
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
                                children: const [
                                  Text(
                                    "Altura:",
                                    style: TextStyle(
                                      color: primaryColor,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: fontNunito,
                                      fontSize: 18
                                    ),
                                  ),
                                  
                                  Text(
                                    "1.10cm",
                                    style: TextStyle(
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
                                children: const [
                                  Text(
                                    "Peso:",
                                    style: TextStyle(
                                      color: primaryColor,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: fontNunito,
                                      fontSize: 18
                                    ),
                                  ),
                                  
                                  Text(
                                    "30kg",
                                    style: TextStyle(
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
                                  children: const [
                                    SkillsComponent(
                                      skill: "Vida", 
                                      color: Color(0xffF7802A), 
                                      value: 150,
                                      isMobile: false,
                                    ),
                                    SkillsComponent(
                                      skill: "Defesa", 
                                      color: Color(0xffC4F789), 
                                      value: 100,
                                      isMobile: false,
                                    ),
                                    SkillsComponent(
                                      skill: "Velocidade", 
                                      color: Colors.green, 
                                      value: 125,
                                      isMobile: false,
                                    ),
                                    SkillsComponent(
                                      skill: "Ataque", 
                                      color: Color(0xffEA686D), 
                                      value: 125,
                                      isMobile: false,
                                    ),
                                  ],
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
                                    child: Image.asset(
                                      "assets/imgs/pokemon1.png",
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
}
