import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_teste/src/pages/home_page/components/header_home_component.dart';
import 'package:pokemon_teste/src/utils/const_utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            backgroundColor: Colors.transparent,

            leading: const Icon(
              Icons.menu,
              color: Color(0xff2F3E77),
            ),

            title: Image.asset(
              "assets/imgs/Logo.png",
              height: 60,
            ),

            actions: const [
              CircleAvatar(
                backgroundImage: AssetImage("assets/imgs/user.png"),
              ),

              SizedBox(width: 15,)
            ],
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [

              SizedBox(height: 10,),
              HeaderHomeComponent()
            ],
          ),
        ),

        Positioned(
            right: 0,
            top: 55,
            child: Image.asset(
              "assets/imgs/circles_right.png",
              width: 55,

            ),
          )
      ],
    );
  }
}