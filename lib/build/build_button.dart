import "package:flutter/material.dart";

class BuildButton extends StatelessWidget {
  final Color color;
  final Widget child;
  const BuildButton({Key? key, required this.color, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Container(
        height: 50,
        width: mediaQuery.width ,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.all(12),
        child: child,
    );
  }
}
