// ignore_for_file: unused_import

import 'package:emiliiio/Constants/colors.dart';
import 'package:emiliiio/authentication/register.dart';
import 'package:emiliiio/build/custom_box.dart';
import 'package:emiliiio/build/custom_button.dart';
import 'package:emiliiio/build/fields/build_circle.dart';
import 'package:emiliiio/build/fields/custom_field.dart';
import 'package:emiliiio/firebase.dart/auth.dart';
import "package:flutter/material.dart";
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import "package:firebase_auth/firebase_auth.dart";

class Login extends StatefulWidget {
  const Login({Key? key, }) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final email = TextEditingController();
  final password = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kprimaryColor,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                // mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: CustomBox(
                        func: () {
                          setState(() {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => const Register()));
                          });
                        },
                        iconUrl: 'assets/icons/register.png',
                        action: "Register"),
                  ),
                ],
              ),
              Row(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Expanded(
                      child: Container(
                    margin: const EdgeInsets.only(left: 15, right: 10),
                    child: const Divider(
                      thickness: 0.5,
                      height: 40,
                      color: kaccentColor,
                    ),
                  )),
                ],
              ),
              Text("Login",
                  style: GoogleFonts.robotoCondensed(
                      fontSize: 23, color: Colors.white)),
              Padding(
                padding: const EdgeInsets.only(bottom: 40, top: 10),
                child: Center(
                    child: SvgPicture.asset(
                  "assets/svg/login.svg",
                  height: mediaQuery.height * 0.3,
                )),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      // icon: Icon(Icons.person,size:30,color: Colors.black),
                      filled: true,
                      hintStyle: TextStyle(color: Colors.grey[800]),
                      focusColor: Colors.red,
                      hintText: "Email",
                      prefixIcon: const Icon(Icons.mail,
                          color: kprimaryColor, size: 20),
                      fillColor: Colors.grey[200]),
                  controller: email,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      // icon: Icon(Icons.person,size:30,color: Colors.black),
                      filled: true,
                      hintStyle: TextStyle(color: Colors.grey[800]),
                      focusColor: Colors.red,
                      hintText: "Password",
                      prefixIcon: const Icon(Icons.lock,
                          color: kprimaryColor, size: 20),
                      fillColor: Colors.grey[200]),
                  controller: password,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 70, right: 70, top: 40, bottom: 10),
                child: CustomButton(
                    func: () {
                      setState(() {
                        if (email.text == "" && password.text == "") {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              content: (Text("The fields cannot be empty",
                                  style: GoogleFonts.roboto(
                                      fontSize: 19, color: kaccentColor))),
                              backgroundColor:
                                  const Color.fromARGB(255, 165, 123, 32),
                              duration: const Duration(milliseconds: 900)));
                        } else {
                          Auth().login(email.text, password.text, context);
                        }
                      });
                    },
                    action: "Login"),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Expanded(
                        child: Container(
                      margin: const EdgeInsets.only(left: 15, right: 10),
                      child: const Divider(
                        thickness: 0.5,
                        height: 50,
                        color: kaccentColor,
                      ),
                    )),
                    Text("OR",
                        style: GoogleFonts.roboto(
                            fontSize: 20, color: kaccentColor)),
                    Expanded(
                        child: Container(
                      margin: const EdgeInsets.only(left: 15, right: 10),
                      child: const Divider(
                        thickness: 0.5,
                        height: 40,
                        color: kaccentColor,
                      ),
                    )),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  BuildCircle(
                    svgUrl: "assets/svg/google.svg",
                    func: () {},
                  ),
                  BuildCircle(
                    svgUrl: "assets/svg/facebook-main.svg",
                    func: () {},
                  ),
                  BuildCircle(
                    svgUrl: "assets/svg/twitter-main.svg",
                    func: () {},
                  )
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }

  
}
