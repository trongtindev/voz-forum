/*
 * Nguyen Trong Tin | trongtin.dev@gmail.com
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'config/theme.dart';
import 'screens/launch/index.dart';

main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    GetMaterialApp(
      home: const LaunchScreen(),
      theme: ThemeConfig.light,
      defaultTransition: Transition.rightToLeft,
      debugShowCheckedModeBanner: false,
    ),
  );
}
