import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:voz/helpers/api.dart';
import 'package:voz/interfaces/comment.dart';
import 'package:voz/interfaces/thread.dart';
import 'package:voz/screens/thread/views/comment.dart';

class ThreadScreen extends StatefulWidget {
  final ThreadInterface thread;

  const ThreadScreen({super.key, required this.thread});

  @override
  State<ThreadScreen> createState() => ThreadScreenState();
}

class ThreadScreenState extends State<ThreadScreen> {
  List<CommentInterface> comments = [];

  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 250), onload);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.thread.name,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.only(top: 10),
        itemCount: comments.isEmpty ? 10 : comments.length,
        itemBuilder: (_, index) {
          if (comments.isEmpty) {
            return Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
              child: Comment.normal(null),
            );
          }
          return Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
            child: Comment.normal(comments[index]),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.edit_outlined),
        onPressed: () {},
      ),
    );
  }

  onload() {
    ApiHelper.getComments(widget.thread.url).then((value) {
      if (mounted) {
        comments = value;
        setState(() {});
        print(comments);
      }
    }).catchError((error) {
      Get.back();
      Get.showSnackbar(
        GetSnackBar(
          message: error.toString(),
          duration: const Duration(seconds: 3),
        ),
      );
    });
  }
}
