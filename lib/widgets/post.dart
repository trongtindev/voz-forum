import 'package:flutter/material.dart';

class LaunchScreen extends StatefulWidget {
  final String url;
  final String name;
  final String thumbnail;

  const LaunchScreen({super.key, required this.url, required this.name, required this.thumbnail});

  @override
  State<LaunchScreen> createState() => LaunchScreenState();
}

class LaunchScreenState extends State<LaunchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
