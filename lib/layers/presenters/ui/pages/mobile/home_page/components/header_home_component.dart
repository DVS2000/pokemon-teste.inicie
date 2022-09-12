import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_teste/layers/presenters/ui/utils/const_utils.dart';

import '../../../../components/input_search_component.dart';

class HeaderHomeComponent extends StatelessWidget {
  final TextEditingController textEditingController;
  final void Function()? onTapSearch;
  const HeaderHomeComponent({Key? key, required this.textEditingController, this.onTapSearch}) : super(key: key,);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 152,
      margin: const EdgeInsets.symmetric(horizontal: 15),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(241, 176, 179, 0.1),
        borderRadius: BorderRadius.circular(20)
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Pokedéx",
                style: TextStyle(
                  fontFamily: fontNunito,
                  color: primaryColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w700
                ),
              ),
              const Text(
                "Todas as espécies de pokemons\nestão esperando por você!",
                style: TextStyle(
                  fontFamily: fontNunito, 
                  fontSize: 14, 
                  color: primaryColor
                ),
              ),

              InputSearchComponent(
                textEditingController: textEditingController,
                onTapSearch: onTapSearch,
              )
            ],
          ),
          Expanded(
            child: Image.asset("assets/imgs/Picatxu.png"),
          )
        ],
      ),
    );
  }
}
