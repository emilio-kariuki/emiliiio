import 'package:emiliiio/Constants/colors.dart';
import "package:flutter/material.dart";

class BuildBack extends StatelessWidget {
  const BuildBack({Key? key}) : super(key: key);

  @override
  
  Widget build(BuildContext context) {
    return Container(
      width: 45,
      height: 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: kprimaryColor,
      ),
      padding: const EdgeInsets.all(8),
    );
  }
}