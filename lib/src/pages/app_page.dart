import 'package:flutter/material.dart';
import 'package:pokemon_teste/src/pages/details_pokemon_page/details_pokemon_page.dart';
import 'package:pokemon_teste/src/pages/home_page/home_page.dart';

class AppPage extends StatelessWidget {
  const AppPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Pokemon App",
      home: DetailsPokemonPage(),
    );
  }
}