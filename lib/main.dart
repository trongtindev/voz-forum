import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'screens/launch/index.dart';
import 'package:google_fonts/google_fonts.dart';

main() => runApp(
      GetMaterialApp(
        home: const LaunchScreen(),
        theme: ThemeData(
          useMaterial3: true,
          textTheme: GoogleFonts.robotoTextTheme(),
        ),
        defaultTransition: Transition.rightToLeft,
      ),
    );
