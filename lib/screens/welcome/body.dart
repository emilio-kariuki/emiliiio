// ignore_for_file: unnecessary_const

import 'package:emiliiio/Constants/colors.dart';
import "package:flutter/material.dart";
// ignore: unused_import
import 'package:flutter_svg/flutter_svg.dart';

class BackGround extends StatelessWidget {
  final Widget child;
  const BackGround({Key? key, required this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kprimaryColor,
      body: SafeArea(
        child: Stack(
          children: [
            child,
            Positioned(
                top: 0,
                left: 0,
                child: Image.asset("assets/main_top.png",
                    color: Color.fromARGB(255, 227, 236, 229),
                    height: 170)),
            Positioned(
                bottom: 0,
                left: 0,
                child: Image.asset("assets/main_bottom.png",
                    color: Color.fromARGB(255, 227, 236, 229),
                    height: 150)),
            Positioned(
                bottom: 0,
                right: 0,
                child: Image.asset("assets/login_bottom.png",
                    color: Color.fromARGB(255, 147, 150, 148),
                    height: 150))
          ],
        ),
      ),
    );
  }
}
