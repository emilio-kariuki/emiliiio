// ignore_for_file: avoid_unnecessary_containers

import 'package:emiliiio/Constants/colors.dart';
import 'package:emiliiio/build/build_container.dart';
import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';

class CustomBox extends StatelessWidget {
  final Function() func;
  final String iconUrl;
  final String action;
  const CustomBox({Key? key, required this.func, required this.iconUrl, required this.action})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: func,
        child: BuildContainer(
          color: kaccentColor,
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(action,style: GoogleFonts.robotoCondensed(fontSize: 12,color: Color.fromARGB(255, 17, 10, 48),fontWeight: FontWeight.bold)),
              const SizedBox(width:6),
              Image.asset(iconUrl, color: Color.fromARGB(255, 17, 10, 48),height: 25,),
            ],
          ),
        ),
      ),
    );
  }
}
