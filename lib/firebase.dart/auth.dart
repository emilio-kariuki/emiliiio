// ignore_for_file: avoid_print, prefer_const_constructors, unused_import

import 'package:emiliiio/Constants/colors.dart';
import 'package:emiliiio/authentication/login.dart';
import 'package:firebase_core/firebase_core.dart';
import "package:flutter/material.dart";

import "package:firebase_auth/firebase_auth.dart";
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';


class Auth {
  FirebaseAuth auth = FirebaseAuth.instance;
  User? user = FirebaseAuth.instance.currentUser;

  //Register user
  Future register(String email, String password, BuildContext context) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
          await user?.sendEmailVerification();
      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            elevation: 10,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            content: (Text("The password is to weak",
                style: GoogleFonts.roboto(fontSize: 19, color: kaccentColor))),
            backgroundColor: const Color.fromARGB(255, 165, 123, 32),
            duration: const Duration(milliseconds: 900)));
      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            elevation: 10,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            content: (Text("The account already exists for that email",
                style: GoogleFonts.roboto(fontSize: 19, color: kaccentColor))),
            backgroundColor: const Color.fromARGB(255, 165, 123, 32),
            duration: const Duration(milliseconds: 900)));
      }
    } catch (e) {
      print(e);
    }
  }

  Future login(String email, String password, BuildContext context) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            elevation: 10,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            content: (Text("No user found for that email",
                style: GoogleFonts.roboto(fontSize: 19, color: kaccentColor))),
            backgroundColor: const Color.fromARGB(255, 165, 123, 32),
            duration: const Duration(milliseconds: 900)));
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            elevation: 10,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            content: (Text("Wrong password Try again",
                style: GoogleFonts.roboto(fontSize: 19, color: kaccentColor))),
            backgroundColor: const Color.fromARGB(255, 165, 123, 32),
            duration: const Duration(milliseconds: 900)));
      }
    }
  }

  
}
