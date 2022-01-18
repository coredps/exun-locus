import 'package:appdev_task2/screens/homescreen.dart';
import 'package:appdev_task2/screens/signupscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../constraints.dart';
import '../widgets/btext.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgcolor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.9,
            child: Form(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Spacer(flex: 3),
                      SvgPicture.asset(
                        "assets/logo.svg",
                        height: 70,
                      ),
                      const Spacer(flex: 3),
                      BText(t: "Login", s: 36),
                      const Spacer(flex: 2),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Email ID",
                          prefixIcon: Image.asset("assets/mail_icon.png"),
                        ),
                        cursorColor: white,
                        style: const TextStyle(color: white, fontSize: 20),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const Spacer(),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Password",
                          prefixIcon: Image.asset("assets/lock_icon.png"),
                        ),
                        cursorColor: white,
                        style: const TextStyle(color: white, fontSize: 20),
                        obscureText: true,
                      ),
                      SizedBox(height: 10),
                      Row(children: [const Spacer(), BText(t: "Forgot Password?", s: 16)]),
                      const Spacer(flex: 3),
                      Container(
                        width: double.infinity,
                        height: 56,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: white,
                        ),
                        child: Center(
                          child: TextButton(
                            onPressed: () {
                              Get.to(() => const HomeScreen());
                            },
                            child: BText(t: 'Login', s: 28, c: bgcolor),
                          ),
                        ),
                      ),
                      const Spacer(flex: 5),
                      TextButton(
                        onPressed: () {
                          Get.to(
                            () => const SignupScreen(),
                          );
                        },
                        child: BText(t: "New here? Register", s: 16),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
