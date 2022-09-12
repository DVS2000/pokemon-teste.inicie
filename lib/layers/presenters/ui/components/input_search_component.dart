import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_teste/layers/presenters/ui/utils/const_utils.dart';
import 'package:pokemon_teste/layers/presenters/ui/utils/size_device_util.dart';

class InputSearchComponent extends StatelessWidget {
  final bool isMobile;
  final TextEditingController textEditingController;
  final void Function()? onTapSearch;
  const InputSearchComponent({Key? key, this.isMobile = true, required this.textEditingController, this.onTapSearch}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return 
    SizedBox(
      height: isMobile ? 31 : 44,
      width: context.sizedDevice.width / (isMobile ? 1.8 : 1),
      child: Row(
        children: [
          Expanded(
            child: Container(
              width: 123,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(width: 1, color: const Color(0xffF4F4F4)),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(5),
                  bottomLeft: Radius.circular(6)
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.15),
                    offset: Offset(0.0, 4.0),
                    blurRadius: 15
                  )
                ]
              ),
              child: TextField(
                controller: textEditingController,
                style: const TextStyle(
                  color: primaryColor, 
                  fontFamily: fontNunito
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(
                    bottom: isMobile ? 17 : 8, 
                    left: 5
                  )
                ),
              ),
            ),
          ),

          // Button Search
          GestureDetector(
            onTap: onTapSearch,
            child: Container(
              width: isMobile ? 40 : 106,
              decoration: const BoxDecoration(
                color: secundaryColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(5),
                  bottomRight: Radius.circular(6)
                ),
                boxShadow: [
                  BoxShadow(
                    color: secundaryColor,
                    offset: Offset(0.0, 4.0),
                    blurRadius: 15)
                ]
              ),
              alignment: Alignment.center,
              child: isMobile 
              ? const Icon(
                CupertinoIcons.search,
                color: Colors.white,
              )
              : const Text(
                "Buscar",
                style: TextStyle(
                  fontFamily: fontNunito,
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                  color: Colors.white
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
