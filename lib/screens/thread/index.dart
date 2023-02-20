import 'package:flutter/material.dart';

class ThreadScreen extends StatefulWidget {
  final String url;
  final String name;
  final String thumbnail;

  const ThreadScreen({super.key, required this.url, required this.name, required this.thumbnail});

  @override
  State<ThreadScreen> createState() => ThreadScreenState();
}

class ThreadScreenState extends State<ThreadScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
