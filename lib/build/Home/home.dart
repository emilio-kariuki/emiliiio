import 'package:emiliiio/authentication/register.dart';
import "package:flutter/material.dart";


class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      // ignore: prefer_const_constructors
      body: Center(
        child:const Text("welcome"),
      ),
    );
  }
}

