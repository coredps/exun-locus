import 'package:appdev_task2/screens/loginscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

import '../constraints.dart';
import '../widgets/btext.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: white,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.west,
            color: bgcolor,
            size: 35,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const GFAvatar(
                  backgroundImage: AssetImage("assets/pfp.png"),
                  shape: GFAvatarShape.circle,
                  size: 90,
                ),
                Material(
                  elevation: 10,
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    height: 55,
                    width: 350,
                    child: Row(
                      children: [
                        Expanded(child: Image.asset("assets/user2.png", scale: 0.8)),
                        Expanded(flex: 3, child: BText(t: "My Account", s: 28, c: bgcolor)),
                        const Expanded(child: Icon(Icons.east, color: Color(0xffd1d2da), size: 34))
                      ],
                    ),
                  ),
                ),
                Material(
                  elevation: 10,
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    height: 55,
                    width: 350,
                    child: Row(
                      children: [
                        Expanded(child: Image.asset("assets/bell2.png", scale: 0.8)),
                        Expanded(flex: 3, child: BText(t: "Notifications", s: 28, c: bgcolor)),
                        const Expanded(child: Icon(Icons.east, color: Color(0xffd1d2da), size: 34))
                      ],
                    ),
                  ),
                ),
                Material(
                  elevation: 10,
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    height: 55,
                    width: 350,
                    child: Row(
                      children: [
                        Expanded(child: Image.asset("assets/settings.png", scale: 0.8)),
                        Expanded(flex: 3, child: BText(t: "Settings", s: 28, c: bgcolor)),
                        const Expanded(child: Icon(Icons.east, color: Color(0xffd1d2da), size: 34))
                      ],
                    ),
                  ),
                ),
                Material(
                  elevation: 10,
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    height: 55,
                    width: 350,
                    child: Row(
                      children: [
                        Expanded(child: Image.asset("assets/quesmark.png", scale: 0.8)),
                        Expanded(flex: 3, child: BText(t: "Help center", s: 28, c: bgcolor)),
                        const Expanded(child: Icon(Icons.east, color: Color(0xffd1d2da), size: 34))
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.to(
                      () => const LoginScreen(),
                    );
                  },
                  child: Material(
                    elevation: 10,
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      height: 55,
                      width: 350,
                      child: Row(
                        children: [
                          Expanded(child: Image.asset("assets/logout.png", scale: 0.8)),
                          Expanded(flex: 3, child: BText(t: "Logout", s: 28, c: const Color(0xffFF6258))),
                          const Expanded(child: Icon(Icons.east, color: Color(0xffd1d2da), size: 34))
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
