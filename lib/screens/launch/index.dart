import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:voz/config/api.dart';

import '../forum/index.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({super.key});

  @override
  State<LaunchScreen> createState() => LaunchScreenState();
}

class LaunchScreenState extends State<LaunchScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 250), onload);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  onload() {
    Dio().get(ApiConfig.baseUrl).then((response) {
      // if a live
      Get.offAll(() => const ForumScreen());
    }).catchError((error) {
      // WTF error
      print(error);
    });
  }
}
