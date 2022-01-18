import 'package:appdev_task2/screens/userscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../constraints.dart';
import '../widgets/btext.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: RawScrollbar(
          thumbColor: bgcolor,
          isAlwaysShown: true,
          child: SingleChildScrollView(
            child: SizedBox(
              height: 1.3 * size.height,
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 45,
                            width: 45,
                            decoration: BoxDecoration(
                              color: const Color(0xff8f8f8f).withOpacity(0.1),
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(color: const Color(0xffd1d1d1)),
                            ),
                            child: InkWell(
                              onTap: () {
                                Get.to(() => const UserScreen());
                              },
                              child: Image.asset("assets/tiles.png", scale: 0.8),
                            ),
                          ),
                          Container(
                            height: 45,
                            width: 45,
                            decoration: BoxDecoration(
                              color: const Color(0xff8f8f8f).withOpacity(0.1),
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(color: const Color(0xffd1d1d1)),
                            ),
                            child: Image.asset("assets/bell.png", scale: 0.7),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: 55,
                            width: 270,
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: "Search here...",
                                hintStyle: const TextStyle(color: Color(0xff8F8F8F), fontSize: 20),
                                isDense: true,
                                filled: true,
                                fillColor: const Color(0xff8f8f8f).withOpacity(0.1),
                                suffixIcon: Image.asset("assets/search_icon.png", scale: 0.8),
                              ),
                              cursorColor: white,
                              style: const TextStyle(color: white, fontSize: 12),
                              keyboardType: TextInputType.emailAddress,
                            ),
                          ),
                          Container(
                            height: 55,
                            width: 55,
                            decoration: BoxDecoration(
                              color: const Color(0xff8f8f8f).withOpacity(0.1),
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(color: const Color(0xffd1d1d1)),
                            ),
                            child: Image.asset("assets/filter.png", scale: 0.8),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Container(
                        width: double.infinity,
                        height: 180,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(13),
                          color: const Color(0xff4474F6),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  BText(t: "Learn how to proctect\nyourself from Covid-19", s: 16),
                                  BText(t: "Get to know more about Covid-19\nand how to prevent it", s: 12),
                                  Container(
                                    height: 30,
                                    width: 120,
                                    decoration: BoxDecoration(
                                      color: white,
                                      borderRadius: BorderRadius.circular(3),
                                    ),
                                    child: Center(child: BText(t: "Learn More", s: 16, c: bgcolor)),
                                  ),
                                ],
                              ),
                            ),
                            Image.asset("assets/doctor.png", scale: 1.2),
                          ],
                        ),
                      ),
                    ),
                    // BText(t: "Get Popular covid services", s: 22, c: bgcolor),
                    Container(
                      height: 400,
                      width: 400,
                      child: GridView.builder(
                        itemCount: 4,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          final imagelist = [
                            Image.asset("assets/1.png", color: white),
                            Image.asset("assets/1.png", color: bgcolor),
                            Image.asset("assets/3.png", color: bgcolor),
                            Image.asset("assets/4.png", color: bgcolor)
                          ];
                          final text1list = ["Case suspected", "Case suspected", "Home Test", "Covid-19 Vaccine"];
                          final text2list = [
                            "Find new cases around\nyour area.",
                            "See covid hostpital\nnear you.",
                            "Register for covid-19\ntest now at your home!",
                            "Register for covid-19\nvaccine today!"
                          ];

                          return Padding(
                            padding: const EdgeInsets.all(14),
                            child: Material(
                              elevation: 10,
                              borderRadius: BorderRadius.circular(20),
                              color: (index == 0 ? bgcolor : white),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    imagelist[index],
                                    BText(t: text1list[index], s: 15, c: (index == 0 ? white : bgcolor)),
                                    BText(
                                      t: text2list[index],
                                      s: 12,
                                      c: (index == 0 ? white : bgcolor),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(14),
                      child: BText(t: "Are you feeling sick?", s: 24, c: bgcolor, w: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(14),
                      child: BText(
                        t: "Felling sick? We got you coverd follow\nthe stepsstated below.",
                        s: 17,
                        c: const Color(0xff8f8f8f),
                        w: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(14),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 60,
                            width: 150,
                            decoration: BoxDecoration(
                              color: bgcolor,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                width: 3,
                                color: const Color(0xffc2c2c2),
                              ),
                            ),
                            child: Center(child: BText(t: "Send Alert", s: 20, c: white)),
                          ),
                          Container(
                            height: 60,
                            width: 150,
                            decoration: BoxDecoration(
                              color: const Color(0xff7366FF),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                width: 3,
                                color: const Color(0xffc2c2c2),
                              ),
                            ),
                            child: Center(child: BText(t: "Call us!", s: 20, c: white)),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
