// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_app/src/constants/color.dart';

class TTextTheme {
  static TextTheme lightTextTheme = TextTheme(
    headline1: GoogleFonts.montserrat(
        fontSize: 28.0, fontWeight: FontWeight.bold, color: tDarkColor),
    headline2: GoogleFonts.montserrat(
        fontSize: 24.0, fontWeight: FontWeight.w700, color: tDarkColor),
    headline3: GoogleFonts.poppins(
        fontSize: 24.0, fontWeight: FontWeight.w600, color: tDarkColor),
    headline4: GoogleFonts.poppins(
        fontSize: 18.0, fontWeight: FontWeight.w600, color: tDarkColor),
    headline6: GoogleFonts.poppins(
        fontSize: 14, fontWeight: FontWeight.w600, color: tDarkColor),
    bodyText1: GoogleFonts.poppins(
        fontSize: 14.0, fontWeight: FontWeight.normal, color: tDarkColor),
    bodyText2: GoogleFonts.poppins(
        fontSize: 14.0, fontWeight: FontWeight.normal, color: tDarkColor),
    subtitle2: GoogleFonts.poppins(color: Colors.black54, fontSize: 24),
    subtitle1: GoogleFonts.poppins(
        color: tDarkColor, fontWeight: FontWeight.w400, fontSize: 14),
  );
  static TextTheme darkTextTheme = TextTheme(
    headline1: GoogleFonts.montserrat(
        fontSize: 28.0, fontWeight: FontWeight.bold, color: tWhiteColor),
    headline2: GoogleFonts.montserrat(
        fontSize: 24.0, fontWeight: FontWeight.w700, color: tWhiteColor),
    headline3: GoogleFonts.poppins(
        fontSize: 24.0, fontWeight: FontWeight.w600, color: tWhiteColor),
    headline4: GoogleFonts.poppins(
        fontSize: 18.0, fontWeight: FontWeight.w600, color: tWhiteColor),
    headline6: GoogleFonts.poppins(
        fontSize: 14, fontWeight: FontWeight.w600, color: tWhiteColor),
    bodyText1: GoogleFonts.poppins(
        fontSize: 14.0, fontWeight: FontWeight.normal, color: tWhiteColor),
    bodyText2: GoogleFonts.poppins(
        fontSize: 14.0, fontWeight: FontWeight.normal, color: tWhiteColor),
    subtitle2: GoogleFonts.poppins(color: tWhiteColor, fontSize: 24),
    subtitle1: GoogleFonts.poppins(
        color: tWhiteColor, fontWeight: FontWeight.bold, fontSize: 14),
  );
}
