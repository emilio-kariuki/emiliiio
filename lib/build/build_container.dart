import "package:flutter/material.dart";

class BuildContainer extends StatelessWidget {
  final Color color;
  final Widget child;
  const BuildContainer({Key? key, required this.color, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 80,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(7),
      child: child,
    );
  }
}
