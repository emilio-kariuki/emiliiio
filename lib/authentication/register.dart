// ignore_for_file: unnecessary_const, prefer_const_constructors, unused_local_variable, avoid_print

import 'package:emiliiio/Constants/colors.dart';
import 'package:emiliiio/authentication/login.dart';
import 'package:emiliiio/build/custom_box.dart';
import 'package:emiliiio/build/custom_button.dart';
import 'package:emiliiio/build/fields/build_circle.dart';
import 'package:emiliiio/firebase.dart/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:email_validator/email_validator.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  GoogleSignIn googleSignIn = GoogleSignIn(scopes: ["email"]);
  final name = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  bool isUserNameValidate = false;
  FirebaseAuth auth = FirebaseAuth.instance;
  final formKey = GlobalKey<FormState>();
  late String namme;

  @override
  Widget build(BuildContext context) {
    GoogleSignInAccount? user = googleSignIn.currentUser;

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
                                    builder: (context) => const Login()));
                          });
                        },
                        iconUrl: 'assets/icons/login.png',
                        action: "Login"),
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
              Text("Sign Up",
                  style: GoogleFonts.robotoCondensed(
                      fontSize: 23, color: Colors.white)),
              Padding(
                padding: const EdgeInsets.only(bottom: 20, top: 10),
                child: Center(
                    child: SvgPicture.asset(
                  "assets/svg/signup.svg",
                  height: mediaQuery.height * 0.3,
                )),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                child: TextFormField(
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(Icons.close, color: kprimaryColor),
                        onPressed: () => name.clear(),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      // icon: Icon(Icons.person,size:30,color: Colors.black),
                      filled: true,
                      hintStyle: TextStyle(color: Colors.grey[800]),
                      focusColor: Colors.red,
                      hintText: "Username",
                      prefixIcon: const Icon(Icons.person,
                          color: kprimaryColor, size: 20),
                      fillColor: Colors.grey[200]),
                  controller: name,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                child: TextFormField(
                  key: formKey,
                  // validator: (email) =>
                  //     email != null && !EmailValidator.validate(email)
                  //         ? "Enter a valid Email"
                  //         : null,
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(Icons.close, color: kprimaryColor),
                        onPressed: () => email.clear(),
                      ),
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
                  controller: password,
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(Icons.close, color: kprimaryColor),
                        onPressed: () => password.clear(),
                      ),
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
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: 70, right: 70, top: 20, bottom: 10),
                child: CustomButton(
                    func: () {
                      setState(() {
                        if (name.text == "" &&
                            email.text == "" &&
                            password.text == "") {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              content: (Text("The fields cannot be empty",
                                  style: GoogleFonts.roboto(
                                      fontSize: 19, color: kaccentColor))),
                              backgroundColor:
                                  Color.fromARGB(255, 165, 123, 32),
                              duration: Duration(milliseconds: 900)));
                        } else {
                          Auth().register(email.text, password.text, context);
                          print("successful");
                        }
                      });
                      print("Clicked");
                    },
                    action: "Register"),
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
                    func: () async {
                      await googleSignIn.signIn();

                      setState(() {
                        namme = user?.displayName.toString() as String;
                      });
                    },
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

  bool validateTextField(String userInput) {
    if (userInput.isEmpty) {
      setState(() {
        isUserNameValidate = true;
      });
      return false;
    }
    setState(() {
      isUserNameValidate = false;
    });
    return true;
  }
}
