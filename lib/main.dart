/*
 * Nguyen Trong Tin | trongtin.dev@gmail.com
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'screens/launch/index.dart';
import 'package:google_fonts/google_fonts.dart';

main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    GetMaterialApp(
      home: const LaunchScreen(),
      theme: ThemeData(
        primaryColor: const Color(0xff5c7099),
        primaryIconTheme: const IconThemeData(
          color: Color(0xff5c7099),
        ),
        useMaterial3: true,
        textTheme: GoogleFonts.robotoTextTheme(),
      ),
      defaultTransition: Transition.rightToLeft,
      debugShowCheckedModeBanner: false,
    ),
  );
}
