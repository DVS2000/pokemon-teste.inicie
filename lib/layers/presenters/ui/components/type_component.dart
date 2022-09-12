import 'package:flutter/material.dart';
import 'package:pokemon_teste/layers/presenters/ui/utils/const_utils.dart';

class TypeComponent extends StatelessWidget {
  final String title;
  final Color color;
  final Size? size;
  final double? borderRadius;
  final double? marginRight;
  final void Function()? onTap;
  final bool selected;
  const TypeComponent({
    Key? key, 
    required this.title, 
    required this.color, 
    this.size, 
    this.borderRadius, 
    this.marginRight,
    this.onTap,
    this.selected = false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(selected ? 1.5 : 0),
        margin: EdgeInsets.only(right: marginRight ?? 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(borderRadius ?? 5),
          border: selected ? Border.all(width: 1, color: color) : null
        ),
        child: Container(
          width: size?.width ?? 67,
          height: size?.height ?? 24,
          decoration: BoxDecoration(
            color: color, 
            borderRadius: BorderRadius.circular(borderRadius ?? 5),
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
        ),
      ),
    );
  }
}
