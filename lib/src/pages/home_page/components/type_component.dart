import 'package:flutter/material.dart';
import 'package:pokemon_teste/src/utils/const_utils.dart';

class TypeComponent extends StatelessWidget {
  final String title;
  final Color color;
  const TypeComponent({Key? key, required this.title, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 67,
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        color: color, 
        borderRadius: BorderRadius.circular(5)
      ),
      alignment: Alignment.center,
      child: Text(
        title,
        style: const TextStyle(
          fontFamily: fontNunito,
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: Colors.white
        ),
      ),
    );
  }
}
