import 'package:appdev_task2/screens/loginscreen.dart';
import 'package:appdev_task2/screens/userscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../constraints.dart';
import '../widgets/btext.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {

  void init() async {
    await Future.delayed(const Duration(seconds: 3));
    Get.to(
      () => LoginScreen(),
      transition: Transition.rightToLeft,
      duration: const Duration(milliseconds: 500),
    );
  }

  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: bgcolor,
      body: Center(
        child: Column(
          children: [
            const Spacer(flex: 3),
            SvgPicture.asset("assets/logo.svg"),
            const Spacer(),
            BText(t: "MEDICOREX", s: 42, c: white),
            const SizedBox(height: 7),
            BText(t: "Health is ours, not mine", s: 20, c: white),
            const Spacer(flex: 2),
            const SpinKitPulse(
              color: white,
              size: 60,
            ),
            const Spacer(flex: 3),
          ],
        ),
      ),
    );
  }
}
