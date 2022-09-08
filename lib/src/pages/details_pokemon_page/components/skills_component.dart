import 'package:flutter/material.dart';
import 'package:pokemon_teste/src/utils/const_utils.dart';

class SkillsComponent extends StatelessWidget {
  final String skill;
  final Color color;
  final double value;
  const SkillsComponent({
    Key? key, 
    required this.skill, 
    required this.color, 
    required this.value 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
         SizedBox(
          width: 80,
           child: Text(
              skill,
              style: const TextStyle(
                fontFamily: fontNunito,
                color: primaryColor,
                fontSize: 12,
                fontWeight: FontWeight.w600
              ),
            ),
         ),

          Expanded(
            child: Stack(
              children: [
                Container(
                  height: 12,
                  decoration: BoxDecoration(
                    color: const Color(0xffFBFDFF),
                    borderRadius: BorderRadius.circular(4)
                  ),
                ),
                Container(
                  height: 12,
                  width: value,
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(4)
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
