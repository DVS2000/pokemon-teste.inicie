import 'package:flutter/material.dart';
import 'package:pokemon_teste/src/utils/const_utils.dart';

class TypeComponent extends StatelessWidget {
  final String title;
  final Color color;
  final Size? size;
  final double? borderRadius;
  final double? marginRight;
  const TypeComponent({
    Key? key, 
    required this.title, 
    required this.color, 
    this.size, 
    this.borderRadius, 
    this.marginRight
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size?.width ?? 67,
      height: size?.height ?? 24,
      margin: EdgeInsets.only(right: marginRight ?? 8),
      decoration: BoxDecoration(
        color: color, 
        borderRadius: BorderRadius.circular(borderRadius ?? 5)
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
