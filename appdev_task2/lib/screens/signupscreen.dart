import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constraints.dart';
import '../widgets/btext.dart';
import 'homescreen.dart';
import 'loginscreen.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);

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
                    children: [
                      const Spacer(flex: 2),
                      BText(t: "Sign Up", s: 36),
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
                          hintText: "Full Name",
                          prefixIcon: Image.asset("assets/user_icon.png"),
                        ),
                        cursorColor: white,
                        style: const TextStyle(color: white, fontSize: 20),
                        keyboardType: TextInputType.name,
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
                      const Spacer(),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Confirm Password",
                          prefixIcon: Image.asset("assets/lock_icon.png"),
                        ),
                        cursorColor: white,
                        style: const TextStyle(color: white, fontSize: 20),
                        keyboardType: TextInputType.emailAddress,
                        obscureText: true,
                      ),
                      const Spacer(flex: 2),
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
                              Get.to(
                                () => const HomeScreen(),
                              );
                            },
                            child: BText(t: 'Sign Up', s: 28, c: bgcolor),
                          ),
                        ),
                      ),
                      const Spacer(flex: 2),
                      TextButton(
                        onPressed: () {
                          Get.to(
                            () => const LoginScreen(),
                          );
                        },
                        child: BText(t: "Login Instead", s: 16),
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
