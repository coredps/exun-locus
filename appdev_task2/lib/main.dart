import 'package:appdev_task2/screens/signupscreen.dart';
import 'package:appdev_task2/screens/userscreen.dart';
import 'package:appdev_task2/screens/welcome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constraints.dart';
import 'screens/homescreen.dart';
import 'screens/loginscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: white,
        fontFamily: GoogleFonts.readexPro().fontFamily,
        inputDecorationTheme: InputDecorationTheme(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: BorderSide(
              color: const Color(0xffd0d0d0).withOpacity(0.4),
              width: 3,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: BorderSide(
              color: const Color(0xffd0d0d0).withOpacity(0.4),
              width: 3,
            ),
          ),
          hintStyle: const TextStyle(fontSize: 20, color: white),
        ),
      ),
      home: const WelcomeScreen(),
    );
  }
}
