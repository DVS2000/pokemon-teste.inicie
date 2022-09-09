import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:pokemon_teste/src/pages/mobile/intro_page/intro_page.dart';
import 'package:pokemon_teste/src/pages/web/home_page_web/home_page_web.dart';

// ignore: must_be_immutable
class AppPage extends StatelessWidget {
  AppPage({ Key? key }) : super(key: key);

  bool isMobile = false; 
  void validatePlataform() {

    /* 
      SEMPRE QUE TENTAMOS PEGAR A PLATAFORMA 
      VIA WEB ELE APRESENTA UM ERRO (EXCEPTION) 
      POR ISSO CRIEI ESSA FUNÇÃO E COLOQUEI 
      DENTRO DE UM TRYCATCH 
    */
    try {
     isMobile = Platform.isAndroid || Platform.isIOS;
    } catch (e) {
      isMobile = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Pokemon App",
      home: isMobile ? const IntroPage() : const HomePageWeb(),
    );
  }
}