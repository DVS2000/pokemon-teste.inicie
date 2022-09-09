import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'mobile/intro_page/intro_page.dart';
import 'web/home_page_web/home_page_web.dart';

class AppPage extends StatefulWidget {
  const AppPage({ Key? key }) : super(key: key);

  @override
  State<AppPage> createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
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
  void initState() {
    validatePlataform();
    super.initState();
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