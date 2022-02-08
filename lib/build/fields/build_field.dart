import 'package:emiliiio/Constants/colors.dart';
import "package:flutter/material.dart";

class BuildField extends StatelessWidget {
  final Widget child;
  const BuildField({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 4, 10, 0),
      child: Container(
        height: 60,
        width: mediaQuery.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: kaccentColor,
        ),
        child: child,
      ),
    );
  }
}
