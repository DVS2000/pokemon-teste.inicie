import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:pokemon_teste/src/pages/mobile/intro_page/intro_page.dart';
import 'package:pokemon_teste/src/pages/web/home_page_web.dart';

class AppPage extends StatelessWidget {
  const AppPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Pokemon App",
      home: Platform.isAndroid || Platform.isIOS ? const IntroPage() : const HomePageWeb(),
    );
  }
}