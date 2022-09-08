import 'package:flutter/material.dart';
import 'package:pokemon_teste/src/pages/intro_page/intro_page.dart';

class AppPage extends StatelessWidget {
  const AppPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Pokemon App",
      home: IntroPage(),
    );
  }
}