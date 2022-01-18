import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constraints.dart';


class BText extends StatelessWidget {
  BText({
    Key? key,
    required this.t,
    this.c,
    required this.s,
    this.w,
  }) : super(key: key);

  String t;
  Color? c;
  double s;
  FontWeight? w;

  @override
  Widget build(BuildContext context) {
    return Text(
      t,
      style: TextStyle(
        color: c ?? white,
        fontSize: s,
        fontFamily: GoogleFonts.readexPro().fontFamily,
        fontWeight: w,
      ),
    );
  }
}