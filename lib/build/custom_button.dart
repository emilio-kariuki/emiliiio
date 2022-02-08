// ignore_for_file: avoid_unnecessary_containers

import 'package:emiliiio/Constants/colors.dart';
import 'package:emiliiio/build/build_button.dart';
// import 'package:authentication/build/build_container.dart';
import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  final Function() func;
  final String action;
  const CustomButton({Key? key, required this.func, required this.action})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: func,
        child: BuildButton(color: kaccentColor, child: Center(child: Text(action,style: GoogleFonts.robotoCondensed(fontSize:22.1,color: kprimaryColor,fontWeight: FontWeight.bold)))),
      ),
    );
  }
}
