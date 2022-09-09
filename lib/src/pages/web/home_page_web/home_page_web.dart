import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_teste/src/helpers/enum_device_category.dart';
import 'package:pokemon_teste/src/pages/web/components/pokemon_card_web_component.dart';
import 'package:pokemon_teste/src/pages/web/home_page_web/header_home_component_web.dart';
import 'package:pokemon_teste/src/utils/const_utils.dart';
import 'package:pokemon_teste/src/utils/size_device_util.dart';

class HomePageWeb extends StatefulWidget {
  const HomePageWeb({ Key? key }) : super(key: key);

  @override
  State<HomePageWeb> createState() => _HomePageWebState();
}

class _HomePageWebState extends State<HomePageWeb> {
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
                              children: const [
      

                                CircleAvatar(
                                  backgroundColor: secundaryColor,
                                  child: Center(
                                    child: Icon(
                                      CupertinoIcons.back,
                                      color: Colors.white,
                                      size: 25,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10,),
                                CircleAvatar(
                                  backgroundColor: secundaryColor,
                                  child: Center(
                                    child: Icon(
                                      CupertinoIcons.forward,
                                      color: Colors.white,
                                      size: 25,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),

                      ctx.sizedDevice.width <= 768 
                      ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: List.generate(
                          10, 
                          (index) => PokemonCardWebComponent(index: index,)
                        ).toList(),
                      )
    
                      : GridView.count(
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
                          children: List.generate(10, (index) => PokemonCardWebComponent(
                            index: index, 
                            marginTop: 0,
                          )
                        ),
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