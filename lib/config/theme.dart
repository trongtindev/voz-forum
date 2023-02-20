/*
 * Nguyen Trong Tin | trongtin.dev@gmail.com
 */

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// TODO
class ThemeConfig {
  static ThemeData dark = ThemeData(
    // primaryColor: Color(0xff5c7099),
    textTheme: GoogleFonts.robotoTextTheme(),
  );

  static ThemeData light = ThemeData(
    // scaffoldBackgroundColor: Color(0xff343a40),
    textTheme: GoogleFonts.robotoTextTheme(),
    colorScheme: const ColorScheme(
      surface: Color(0xff343a40),
      background: Color(0xfff3f3f3),
      onBackground: Colors.white,
      primary: Color(0xff5c7099),
      onPrimary: Colors.white,
      brightness: Brightness.light,
      error: Colors.red,
      onError: Colors.yellow,
      onSecondary: Colors.deepOrange,
      onSurface: Colors.white,
      secondary: Colors.pinkAccent,
    ),
    useMaterial3: true,
  );
}
