import 'package:flutter/material.dart';
import 'package:pokemon_teste/layers/presenters/ui/utils/const_utils.dart';

class SkillsComponent extends StatelessWidget {
  final String skill;
  final Color color;
  final double value;
  final bool isMobile;
  const SkillsComponent({
    Key? key, 
    required this.skill, 
    required this.color, 
    required this.value,
    this.isMobile = true 
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
          width: isMobile ? 100 : 140,
           child: Text(
              skill.substring(0,1).toUpperCase() + skill.substring(1, skill.length),
              style: TextStyle(
                fontFamily: fontNunito,
                color: primaryColor,
                fontSize: isMobile ? 12 : 16,
                fontWeight: FontWeight.w600
              ),
            ),
         ),

          Expanded(
            child: Stack(
              children: [
                Container(
                  height: isMobile ? 12 : 22,
                  decoration: BoxDecoration(
                    color: const Color(0xffFBFDFF),
                    borderRadius: BorderRadius.circular(isMobile ? 4 : 2)
                  ),
                ),
                Container(
                  height: isMobile ? 12 : 22,
                  width: value,
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(isMobile ? 4 : 2)
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
